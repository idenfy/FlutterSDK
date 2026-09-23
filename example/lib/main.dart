import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:idenfy_sdk_flutter/idenfy_sdk_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:idenfy_sdk_flutter/models/document_camera_frame_visibility.dart';
import 'package:idenfy_sdk_flutter/models/document_type_enum.dart';
import 'package:idenfy_sdk_flutter/models/idenfy_document_selection_type.dart';
import 'package:idenfy_sdk_flutter/models/idenfy_identification_results_ui_settings.dart';
import 'package:idenfy_sdk_flutter/models/idenfy_identification_status.dart';
import 'package:idenfy_sdk_flutter/models/idenfy_instructions_enum.dart';
import 'package:idenfy_sdk_flutter/models/idenfy_locale_enum.dart';
import 'package:idenfy_sdk_flutter/models/idenfy_onboarding_view_type.dart';
import 'package:idenfy_sdk_flutter/models/idenfy_settings.dart';
import 'package:idenfy_sdk_flutter/models/idenfy_ui_settings.dart';
import 'package:idenfy_sdk_flutter/models/idenfy_color_scheme.dart';
import 'package:idenfy_sdk_flutter/models/immediate_redirect_enum.dart';
import 'constants.dart' as Constants;
import 'face_authentication_start_screen.dart';
import 'request_update_start_screen.dart';

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
        "clientId": Constants.clientId
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
      var uiBuilder = IdenfyUIBuilder()
          .withAdditionalSupportView(true)
          .withIdenfyDocumentSelectionType(
              IdenfyDocumentSelectionType.navigateOnContinueButton)
          .withOnBoardingViewType(IdenfyOnBoardingViewType.multipleStatic)
          .withInstructions(IdenfyInstructionsEnum.dialog)
          .withImmediateRedirect(ImmediateRedirectEnum.full)
          .withLanguageSelection(true)
          .withIdenfyIdentificationResultsUISettingsV2(
              IdenfyIdentificationResultsUISettingsV2(true, true, true))
          .withDocumentCameraFrameVisibility(
              HiddenForSpecificCountriesAndDocumentTypes({
            'US': [DocumentTypeEnum.PASSPORT.name]
          }))
          .withMismatchTagsAlert(true)
          .withCountryAndDocumentSelectionJoined(true)
          .withBottomSheetDialogs(true);

      if (Constants.selectedFlow == Constants.SdkFlow.withImplementedColors) {
        uiBuilder = uiBuilder.withColorScheme(createSampleColorScheme());
      }

      IdenfyUISettings idenfyUISettings = uiBuilder.build();

      IdenfySettings idenfySettings = IdenfyBuilder()
          .withSelectedLocale(IdenfyLocaleEnum.EN)
          .withUISettings(idenfyUISettings)
          .withSSLPinning(true)
          .build();

      String authToken = await getAuthTokenRequest();
      // With IdenfySetting enabled
      idenfySDKresult = await IdenfySdkFlutter.start(authToken,
          idenfySettings: idenfySettings);
      // Without IdenfySetting enabled
      //idenfySDKresult = await IdenfySdkFlutter.start(authToken);
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                topTitle(),
                SizedBox(height: 40),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
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
                                "IDENTIFICATION",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        onPressed: initIdenfySdk),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                      child: Divider(color: Colors.black, thickness: 1.2),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            backgroundColor: Colors.transparent,
                            disabledBackgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/idenfy_ic_face_step_v2.png',
                                width: 90, fit: BoxFit.fitWidth),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
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
                        }),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                      child: Divider(color: Colors.black, thickness: 1.2),
                    ),
                    ElevatedButton(
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
                                "REQUEST UPDATE",
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
                                  RequestUpdateStartScreen(),
                            ),
                          );
                        }),
                  ],
                ),
                SizedBox(height: 40),
                _idenfySDKresult != null
                    ? idenfyResult()
                    : (_exception != null ? exceptionTitle() : Container()),
                SizedBox(height: 24),
              ],
            ),
          ),
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

IdenfyColorScheme createSampleColorScheme() {
  const mainColor = Color(0xFF6AA82F);
  const secondaryColor = Color(0xFF000000);
  const backgroundColor = Color(0xFFFFFFFF);
  const white = Color(0xFFFFFFFF);

  return IdenfyColorScheme(
    // Base colors
    idenfyMainColorV2: mainColor,
    idenfyMainDarkerColorV2: mainColor,
    idenfySecondColorV2: secondaryColor,
    idenfyBackgroundColorV2: backgroundColor,

    // Gradient button
    idenfyGradientButtonColorStart: mainColor,
    idenfyGradientButtonColorEnd: mainColor,

    // Toolbar
    idenfyDefaultAppBarIconTintColor: secondaryColor,
    idenfyLanguageSelectionToolbarLanguageSelectionIconTintColor: secondaryColor,
    idenfyLanguageSelectionToolbarCloseIconTintColor: secondaryColor,

    // Continue button text & spinner color (all screens)
    idenfyContinueButtonTextColor: secondaryColor,
    idenfyContinueButtonSpinnerColor: secondaryColor,
    idenfyRetakeButtonTextColor: secondaryColor,

    // Camera buttons
    idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedTintColor: mainColor,
    idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedTintColor: mainColor,
    idenfyFaceCameraPreviewSessionFaceOvalColor: white,

    // Photo result
    idenfyPhotoResultCardTitleColor: secondaryColor,
    idenfyRetakeButtonBackgroundColor: white,
    idenfyRetakeButtonBorderColor: secondaryColor,

    // Country/doc selection highlighted cell
    idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBorderColor: secondaryColor,
    idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBackgroundColor: mainColor,
    idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedTextColor: secondaryColor,
  );
}
