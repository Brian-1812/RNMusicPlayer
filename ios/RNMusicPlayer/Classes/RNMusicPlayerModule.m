//
//  RNMusicPlayerModule.m
//  RNMusicPlayer
//
//  Created by Shokhrukhmirzo Toyirov on 26/10/24.
//

#import "RNMusicPlayerModule.h"
#import <AVFoundation/AVFoundation.h>

@interface RNMusicPlayerModule ()

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) NSMutableArray<NSString *> *playlist;
@property (nonatomic) NSInteger currentIndex;

@end

@implementation RNMusicPlayerModule

RCT_EXPORT_MODULE();

- (instancetype)init {
    self = [super init];
    if (self) {
        _playlist = [NSMutableArray array];
        _currentIndex = 0;
    }
    return self;
}

RCT_EXPORT_METHOD(play:(NSString *)url) {
    NSURL *audioURL = [NSURL URLWithString:url];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
    [self.audioPlayer play];
}

RCT_EXPORT_METHOD(pause) {
    [self.audioPlayer pause];
}

RCT_EXPORT_METHOD(stop) {
    [self.audioPlayer stop];
}

RCT_EXPORT_METHOD(createPlaylist:(NSArray<NSString *> *)urls) {
    [self.playlist addObjectsFromArray:urls];
}

RCT_EXPORT_METHOD(playNext) {
    if (self.currentIndex < self.playlist.count) {
        [self play:self.playlist[self.currentIndex]];
        self.currentIndex++;
    }
}

@end
