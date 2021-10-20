import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:idenfy_sdk_flutter/idenfy_sdk_flutter.dart';
import 'package:idenfy_sdk_flutter/models/IdenfyIdentificationResult.dart';
import 'package:http/http.dart' as http;
import 'constants.dart' as Constants;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  IdenfyIdentificationResult? _idenfySDKresult;
  Exception? exception;

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
        'Authorization': 'Basic ' + base64Encode(utf8.encode('${Constants.apiKey}:${Constants.apiSecret}')),
      },
      body: jsonEncode(<String, String> {
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
    } on Exception catch(e) {
      localException = e;
    }

    setState(() {
      _idenfySDKresult = idenfySDKresult;
      exception = localException;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/ic_idenfy_logo_vector_v2.png',
              width: 70,
              fit: BoxFit.cover),
          centerTitle: true,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topTitle(),
            Spacer(),
            exceptionTitle(),
            Spacer(),
            centerTitle(),
            Spacer(),
            beginIdentificationButton()
          ],
        ),
      ),
    );
  }

  Widget exceptionTitle() {
    return exception == null ? Container() : Container(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(text: exception.toString(), style: TextStyle( height: 4, color: Colors.red, fontFamily: "HKGrotesk_bold", fontSize: 18)),
            ],
          ),
        ));
  }

  Widget centerTitle() {
    return _idenfySDKresult == null ? Container() : Container(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(text: "IdenfyIdentificationStatus:  \n", style: TextStyle( height: 4, color: Color.fromRGBO(83, 109, 254, 1), fontFamily: "HKGrotesk_bold", fontSize: 18)),
              TextSpan(text: "${_idenfySDKresult!.autoIdentificationStatus} \n ${_idenfySDKresult!.manualIdentificationStatus}",
                  style: TextStyle(fontFamily: "HKGrotesk_regular", fontSize: 14)),
            ],
          ),
        ));
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
                  style: TextStyle(fontFamily: "HKGrotesk_bold", fontSize: 22)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                  "Press button to begin identification!",
                  style: TextStyle(fontFamily: "HKGrotesk_regular", fontSize: 14)
              ),
            ),
          ],
        )
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
              colors: [ Color.fromRGBO(83, 109, 254, 1),
                Color.fromRGBO(141, 108, 251, 1)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4))
        ),
        child: InkWell(
          onTap: () {
            initIdenfySdk();
          },
          child: Center(
            child: Text(
                "BEGIN IDENTIFICATION",
                style: TextStyle(fontFamily: "HKGrotesk_bold", color: Colors.white)
            ),
          ),
        ),
      ),
    );
  }

}
