export interface Song {
  id: string;
  name: string;
  url: string; // Remote or Local
}

export interface Playlist {
  id: string;
  name: string;
  songs: Song[];
}

export type PlaybackStatus = "playing" | "stopped" | "paused";
