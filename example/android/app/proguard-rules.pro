-keepattributes InnerClasses

-keep class com.idenfy.idenfySdk.uicomponents.**  { *; }
-keep class com.idenfy.idenfySdk.api.**  { *; }

-keep public class com.idenfy.idenfySdk.CoreSdkInitialization** {
  public protected *;
  public *;
}

-keep public class com.idenfy.idenfySdk.api.** {
  public protected *;
  public *;
}

-keep public class com.idenfy.idenfySdk.api** {
  public protected *;
  public *;
}
-keeppackagenames com.idenfy.idenfySdk.api**
-keep class com.idenfy.idenfySdk.api**  { *; }
-keep class com.idenfy.idenfySdk.api.logging**  { *; }


-keep public class com.idenfy.idenfySdk.SdkResponseModels** {
  public protected *;
  public *;
  public static **[] values();
      public static ** valueOf(java.lang.String);
}

-keep public enum com.idenfy.idenfySdk.**{
    public static **[] values();
        public static ** valueOf(java.lang.String);
}
-keepclassmembers enum com.idenfy.idenfySdk.** { *; }
-keepclassmembers enum com.idenfy.idenfySdk.** {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-keepclassmembers enum com.idenfy.idenfySdk.** {
    <fields>;
    public static **[] values();
    public static ** valueOf(java.lang.String);
 }

-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn java.lang.invoke**
-dontwarn javax.annotation.**
-dontwarn org.conscrypt.**
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase
-dontnote retrofit2.Platform
-dontwarn retrofit2.Platform$Java8

-verbose

-keep class * implements android.arch.lifecycle.GeneratedAdapter {<init>(...);}
-keep class android.arch.lifecycle.** {*;}
-keepattributes Signature, InnerClasses, EnclosingMethod

# Retrofit does reflection on method and parameter annotations.
-keepattributes RuntimeVisibleAnnotations, RuntimeVisibleParameterAnnotations

# Retain service method parameters when optimizing.
-keepclassmembers,allowshrinking,allowobfuscation interface * {
    @retrofit2.http.* <methods>;
}

-keepclassmembers class * {
   @com.google.gson.annotations.SerializedName <fields>;
}

# Ignore annotation used for build tooling.
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement

# Ignore JSR 305 annotations for embedding nullability information.
-dontwarn javax.annotation.**

# Guarded by a NoClassDefFoundError try/catch and only used when on the classpath.
-dontwarn kotlin.Unit

-dontwarn kotlin.**

# Top-level functions that can only be used by Kotlin.
-dontwarn retrofit2.-KotlinExtensions

-keep public enum com.idenfy.idenfysdk.core.**{
    public static **[] values();
        public static ** valueOf(java.lang.String);
}
-keepclassmembers public class com.idenfy.idenfysdk.core.networking.models** { *; }

-keep class biz.smartengines.smartid** { *; }

# Coroutines
-keep class kotlinx.coroutines.android.AndroidDispatcherFactory {*;}
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}
-keepclassmembernames class kotlinx.** {
    volatile <fields>;
}

#Sentry
-keep class io.sentry.android.core.SentryAndroidOptions
-keep class io.sentry.android.ndk.SentryNdk

-keep class org.jmrtd.** { *; }
-keep class net.sf.scuba.** {*;}
-keep class org.bouncycastle.** {*;}
-keep class org.ejbca.** {*;}

#FaceTec
-dontwarn com.facetec.sdk.**
-keep class com.facetec.sdk.** { *; }

#Moshi
-keepclassmembers class ** {
  @com.squareup.moshi.FromJson *;
  @com.squareup.moshi.ToJson *;
}

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.nfcreading.models.**
-keep class com.idenfy.idenfySdk.nfcreading.models.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.nfcreading.models.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.liveness.idcheck.data.models.**
-keep class com.idenfy.idenfySdk.liveness.idcheck.data.models.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.liveness.idcheck.data.models.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.core.domain.models.**
-keep class com.idenfy.idenfySdk.core.domain.models.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.core.domain.models.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.liveness.data.models.**
-keep class com.idenfy.idenfySdk.liveness.data.models.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.liveness.data.models.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.SdkResponseModels.**
-keep class com.idenfy.idenfySdk.SdkResponseModels.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.SdkResponseModels.** { *; }

-keepnames @kotlin.Metadata class  com.idenfy.idenfySdk.idenfycore.networking.**
-keep class com.idenfy.idenfySdk.idenfycore.networking.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.idenfycore.networking.** { *; }

