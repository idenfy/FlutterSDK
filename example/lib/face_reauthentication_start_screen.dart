import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:idenfy_sdk_flutter/idenfy_sdk_flutter.dart';
import 'constants.dart' as Constants;
import 'package:idenfy_sdk_flutter/models/FaceReauthenticationResult.dart';

import 'main.dart';

class FaceReathenticationStartScreen extends StatefulWidget {
  @override
  State<FaceReathenticationStartScreen> createState() =>
      _FaceReathenticationStartScreenState();
}

class _FaceReathenticationStartScreenState
    extends State<FaceReathenticationStartScreen> {
  FaceReauthenticationResult? _faceReauthenticationResult;
  Exception? exception;

  TextEditingController _textFieldController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textFieldController.dispose();
  }

  Future<String> getFaceReauthTokenRequest(String scanref) async {
    final response = await http.post(
      Uri.https(Constants.BASE_URL, '/partner/authentication-info'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Basic ' +
            base64Encode(
                utf8.encode('${Constants.apiKey}:${Constants.apiSecret}')),
      },
      body: jsonEncode(<String, String>{
        "scanRef": scanref,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["token"];
    } else {
      throw Exception('Failed to fetch token');
    }
  }

  Future<void> initIdenfyFaceReauth(String scanref) async {
    FaceReauthenticationResult? faceReauthenticationResult;
    Exception? localException;
    try {
      String token = await getFaceReauthTokenRequest(scanref);
      faceReauthenticationResult =
          await IdenfySdkFlutter.startFaceReauth(token, false);
    } on Exception catch (e) {
      localException = e;
    }

    setState(() {
      _faceReauthenticationResult = faceReauthenticationResult;
      exception = localException;
      _textFieldController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  icon: Icon(Icons.arrow_back,
                      color: Color.fromRGBO(83, 109, 254, 1))),
              title: Image.asset('assets/ic_idenfy_logo_vector_v2.png',
                  width: 70, fit: BoxFit.cover),
              centerTitle: true,
              backgroundColor: Colors.white,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
            ),
            body: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Column(
                  children: [
                    topTitle(),
                    Spacer(),
                    centerInput(),
                    Spacer(),
                    _faceReauthenticationResult != null
                        ? faceReauthResult()
                        : (exception != null ? exceptionTitle() : Container()),
                    Spacer(),
                    beginIdentificationButton()
                  ],
                ))));
  }

  Widget centerInput() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
            width: 300,
            child: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                    labelText: "ScanRef",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(83, 109, 254, 1))),
                    hintText: "ScanRef",
                    counterText: '',
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.normal),
                    labelStyle: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.normal)),
                maxLength: 50,
                textAlign: TextAlign.start,
                onChanged: (String code) => {setState(() => {})})));
  }

  Widget faceReauthResult() {
    return _faceReauthenticationResult == null
        ? Container()
        : Container(
            child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: "FaceReauthenticationStatus:  \n",
                    style: TextStyle(
                        height: 4,
                        color: Color.fromRGBO(83, 109, 254, 1),
                        fontFamily: "HKGrotesk_bold",
                        fontSize: 18)),
                TextSpan(
                    text:
                        "${_faceReauthenticationResult!.faceReauthenticationStatus}",
                    style: TextStyle(
                        fontFamily: "HKGrotesk_regular", fontSize: 14)),
              ],
            ),
          ));
  }

  Widget exceptionTitle() {
    return Container(
        child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: exception.toString(),
              style: TextStyle(
                  height: 4,
                  color: Colors.red,
                  fontFamily: "HKGrotesk_bold",
                  fontSize: 18)),
        ],
      ),
    ));
  }

  Widget beginIdentificationButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 24, right: 24),
      child: Container(
        height: 42,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                if (_textFieldController.text.isEmpty) ...[
                  Colors.grey.withOpacity(0.6),
                  Colors.grey.withOpacity(0.6)
                ] else ...[
                  Color.fromRGBO(83, 109, 254, 1),
                  Color.fromRGBO(141, 108, 251, 1)
                ]
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: InkWell(
          onTap: _textFieldController.text.isEmpty
              ? null
              : () {
                  initIdenfyFaceReauth(_textFieldController.text);
                },
          child: Center(
            child: Text("BEGIN REAUTHENTICATION",
                style: TextStyle(
                    fontFamily: "HKGrotesk_bold", color: Colors.white)),
          ),
        ),
      ),
    );
  }

  Widget topTitle() {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text("Sample iDenfy App",
              style: TextStyle(fontFamily: "HKGrotesk_bold", fontSize: 22)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Text(
              "Enter an identification scanRef and begin the reauthentication process!",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "HKGrotesk_regular", fontSize: 14)),
        ),
      ],
    ));
  }
}
