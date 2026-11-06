package com.example.idenfy_sdk_flutter

import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull
import com.google.gson.Gson
import com.idenfy.idenfySdk.CoreSdkInitialization.IdenfyController
import com.idenfy.idenfySdk.CoreSdkInitialization.IdenfyLocaleEnum
import com.idenfy.idenfySdk.api.initialization.IdenfySettingsV2
import com.idenfy.idenfySdk.api.models.DocumentCameraFrameVisibility
import com.idenfy.idenfySdk.api.models.IdenfyOnBoardingViewTypeEnum
import com.idenfy.idenfySdk.api.models.ImmediateRedirectEnum
import com.idenfy.idenfySdk.api.initialization.BankCardVerificationInitialization
import com.idenfy.idenfySdk.api.response.BankCardVerificationResult
import com.idenfy.idenfySdk.api.response.FaceAuthenticationResult
import com.idenfy.idenfySdk.api.ui.IdenfyBankCardVerificationUISettings
import com.idenfy.idenfySdk.api.response.IdenfyIdentificationResult
import com.idenfy.idenfySdk.api.response.InformationUpdateStatus
import com.idenfy.idenfySdk.api.ui.IdenfyFaceAuthUISettings
import com.idenfy.idenfySdk.api.ui.IdenfyIdentificationResultsUISettingsV2
import com.idenfy.idenfySdk.api.ui.IdenfyUISettingsV2
import com.idenfy.idenfySdk.faceauthentication.api.FaceAuthenticationInitialization
import com.idenfy.idenfySdk.idenfycore.models.documentTypeData.DocumentTypeEnum
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry

/** IdenfySdkFlutterPlugin */
class IdenfySdkFlutterPlugin : FlutterPlugin, MethodCallHandler, ActivityAware,
    PluginRegistry.ActivityResultListener {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var activity: Activity

    //Is nullable after proccess death.
    private var mResult: Result? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "idenfy_sdk_flutter")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android " + android.os.Build.VERSION.RELEASE)
        } else if (call.method == "start") {
            mResult = result

            val idenfySettingsV2 =
                IdenfySettingsDecoder.decodeIdenfySettings(call.argument<Map<String, Any?>?>("idenfySettings"))
            idenfySettingsV2.authToken = call.argument<String>("authToken")!!

            IdenfyController.getInstance().initializeIdenfySDKV2WithManual(
                this.activity,
                IdenfyController.IDENFY_REQUEST_CODE,
                idenfySettingsV2
            )
        } else if (call.method == "startFaceAuth") {
            mResult = result
            val faceAuthenticationInitialization = FaceAuthenticationInitialization(
                call.argument<String>("token")!!,
                call.argument<Boolean>("withImmediateRedirect")!!,
                IdenfySettingsDecoder.decodeFaceAuthUISettings(call.argument<Map<String, Any?>?>("idenfyFaceAuthUISettings"))
            )
            IdenfyController.getInstance().initializeFaceAuthenticationSDKV2(
                this.activity,
                IdenfyController.IDENFY_REQUEST_CODE,
                faceAuthenticationInitialization
            )
        } else if (call.method == "startRequestUpdate") {
            mResult = result

            val idenfySettingsV2 =
                IdenfySettingsDecoder.decodeIdenfySettings(call.argument<Map<String, Any?>?>("idenfySettings"))
            idenfySettingsV2.authToken = call.argument<String>("authToken")!!

            IdenfyController.getInstance().initializeIdenfySDKV2WithManual(
                this.activity,
                IdenfyController.IDENFY_REQUEST_CODE,
                idenfySettingsV2
            )
        } else if (call.method == "startBankCardVerification") {
            mResult = result

            val authToken = call.argument<String>("authToken")!!
            val withImmediateRedirect = call.argument<Boolean>("withImmediateRedirect") ?: false

            val idenfyBankCardVerificationUISettings = IdenfyBankCardVerificationUISettings()
            val bcvUISettingsMap = call.argument<Map<String, Any?>?>("idenfyBankCardVerificationUISettings")
            if (bcvUISettingsMap != null) {
                val colorSchemeMap = bcvUISettingsMap["idenfyColorScheme"] as? Map<String, Any?>?
                if (colorSchemeMap != null) {
                    idenfyBankCardVerificationUISettings.idenfyColorScheme = IdenfySettingsDecoder.decodeColorScheme(colorSchemeMap)
                }
            }

            val bankCardVerificationInitialization = BankCardVerificationInitialization(
                authToken,
                withImmediateRedirect,
                idenfyBankCardVerificationUISettings
            )

            IdenfyController.getInstance().initializeBankCardVerificationSDK(
                this.activity,
                IdenfyController.IDENFY_REQUEST_CODE,
                bankCardVerificationInitialization
            )
        } else {
            //result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    }

    override fun onDetachedFromActivity() {
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == IdenfyController.IDENFY_REQUEST_CODE) {
            when (resultCode) {
                IdenfyController.IDENFY_IDENTIFICATION_RESULT_CODE -> {
                    val idenfyIdentificationResult: IdenfyIdentificationResult =
                        data!!.getParcelableExtra(IdenfyController.IDENFY_IDENTIFICATION_RESULT)!!
                    val jsonString = Gson().toJson(idenfyIdentificationResult)
                    mResult?.success(jsonString)
                }

                IdenfyController.IDENFY_FACE_AUTHENTICATION_RESULT_CODE -> {
                    val faceAuthenticationResult: FaceAuthenticationResult =
                        data!!.getParcelableExtra(IdenfyController.IDENFY_FACE_AUTHENTICATION_RESULT)!!
                    val jsonString = Gson().toJson(faceAuthenticationResult)
                    mResult?.success(jsonString)
                }

                IdenfyController.IDENFY_REQUEST_UPDATE_RESULT_CODE -> {
                    val informationUpdateStatus: InformationUpdateStatus =
                        data!!.getParcelableExtra(IdenfyController.IDENFY_REQUEST_UPDATE_RESULT)!!
                    val jsonString = Gson().toJson(mapOf("informationUpdateStatus" to informationUpdateStatus.name))
                    mResult?.success(jsonString)
                }

                IdenfyController.IDENFY_BANK_CARD_VERIFICATION_RESULT_CODE -> {
                    val bankCardVerificationResult: BankCardVerificationResult? =
                        data?.getParcelableExtra(IdenfyController.IDENFY_BANK_CARD_VERIFICATION_RESULT)
                    val jsonString = Gson().toJson(bankCardVerificationResult)
                    mResult?.success(jsonString)
                }
            }
        } else {
            //mResult?.notImplemented()
        }
        return true
    }
}