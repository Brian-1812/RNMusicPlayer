package com.rnmusicplayer;

import android.media.MediaPlayer;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.modules.core.DeviceEventManagerModule;

public class RNMusicPlayerModule extends ReactContextBaseJavaModule {
    private MediaPlayer mediaPlayer;
    private final ReactApplicationContext reactContext;

    public RNMusicPlayerModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNMusicPlayer";
    }

    @ReactMethod
    public void play(String url, Promise promise) {
        stop(null);
        mediaPlayer = new MediaPlayer();
        try {
            mediaPlayer.setDataSource(url);
            mediaPlayer.prepare();
            mediaPlayer.start();
            sendStatus("playing");
            promise.resolve(null);
        } catch (Exception e) {
            promise.reject("ERROR", e.getMessage());
        }
    }

    @ReactMethod
    public void pause(Promise promise) {
        if (mediaPlayer != null && mediaPlayer.isPlaying()) {
            mediaPlayer.pause();
            sendStatus("paused");
            promise.resolve(null);
        }
    }

    @ReactMethod
    public void stop(Promise promise) {
        if (mediaPlayer != null) {
            mediaPlayer.stop();
            mediaPlayer.release();
            mediaPlayer = null;
            sendStatus("stopped");
            if (promise != null) promise.resolve(null);
        }
    }

    private void sendStatus(String status) {
        reactContext
            .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
            .emit("playbackStatusChange", status);
    }
}
