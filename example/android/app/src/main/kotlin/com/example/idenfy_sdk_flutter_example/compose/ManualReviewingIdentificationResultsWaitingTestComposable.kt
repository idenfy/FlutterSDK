package com.example.idenfy_sdk_flutter_example.compose

import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.ColorFilter
import androidx.compose.ui.res.colorResource
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.ExperimentalUnitApi
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.TextUnitType
import androidx.compose.ui.unit.dp
import com.idenfySdk.R
import com.idenfy.idenfySdk.api.ui.IdenfyManualReviewingIdentificationResultsStatusWaitingComposeViewData
import com.idenfy.idenfySdk.identificationresults.presentation.state.BackToAccountButtonResources
import com.idenfy.idenfySdk.identificationresults.presentation.state.ManualWaitingScreenState
import com.idenfy.idenfySdk.uicomponents.core.IdenfyFonts

object ManualReviewingIdentificationResultsWaitingTestComposable {

    @ExperimentalUnitApi
    @Composable
    fun composeManualView(data: IdenfyManualReviewingIdentificationResultsStatusWaitingComposeViewData) {
        //All needed resources for the view
        val resources = data.resources
        //A base for the composable
        val composeBases = data.idenfyComposeBases
        //States of the view
        val state = resources.state.collectAsState()

        composeBases.manualReviewingIdentificationResultsStatusWaitingComposableBase(
            //Do not forget to pass the resources
            resources = resources,
            manualReviewingWaitingStatusViewTitle = { title ->
                Text(
                    modifier = Modifier
                        .padding(16.dp, 32.dp, 16.dp, 0.dp),
                    text = title,
                    textAlign = TextAlign.Center,
                    color = colorResource(R.color.idenfySecondColorV2),
                    fontSize = TextUnit(20f, TextUnitType.Sp),
                    fontWeight = FontWeight.Bold,
                    fontFamily = IdenfyFonts.hkGrotesk
                )
            }, manualReviewingWaitingStatusViewDescription = { description ->
                Text(
                    modifier = Modifier
                        .padding(16.dp, 0.dp, 16.dp, 0.dp),
                    text = description,
                    textAlign = TextAlign.Center,
                    color = colorResource(R.color.idenfySecondColor50percentV2),
                    fontSize = TextUnit(15f, TextUnitType.Sp),
                    fontWeight = FontWeight.Normal,
                    fontFamily = IdenfyFonts.hkGrotesk
                )
            }, manualReviewingWaitingStatusViewAutomatedReviewBox = { firstCardTitle ->
                Surface(
                    elevation = 4.dp, shape = RoundedCornerShape(4.dp), color = colorResource(R.color.idenfyMainColorV2), modifier = Modifier
                        .height(IntrinsicSize.Min)
                        .padding(start = 16.dp, end = 16.dp)
                        .fillMaxWidth()
                ) {
                    Box {
                        Row(
                            horizontalArrangement = Arrangement.End,
                            modifier = Modifier
                                .requiredHeight(60.dp)
                        ) {
                            Text(
                                modifier = Modifier
                                    .weight(weight = 1f)
                                    .padding(start = 16.dp, end = 16.dp)
                                    .align(Alignment.CenterVertically),
                                textAlign = TextAlign.Start,
                                text = firstCardTitle,
                                color = colorResource(R.color.idenfyWhite),
                                fontSize = TextUnit(13f, TextUnitType.Sp),
                                fontWeight = FontWeight.SemiBold,
                                fontFamily = IdenfyFonts.hkGrotesk
                            )
                            Image(
                                painterResource(R.drawable.idenfy_ic_language_selection_language_selected_tick),
                                contentDescription = "",
                                modifier = Modifier
                                    .padding(end = 16.dp)
                                    .align(Alignment.CenterVertically)
                                    .wrapContentWidth(Alignment.End)
                                    .requiredSize(20.dp),
                            )
                        }
                    }
                }
            }, manualReviewingWaitingStatusViewManualReviewBox =  { secondCardTitle ->
                Surface(
                    elevation = 4.dp, shape = RoundedCornerShape(4.dp), color = if(state.value == ManualWaitingScreenState.WAITING) colorResource(
                        R.color.idenfyWhite) else colorResource(R.color.idenfyMainColorV2), modifier = Modifier
                        .height(IntrinsicSize.Min)
                        .padding(start = 16.dp, end = 16.dp)
                        .fillMaxWidth()
                ) {
                    Box {
                        Row(
                            horizontalArrangement = Arrangement.End,
                            modifier = Modifier
                                .requiredHeight(60.dp)
                        ) {
                            Text(
                                modifier = Modifier
                                    .weight(weight = 1f)
                                    .padding(start = 16.dp, end = 16.dp)
                                    .align(Alignment.CenterVertically),
                                textAlign = TextAlign.Start,
                                text = secondCardTitle,
                                color = if(state.value == ManualWaitingScreenState.WAITING) colorResource(
                                    R.color.idenfySecondColorV2) else colorResource(R.color.idenfyWhite),
                                fontSize = TextUnit(13f, TextUnitType.Sp),
                                fontWeight = FontWeight.SemiBold,
                                fontFamily = IdenfyFonts.hkGrotesk
                            )
                            if(state.value == ManualWaitingScreenState.WAITING) {
                                CircularProgressIndicator(modifier = Modifier
                                    .padding(end = 16.dp)
                                    .align(Alignment.CenterVertically)
                                    .wrapContentWidth(Alignment.End)
                                    .requiredSize(20.dp),
                                    color = colorResource(R.color.idenfySecondColor20percentV2)
                                )
                            } else {
                                Image(
                                    painterResource(R.drawable.idenfy_ic_language_selection_language_selected_tick),
                                    contentDescription = "",
                                    modifier = Modifier
                                        .padding(end = 16.dp)
                                        .align(Alignment.CenterVertically)
                                        .wrapContentWidth(Alignment.End)
                                        .requiredSize(20.dp),
                                )
                            }
                        }
                    }
                }
            }, manualReviewingWaitingStatusViewWaitingDurationTitle = { waitingDurationTitle ->
                Text(
                    modifier = Modifier
                        .padding(bottom = 8.dp)
                        .wrapContentWidth(Alignment.Start),
                    text = waitingDurationTitle,
                    textAlign = TextAlign.Center,
                    color = colorResource(R.color.idenfySecondColorV2),
                    fontSize = TextUnit(13f, TextUnitType.Sp),
                    fontWeight = FontWeight.Normal,
                    fontFamily = IdenfyFonts.hkGrotesk
                )
            }, manualReviewingWaitingStatusViewWaitingTimerBox = { timeState ->
                val time = timeState.collectAsState()
                Surface(shape = RoundedCornerShape(4.dp),
                    color = colorResource(R.color.idenfySecondColor20percentV2),
                    modifier = Modifier
                        .height(42.dp)
                        .padding(start = 16.dp, end = 16.dp)
                        .fillMaxWidth()) {
                    Row(horizontalArrangement = Arrangement.Center) {
                        Image(
                            painterResource(R.drawable.idenfy_ic_waiting_results_timer_clock_v2),
                            contentDescription = "",
                            modifier = Modifier
                                .size(25.dp)
                                .align(Alignment.CenterVertically),
                            colorFilter = ColorFilter.tint(colorResource(R.color.idenfySecondColor50percentV2))
                        )
                        Text(
                            text = time.value,
                            color = colorResource(R.color.idenfySecondColor50percentV2),
                            fontSize = TextUnit(12f, TextUnitType.Sp),
                            fontWeight = FontWeight.Bold,
                            fontFamily = IdenfyFonts.hkGrotesk,
                            modifier = Modifier
                                .align(Alignment.CenterVertically)
                                .padding(start = 8.dp)
                        )
                    }
                }
            }, manualReviewingWaitingStatusViewBackToAccountButton =  { buttonResources ->
                when (buttonResources) {
                    BackToAccountButtonResources.Hidden -> {
                    }
                    is BackToAccountButtonResources.Visible -> {
                        Surface(shape = RoundedCornerShape(4.dp),
                            color = colorResource(R.color.idenfyMainColorV2),
                            modifier = Modifier
                                .height(42.dp)
                                .padding(start = 16.dp, end = 16.dp)
                                .clickable(onClick = buttonResources.buttonAction)
                                .fillMaxWidth()) {
                            Row(horizontalArrangement = Arrangement.Center) {
                                Text(
                                    text = buttonResources.title,
                                    color = colorResource(R.color.idenfyWhite),
                                    fontSize = TextUnit(12f, TextUnitType.Sp),
                                    fontWeight = FontWeight.Bold,
                                    fontFamily = IdenfyFonts.hkGrotesk,
                                    modifier = Modifier
                                        .align(Alignment.CenterVertically)
                                )
                            }
                        }
                    }
                }
            })
    }
}