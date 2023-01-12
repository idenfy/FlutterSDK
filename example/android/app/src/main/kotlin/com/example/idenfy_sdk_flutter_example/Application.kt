package com.example.idenfy_sdk_flutter_example

import androidx.compose.ui.unit.ExperimentalUnitApi
import com.example.idenfy_sdk_flutter_example.compose.IdentificationSuspectedResultsTestComposable
import com.example.idenfy_sdk_flutter_example.compose.ManualReviewingIdentificationResultsWaitingTestComposable
import com.idenfy.idenfySdk.CoreSdkInitialization.IdenfyController
import com.idenfy.idenfySdk.api.ui.IdenfyComposeViewBuilder
import io.flutter.app.FlutterApplication

class Application: FlutterApplication() {

    @ExperimentalUnitApi
    override fun onCreate() {
        super.onCreate()

        val idenfyComposeViews = IdenfyComposeViewBuilder()
            .withIdentificationSuspectedResultsComposable { data -> IdentificationSuspectedResultsTestComposable.compose(data) }
            .withManualReviewingIdentificationResultsStatusWaitingComposable { data -> ManualReviewingIdentificationResultsWaitingTestComposable.composeManualView(data) }
            .build()
        //IdenfyController.getInstance().idenfyComposableViews = idenfyComposeViews
    }
}