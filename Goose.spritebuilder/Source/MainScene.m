//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene
{
    CCSprite* _goose;
    CCLabelTTF* _scorelabel;
    
    int score;
}

- (id)init
{
    if (self = [super init])
    {
        // activate touches on this scene
        self.userInteractionEnabled = TRUE;
    }
    return self;
}


-(void) didLoadFromCCB
{
    _goose.zOrder = 3;
    score = 0;
    _scorelabel.zOrder = 2;
}


- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    [[OALSimpleAudio sharedInstance] playEffect:@"fart.m4a"];
    
    score++;
    
    _scorelabel.string = [NSString stringWithFormat:@"Score: %d",score];
    
    CGPoint touchpos = [touch locationInNode:self];
    _goose.position = ccp(touchpos.x,touchpos.y+30);
    
    Egg* egg = [CCBReader load:@"Egg"];
    egg.position = [touch locationInNode:self];
    egg.scale = 0;
    
    id scaleuup = [CCActionScaleTo actionWithDuration:1 scale:0.3];
    [self addChild:egg];
    [egg runAction:scaleuup];
    
    _goose.scaleY = 0.3;
    id scaley = [CCActionScaleTo actionWithDuration:0.3 scale:0.6];
    [_goose runAction:scaley];

}


@end
