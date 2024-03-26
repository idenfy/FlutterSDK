package com.example.idenfy_sdk_flutter_example.compose

import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.colorResource
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.ExperimentalUnitApi
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.TextUnitType
import androidx.compose.ui.unit.dp
import com.idenfySdk.R
import com.idenfy.idenfySdk.api.ui.IdentificationSuspectedResultsViewComposeViewData
import com.idenfy.idenfySdk.api.ui.SuspectedResultsButton
import com.idenfy.idenfySdk.uicomponents.core.IdenfyFonts

@ExperimentalUnitApi
object IdentificationSuspectedResultsTestComposable {

    @Composable
    fun compose(data: IdentificationSuspectedResultsViewComposeViewData) {
        //All needed resources for the view
        val resources = data.resources
        //A base for the composable
        val composeBases = data.idenfyComposeBases

        composeBases.identificationSuspectedResultsComposableBase(
            resources = resources,
            identificationSuspectedResultsViewTitle = { title ->
                Text(
                    modifier = Modifier
                        .padding(16.dp, 32.dp, 16.dp, 0.dp),
                    text = title,
                    textAlign = TextAlign.Center,
                    color = colorResource(R.color.idenfyIdentificationSuspectedResultsViewTitleColor),
                    fontSize = TextUnit(20f, TextUnitType.Sp),
                    fontWeight = FontWeight.Bold,
                    fontFamily = IdenfyFonts.hkGrotesk
                )
            },
            identificationSuspectedResultsViewDescription = { descriptionResources ->
                Text(
                    modifier = Modifier
                        .padding(16.dp, 0.dp, 16.dp, 0.dp)
                        .clickable(onClick = descriptionResources.onClickAction,
                            indication = null,
                            interactionSource = remember { MutableInteractionSource() }),
                    textAlign = TextAlign.Center,
                    text = buildAnnotatedString {
                        withStyle(
                            style = SpanStyle(
                                color = colorResource(id = R.color.idenfyIdentificationSuspectedResultsViewDescriptionColor),
                                fontSize = TextUnit(15f, TextUnitType.Sp),
                                fontWeight = FontWeight.Normal,
                                fontFamily = IdenfyFonts.hkGrotesk
                            )
                        ) {
                            append(descriptionResources.description)
                        }
                        append(" ")
                        withStyle(
                            style = SpanStyle(
                                color = colorResource(id = R.color.idenfyIdentificationSuspectedResultsViewDescriptionEmailColor),
                                fontSize = TextUnit(15f, TextUnitType.Sp),
                                fontWeight = FontWeight.Bold,
                                fontFamily = IdenfyFonts.hkGrotesk
                            )
                        ) {
                            append(descriptionResources.supportEmail)
                        }
                    }
                )
            },
            identificationSuspectedResultsViewImage = {
                Image(
                    painterResource(R.drawable.idenfy_ic_identification_suspected),
                    contentDescription = "",
                    modifier = Modifier
                        .size(130.dp)
                )
            }, identificationSuspectedResultsButton = { buttonResources ->
                when (val visibleButton = buttonResources.suspectedResultsButton) {
                    SuspectedResultsButton.SuspectedResultsButtonHidden -> {}
                    is SuspectedResultsButton.SuspectedResultsButtonVisible -> {
                        Surface(
                            shape = RoundedCornerShape(4.dp),
                            color = colorResource(R.color.idenfyIdentificationSuspectedResultsViewContinueButtonBackgroundColor),
                            modifier = Modifier
                                .requiredHeight(42.dp)
                                .padding(start = 16.dp, end = 16.dp)
                                .clickable(onClick = visibleButton.buttonAction)
                                .fillMaxWidth()
                        ) {
                            Row(
                                horizontalArrangement = Arrangement.Center,
                                modifier = Modifier.requiredHeight(42.dp)
                            ) {
                                Text(
                                    text = visibleButton.buttonTitle,
                                    color = colorResource(R.color.idenfyIdentificationSuspectedResultsViewContinueButtonTitleColor),
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