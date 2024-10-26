//
//  RNMusicPlayerModule.h
//  RNMusicPlayer
//
//  Created by Shokhrukhmirzo Toyirov on 26/10/24.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNMusicPlayerModule : RCTEventEmitter <RCTBridgeModule>

- (void)play:(NSString *)url;
- (void)pause;
- (void)stop;
- (void)createPlaylist:(NSArray<NSString *> *)urls;
- (void)playNext;

@end

NS_ASSUME_NONNULL_END
