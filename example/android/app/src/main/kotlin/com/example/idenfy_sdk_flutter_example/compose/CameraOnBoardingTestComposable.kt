package com.example.idenfy_sdk_flutter_example.compose

import android.content.Context
import android.view.LayoutInflater
import androidx.compose.animation.core.FastOutSlowInEasing
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.LinearProgressIndicator
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.MutableState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.colorResource
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.ExperimentalUnitApi
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.TextUnitType
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import com.example.idenfy_sdk_flutter_example.R
import com.google.android.exoplayer2.ExoPlayer
import com.google.android.exoplayer2.ui.PlayerView
import com.idenfy.idenfySdk.api.ui.IdenfyDynamicCameraOnBoardingComposeViewData
import com.idenfy.idenfySdk.features.confirmation.ui.state.CameraOnBoardingScreenButtonState
import com.idenfy.idenfySdk.uicomponents.core.IdenfyFonts

@ExperimentalUnitApi
object CameraOnBoardingTestComposable {

    @Composable
    fun composeOnBoardingView(data: IdenfyDynamicCameraOnBoardingComposeViewData) {
        //All needed resources for the view
        val resources = data.resources
        //A base for the composable
        val composeBases = data.idenfyComposeBases

        composeBases.cameraDynamicOnBoardingViewComposableBase(
            //Do not forget to pass the data class
            data = data,
            cameraOnBoardingViewTitle = { title ->
                Text(
                    modifier = Modifier
                        .padding(16.dp, 32.dp, 16.dp, 0.dp),
                    text = title.value,
                    textAlign = TextAlign.Center,
                    color = colorResource(R.color.idenfySecondColorV2),
                    fontSize = TextUnit(20f, TextUnitType.Sp),
                    fontWeight = FontWeight.Bold,
                    fontFamily = IdenfyFonts.hkGrotesk
                )
            },
            cameraOnBoardingViewDescription = { description ->
                Text(
                    modifier = Modifier
                        .padding(16.dp, 16.dp, 16.dp, 0.dp),
                    text = description.value,
                    textAlign = TextAlign.Center,
                    color = colorResource(R.color.idenfySecondColorV2),
                    fontSize = TextUnit(15f, TextUnitType.Sp),
                    fontWeight = FontWeight.Normal,
                    fontFamily = IdenfyFonts.hkGrotesk
                )
            },
            cameraOnBoardingViewCenterImage = { image ->
                Image(
                    painterResource(image),
                    contentDescription = "",
                    contentScale = ContentScale.FillBounds,
                    modifier = Modifier.size(180.dp)
                )
            },
            cameraOnBoardingViewCenterVideo = { videoResources ->
                VideoPlayer(videoResources.player)
                Spacer(modifier = Modifier.height(4.dp))
                IdenfyProgressBar(videoResources.videoProgress)
            }, cameraOnBoardingViewCenterVideoDescription = { currentInstructionDescriptionResId ->
                Surface(
                    shape = RoundedCornerShape(4.dp),
                    color = colorResource(R.color.idenfyPhotoResultDetailsCardBackgroundColorV2),
                    modifier = Modifier
                        .height(50.dp)
                        .padding(start = 32.dp, end = 32.dp)
                        .fillMaxWidth()
                ) {
                    Row(horizontalArrangement = Arrangement.Start) {
                        Image(
                            painterResource(R.drawable.idenfy_ic_photo_result_details_questionmark),
                            contentDescription = "",
                            modifier = Modifier
                                .padding(start = 16.dp, end = 16.dp)
                                .align(Alignment.CenterVertically)
                                .wrapContentWidth(Alignment.Start)
                                .requiredSize(20.dp),
                        )
                        Text(
                            text = currentInstructionDescriptionResId.value,
                            color = colorResource(R.color.idenfyMainColorV2),
                            fontSize = TextUnit(12f, TextUnitType.Sp),
                            fontWeight = FontWeight.Normal,
                            fontFamily = IdenfyFonts.hkGrotesk,
                            modifier = Modifier
                                .align(Alignment.CenterVertically)
                        )
                    }
                }
            }, cameraOnBoardingViewContinueButton = { buttonState ->
                if (buttonState.value == CameraOnBoardingScreenButtonState.Enabled) {
                    Surface(
                        shape = RoundedCornerShape(4.dp),
                        color = colorResource(R.color.idenfyMainColorV2),
                        modifier = Modifier
                            .height(42.dp)
                            .padding(start = 16.dp, end = 16.dp)
                            .clickable(onClick = resources.buttonAction)
                            .fillMaxWidth()
                    ) {
                        Row(horizontalArrangement = Arrangement.Center) {
                            Text(
                                text = resources.buttonTitle.enabledButtonTitle,
                                color = colorResource(R.color.idenfyWhite),
                                fontSize = TextUnit(12f, TextUnitType.Sp),
                                fontWeight = FontWeight.Bold,
                                fontFamily = IdenfyFonts.hkGrotesk,
                                modifier = Modifier
                                    .align(Alignment.CenterVertically)
                            )
                        }
                    }
                } else {
                    Surface(
                        shape = RoundedCornerShape(4.dp),
                        color = colorResource(R.color.idenfySecondColor20percentV2),
                        modifier = Modifier
                            .height(42.dp)
                            .padding(start = 16.dp, end = 16.dp)
                            .fillMaxWidth()
                    ) {
                        Row(horizontalArrangement = Arrangement.Center) {
                            Text(
                                text = (buttonState.value as CameraOnBoardingScreenButtonState.Disabled).timeLeftTitle,
                                color = colorResource(R.color.idenfySecondColor50percentV2),
                                fontSize = TextUnit(12f, TextUnitType.Sp),
                                fontWeight = FontWeight.Bold,
                                fontFamily = IdenfyFonts.hkGrotesk,
                                modifier = Modifier
                                    .align(Alignment.CenterVertically)
                            )
                        }
                    }
                }
            }, cameraOnBoardingViewLoadingMask = {
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.Center
                ) {
                    CircularProgressIndicator(
                        Modifier.size(60.dp),
                        color = colorResource(id = R.color.idenfyMainColorV2)
                    )
                }
            })
    }

    @Composable
    fun VideoPlayer(exoPlayer: ExoPlayer) {
        AndroidView(
            factory = { context: Context ->
                val view = LayoutInflater.from(context)
                    .inflate(
                        R.layout.idenfy_partial_layout_onboarding_video_surface_v2,
                        null,
                        false
                    )
                val exoPlayerView = view.findViewById<PlayerView>(R.id.player_view)
                exoPlayerView.player = exoPlayer
                exoPlayer.playWhenReady = true
                view
            },
            modifier = Modifier
                .fillMaxWidth()
                .padding(start = 16.dp, end = 16.dp)
                .clip(RoundedCornerShape(4.dp))
        )
    }

    @Composable
    fun IdenfyProgressBar(indicatorProgress: MutableState<Float>) {
        val progressAnimDuration = 1500
        val progressAnimation by animateFloatAsState(
            targetValue = indicatorProgress.value,
            animationSpec = tween(
                durationMillis = progressAnimDuration,
                easing = FastOutSlowInEasing
            )
        )
        LinearProgressIndicator(
            modifier = Modifier
                .fillMaxWidth()
                .height(4.dp)
                .padding(start = 16.dp, end = 16.dp)
                .clip(RoundedCornerShape(20.dp)), // Rounded edges
            backgroundColor = colorResource(id = R.color.idenfySecondColor20percentV2),
            color = colorResource(id = R.color.idenfyMainColorV2),
            progress = progressAnimation
        )
    }
}