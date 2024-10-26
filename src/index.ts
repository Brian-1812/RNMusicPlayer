import { NativeEventEmitter, NativeModules, Platform } from "react-native";
import { PlaybackStatus, Playlist, Song } from "./types";

const { RNMusicPlayer } = NativeModules;

if (!RNMusicPlayer) {
  throw new Error("RNMusicPlayer native module is not linked.");
}

export class AudioPlayer {
  private playbackStatus: PlaybackStatus = "stopped";
  private playlist: Playlist | null = null;
  private currentSongIndex: number = 0;

  constructor() {
    const eventEmitter = new NativeEventEmitter(RNMusicPlayer);
    eventEmitter.addListener("playbackStatusChange", this.handleStatusChange);
  }

  get status() {
    return this.playbackStatus;
  }

  play = async (song?: Song): Promise<void> => {
    if (song) {
      await RNMusicPlayer.play(song.url);
      this.playbackStatus = "playing";
    } else if (
      this.playlist &&
      this.currentSongIndex < this.playlist.songs?.length
    ) {
      const song = this.playlist.songs[this.currentSongIndex];
      await RNMusicPlayer.play(song.url);
      this.playbackStatus = "playing";
    }
  };

  pause = async (): Promise<void> => {
    await RNMusicPlayer.pause();
    this.playbackStatus = "paused";
  };

  stop = async (): Promise<void> => {
    await RNMusicPlayer.stop();
    this.playbackStatus = "stopped";
  };

  setPlaylist(playlist: Playlist): void {
    this.playlist = playlist;
    this.currentSongIndex = 0;
  }

  private handleStatusChange = async (status: PlaybackStatus) => {
    this.playbackStatus = status;
    if (status === "stopped" && this.playlist) {
      await this.playNextSong();
    }
  };

  private playNextSong = async () => {
    if (
      this.playlist &&
      this.currentSongIndex < this.playlist.songs.length - 1
    ) {
      this.currentSongIndex += 1;
      await this.play();
    } else {
      await this.stop();
    }
  };
}

export default new AudioPlayer();
