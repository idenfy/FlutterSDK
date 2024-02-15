import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:idenfy_sdk_flutter/idenfy_sdk_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:idenfy_sdk_flutter/models/idenfy_identification_status.dart';
import 'constants.dart' as Constants;
import 'face_authentication_start_screen.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  IdenfyIdentificationResult? _idenfySDKresult;
  Exception? _exception;

  @override
  void initState() {
    super.initState();
  }

  Future<String> getAuthTokenRequest() async {
    final response = await http.post(
      Uri.https(Constants.BASE_URL, '/api/v2/token'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization':
            'Basic ${base64Encode(utf8.encode('${Constants.apiKey}:${Constants.apiSecret}'))}',
      },
      body: jsonEncode(<String, String>{
        "clientId": Constants.clientId,
      }),
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body)["authToken"];
    } else {
      throw Exception('Failed to fetch token');
    }
  }

  Future<void> initIdenfySdk() async {
    IdenfyIdentificationResult? idenfySDKresult;
    Exception? localException;
    try {
      String authToken = await getAuthTokenRequest();
      idenfySDKresult = await IdenfySdkFlutter.start(authToken);
    } on Exception catch (e) {
      localException = e;
    }

    setState(() {
      _idenfySDKresult = idenfySDKresult;
      _exception = localException;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/ic_idenfy_logo_vector_v2.png',
              width: 70, fit: BoxFit.cover),
          centerTitle: true,
          backgroundColor: Colors.white,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topTitle(),
            Spacer(),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              backgroundColor: Colors.transparent,
                              disabledBackgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                  'assets/idenfy_ic_documents_type_selection_passport_front_v2.png',
                                  width: 90,
                                  fit: BoxFit.fitWidth),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "IDENTIFICATION UI",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            ],
                          ),
                          onPressed: initIdenfySdk)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: VerticalDivider(color: Colors.black, thickness: 1.2),
                  ),
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              backgroundColor: Colors.transparent,
                              disabledBackgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Image.asset(
                                    'assets/idenfy_ic_face_step_v2.png',
                                    width: 90,
                                    fit: BoxFit.fitWidth),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, right: 8),
                                child: Text(
                                  "FACE AUTHENTICATION",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FaceAuthenticationStartScreen(),
                              ),
                            );
                          }))
                ],
              ),
            ),
            Spacer(),
            _idenfySDKresult != null
                ? idenfyResult()
                : (_exception != null ? exceptionTitle() : Container()),
            Spacer(),
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
    ));
  }

  Widget idenfyResult() {
    return _idenfySDKresult == null
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
                    text: "IdenfyIdentificationStatus:  \n",
                    style: TextStyle(
                        height: 4,
                        color: Color.fromRGBO(83, 109, 254, 1),
                        fontFamily: "HKGrotesk_bold",
                        fontSize: 18),
                  ),
                  TextSpan(
                    text:
                        "${_idenfySDKresult!.autoIdentificationStatus} \n ${_idenfySDKresult!.manualIdentificationStatus} \n autoSuspected: ${_idenfySDKresult!.suspectedIdentificationStatus.autoSuspected} \n manualSuspected: ${_idenfySDKresult!.suspectedIdentificationStatus.manualSuspected}",
                    style: TextStyle(
                        fontFamily: "HKGrotesk_regular", fontSize: 14),
                  ),
                ],
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
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "Press button to your desired flow!",
              style: TextStyle(fontFamily: "HKGrotesk_regular", fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