-keepnames @kotlin.Metadata class  com.idenfy.idenfySdk.idenfycore.ui.customviews.**
-keep class com.idenfy.idenfySdk.idenfycore.ui.customviews.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.idenfycore.ui.customviews.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.camerasession.domain.model.**
-keep class com.idenfy.idenfySdk.camerasession.domain.model.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.camerasession.domain.model.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.camerasession.facecamerasession.domain.utils.ConstsFaceDetection
-keep class com.idenfy.idenfySdk.camerasession.facecamerasession.domain.utils.ConstsFaceDetection { *; }
-keepclassmembers class com.idenfy.idenfySdk.camerasession.facecamerasession.domain.utils.ConstsFaceDetection { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.identificationresults.domain.models.**
-keep class com.idenfy.idenfySdk.identificationresults.domain.models.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.identificationresults.domain.models.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.identificationresults.data.models.**
-keep class com.idenfy.idenfySdk.identificationresults.data.models.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.identificationresults.data.models.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.identificationresults.presentation.state.**
-keep class com.idenfy.idenfySdk.identificationresults.presentation.state.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.identificationresults.presentation.state.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.features.confirmation.ui.uiviewmodel.**
-keep class com.idenfy.idenfySdk.features.confirmation.ui.uiviewmodel.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.features.confirmation.ui.uiviewmodel.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.providerselection.domain.models.**
-keep class com.idenfy.idenfySdk.providerselection.domain.models.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.providerselection.domain.models.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.networking.**
-keep class com.idenfy.idenfySdk.networking.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.networking.** { *; }

#Keep Annotation for models
-keep class androidx.annotation.Keep {*;}

# COREEEEEEE
-keepclassmembers enum com.idenfy.idenfysdk.idenfycore.models.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfysdk.idenfycore.models.**
-keep class com.idenfy.idenfysdk.idenfycore.models.** { *; }
-keepclassmembers class com.idenfy.idenfysdk.idenfycore.models.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfysdk.idenfycore.internal.sdkResponses.**
-keep class com.idenfy.idenfysdk.idenfycore.internal.sdkResponses.** { *; }
-keepclassmembers class com.idenfy.idenfysdk.idenfycore.internal.sdkResponses.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfysdk.idenfycore.networking.models.**
-keep class com.idenfy.idenfysdk.idenfycore.networking.models.** { *; }
-keepclassmembers class com.idenfy.idenfysdk.idenfycore.networking.models.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.features.confirmation.ui.state.**
-keep class com.idenfy.idenfySdk.features.confirmation.ui.state.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.features.confirmation.ui.state.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.faceauthentication.api.**
-keep class com.idenfy.idenfySdk.faceauthentication.api.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.faceauthentication.api.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.faceauthentication.domain.models.**
-keep class com.idenfy.idenfySdk.faceauthentication.api.domain.models.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.faceauthentication.api.domain.models.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.features.confirmation.consts.**
-keep class com.idenfy.idenfySdk.features.confirmation.consts.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.features.confirmation.consts.** { *; }

-keepnames @kotlin.Metadata class biz.smartengines.**
-keep class biz.smartengines.** { *; }
-keepclassmembers class biz.smartengines.** { *; }

-keepnames @kotlin.Metadata class com.smartengines.common.**
-keep class com.smartengines.common.** { *; }
-keepclassmembers class com.smartengines.common.** { *; }

-keepnames @kotlin.Metadata class com.smartengines.id.**
-keep class com.smartengines.id.** { *; }
-keepclassmembers class com.smartengines.id.** { *; }

-keepclasseswithmembernames class * {
 native <methods>;
}

-keep class biz.smartengines.smartid.swig.* {
 public <methods>;
}

-keep class com.smartengines.common.* {
 public <methods>;
}

-keep class com.smartengines.id.* {
 public <methods>;
}

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.nfcreading.domain.usecases.NFCReadingUseCase
-keep class com.idenfy.idenfySdk.nfcreading.domain.usecases.NFCReadingUseCase { *; }
-keepclassmembers class com.idenfy.idenfySdk.nfcreading.domain.usecases.NFCReadingUseCase { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.di.NFCDIProvider
-keep class com.idenfy.idenfySdk.di.NFCDIProvider { *; }
-keepclassmembers class com.idenfy.idenfySdk.di.NFCDIProvider { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.di.NFCDIProviderInjector
-keep class com.idenfy.idenfySdk.di.NFCDIProviderInjector { *; }
-keepclassmembers class com.idenfy.idenfySdk.di.NFCDIProviderInjector { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.logging.domain.IdenfyInternalLoggingHandlerUseCase
-keep class com.idenfy.idenfySdk.logging.domain.IdenfyInternalLoggingHandlerUseCase { *; }
-keepclassmembers class com.idenfy.idenfySdk.logging.domain.IdenfyInternalLoggingHandlerUseCase { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.nfcreading.domain.models.NFCReadingKeyValuesModel
-keep class com.idenfy.idenfySdk.nfcreading.domain.models.NFCReadingKeyValuesModel { *; }
-keepclassmembers class com.idenfy.idenfySdk.nfcreading.domain.models.NFCReadingKeyValuesModel { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.nfcreading.ui.uiviewmodel.**
-keep class com.idenfy.idenfySdk.nfcreading.ui.uiviewmodel.** { *; }
-keepclassmembers class com.idenfy.idenfySdk.nfcreading.ui.uiviewmodel.** { *; }

-keepnames @kotlin.Metadata class com.idenfy.idenfySdk.nfcreading.utils.ConstsNFCReading
-keep class com.idenfy.idenfySdk.nfcreading.utils.ConstsNFCReading { *; }
-keepclassmembers class com.idenfy.idenfySdk.nfcreading.utils.ConstsNFCReading { *; }

-keep public class androidx.compose.*.**{*;}

#IDLive
-keep class net.idrnd.** { *; }

#ML Kit
-ignorewarnings
-keepattributes *Annotation*
-keepattributes Exceptions
-keepattributes SourceFile,LineNumberTable
-keep class com.huawei.hianalytics.**{*;}
-keep class com.huawei.updatesdk.**{*;}
-keep class com.huawei.hms.**{*;}