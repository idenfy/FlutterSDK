import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:idenfy_sdk_flutter/idenfy_sdk_flutter.dart';
import 'package:idenfy_sdk_flutter/models/IdenfyFaceAuthUISettings.dart';
import 'constants.dart' as Constants;
import 'package:idenfy_sdk_flutter/models/FaceAuthenticationResult.dart';
import 'main.dart';

class FaceAuthenticationStartScreen extends StatefulWidget {
  @override
  State<FaceAuthenticationStartScreen> createState() =>
      _FaceAuthenticationStartScreenState();
}

class _FaceAuthenticationStartScreenState
    extends State<FaceAuthenticationStartScreen> {
  FaceAuthenticationResult? _faceAuthenticationResult;
  Exception? _exception;

  TextEditingController _textFieldController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textFieldController.dispose();
  }

  Future<String> getFaceAuthTokenType(
      String scanref, String authenticationMethod) async {
    final queryParameters = {
      'method': authenticationMethod,
    };
    final response = await http.get(
      Uri.https(
          Constants.BASE_URL,
          '/identification/facial-auth/$scanref/check-status/',
          queryParameters),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization':
            'Basic ${base64Encode(utf8.encode('${Constants.apiKey}:${Constants.apiSecret}'))}',
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["type"];
    } else {
      throw Exception('Failed to fetch token type');
    }
  }

  Future<String> getFaceAuthTokenRequest(String scanref, String tokenType,
      String authenticationMethod) async {
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
        "type": tokenType,
        "method": authenticationMethod
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["token"];
    } else {
      throw Exception('Failed to fetch token');
    }
  }

  Future<void> initIdenfyFaceAuth(String scanref) async {
    String authenticationMethod = "FACE_MATCHING";

    FaceAuthenticationResult? faceAuthenticationResult;
    Exception? localException;
    try {
      String faceAuthTokenType =
          await getFaceAuthTokenType(scanref, authenticationMethod);
      String token = "";
      switch (faceAuthTokenType) {
        case 'AUTHENTICATION':
          //The user can authenticate by face
          token = await getFaceAuthTokenRequest(
              scanref, faceAuthTokenType, authenticationMethod);
          break;
        default:
          //The user must perform an identification
          break;
      }
      
      IdenfyFaceAuthUISettings settings = IdenfyFaceAuthUIBuilder()
          .withLanguageSelection(true)
          .withOnBoardingView(true)
          .build();

      faceAuthenticationResult = await IdenfySdkFlutter.startFaceAuth(
          token, false,
          idenfyFaceAuthUISettings: settings);
    } on Exception catch (e) {
      localException = e;
    }

    setState(() {
      _faceAuthenticationResult = faceAuthenticationResult;
      _exception = localException;
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
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
              _faceAuthenticationResult != null
                  ? faceAuthResult()
                  : (_exception != null ? exceptionTitle() : Container()),
              Spacer(),
              beginIdentificationButton()
            ],
          ),
        ),
      ),
    );
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
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(83, 109, 254, 1),
                ),
              ),
              hintText: "ScanRef",
              counterText: '',
              hintStyle: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.normal),
              labelStyle: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.normal),
            ),
            maxLength: 50,
            textAlign: TextAlign.start,
            onChanged: (String code) => {setState(() => {})}),
      ),
    );
  }

  Widget faceAuthResult() {
    return _faceAuthenticationResult == null
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
                      text: "FaceAuthenticationStatus:  \n",
                      style: TextStyle(
                          height: 4,
                          color: Color.fromRGBO(83, 109, 254, 1),
                          fontFamily: "HKGrotesk_bold",
                          fontSize: 18)),
                  TextSpan(
                    text:
                        "${_faceAuthenticationResult!.faceAuthenticationStatus}",
                    style: TextStyle(
                        fontFamily: "HKGrotesk_regular", fontSize: 14),
                  ),
                ],
              ),
            ),
          );
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
              text: _exception.toString(),
              style: TextStyle(
                  height: 4,
                  color: Colors.red,
                  fontFamily: "HKGrotesk_bold",
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
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
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: InkWell(
          onTap: _textFieldController.text.isEmpty
              ? null
              : () => initIdenfyFaceAuth(_textFieldController.text),
          child: Center(
            child: Text(
              "BEGIN AUTHENTICATION",
              style:
                  TextStyle(fontFamily: "HKGrotesk_bold", color: Colors.white),
            ),
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
            child: Text(
              "Sample iDenfy App",
              style: TextStyle(fontFamily: "HKGrotesk_bold", fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              "Enter an identification scanRef and begin the authentication process!",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "HKGrotesk_regular", fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
