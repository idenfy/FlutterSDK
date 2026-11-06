import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:idenfy_sdk_flutter/idenfy_sdk_flutter.dart';
import 'package:idenfy_sdk_flutter/models/bank_card_verification_result.dart';
import 'package:idenfy_sdk_flutter/models/idenfy_bank_card_verification_ui_settings.dart';
import 'constants.dart' as Constants;
import 'main.dart' show MyApp, createSampleColorScheme;

class BankCardVerificationStartScreen extends StatefulWidget {
  @override
  State<BankCardVerificationStartScreen> createState() =>
      _BankCardVerificationStartScreenState();
}

class _BankCardVerificationStartScreenState
    extends State<BankCardVerificationStartScreen> {
  BankCardVerificationResult? _bankCardVerificationResult;
  Exception? _exception;

  TextEditingController _cardHolderNameController = TextEditingController();
  TextEditingController _lastFourDigitsController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _cardHolderNameController.dispose();
    _lastFourDigitsController.dispose();
  }

  Future<String> getBankCardVerificationTokenRequest(
      String expectedName, String? expectedLastFour) async {
    final body = <String, dynamic>{
      "expectedName": expectedName,
      "sessionLength": 60,
    };
    if (expectedLastFour != null && expectedLastFour.isNotEmpty) {
      body["expectedLastFour"] = expectedLastFour;
    }

    final response = await http.post(
      Uri.https(Constants.BASE_URL, '/bank-card/tokens/'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization':
            'Basic ${base64Encode(utf8.encode('${Constants.apiKey}:${Constants.apiSecret}'))}',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)["tokenString"];
    } else {
      throw Exception('Failed to fetch token: ${response.statusCode} ${response.body}');
    }
  }

  Future<void> initBankCardVerification() async {
    BankCardVerificationResult? bankCardVerificationResult;
    Exception? localException;
    try {
      String authToken = await getBankCardVerificationTokenRequest(
          _cardHolderNameController.text, _lastFourDigitsController.text);

      var bcvUIBuilder = IdenfyBankCardVerificationUIBuilder();

      if (Constants.selectedFlow == Constants.SdkFlow.withImplementedColors) {
        bcvUIBuilder = bcvUIBuilder.withColorScheme(createSampleColorScheme());
      }

      IdenfyBankCardVerificationUISettings bcvUISettings = bcvUIBuilder.build();

      bankCardVerificationResult =
          await IdenfySdkFlutter.startBankCardVerification(authToken, false,
              idenfyBankCardVerificationUISettings: bcvUISettings);
    } on Exception catch (e) {
      localException = e;
    }

    setState(() {
      _bankCardVerificationResult = bankCardVerificationResult;
      _exception = localException;
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
              SizedBox(height: 24),
              centerInputs(),
              Spacer(),
              _bankCardVerificationResult != null
                  ? bankCardVerificationResultWidget()
                  : (_exception != null ? exceptionTitle() : Container()),
              Spacer(),
              beginVerificationButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget centerInputs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: TextField(
                controller: _cardHolderNameController,
                decoration: InputDecoration(
                  labelText: "Expected Name *",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(83, 109, 254, 1),
                    ),
                  ),
                  hintText: "e.g. John Doe",
                  counterText: '',
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                  labelStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                ),
                maxLength: 100,
                textAlign: TextAlign.start,
                onChanged: (String value) => {setState(() => {})}),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 300,
            child: TextField(
                controller: _lastFourDigitsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Expected Last Four (optional)",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(83, 109, 254, 1),
                    ),
                  ),
                  hintText: "e.g. 1234",
                  counterText: '',
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                  labelStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                ),
                maxLength: 4,
                textAlign: TextAlign.start,
                onChanged: (String value) => {setState(() => {})}),
          ),
        ],
      ),
    );
  }

  Widget bankCardVerificationResultWidget() {
    return _bankCardVerificationResult == null
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
                      text: "BankCardVerificationStatus:  \n",
                      style: TextStyle(
                          height: 4,
                          color: Color.fromRGBO(83, 109, 254, 1),
                          fontFamily: "HKGrotesk_bold",
                          fontSize: 18)),
                  TextSpan(
                    text:
                        "${_bankCardVerificationResult!.bankCardVerificationStatus.name}",
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

  Widget beginVerificationButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 24, right: 24),
      child: Container(
        height: 42,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              if (_cardHolderNameController.text.isEmpty) ...[
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
          onTap: _cardHolderNameController.text.isEmpty
              ? null
              : initBankCardVerification,
          child: Center(
            child: Text(
              "BEGIN BANK CARD VERIFICATION",
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
              "Enter the card holder name and start bank card verification!",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "HKGrotesk_regular", fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
