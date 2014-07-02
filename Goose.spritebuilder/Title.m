//
//  Title.m
//  Goose
//
//  Created by Kevin Frans on 7/2/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Title.h"
#import "MainScene.h"

@implementation Title

- (id)init
{
    if (self = [super init])
    {
        // activate touches on this scene
        
        self.userInteractionEnabled = TRUE;
        
    }
    return self;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
