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
    CCPhysicsNode* physics;
    
    NSMutableArray* eggs;
    
    int score;
}

- (id)init
{
    if (self = [super init])
    {
        // activate touches on this scene
        
        self.userInteractionEnabled = TRUE;
        
        eggs = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void) didLoadFromCCB
{
    _goose.zOrder = 3;
    score = 0;
    _scorelabel.zOrder = 2;
}


+(id) scene
{
    CCScene *scene = [CCScene node];
    
    MainScene *layer = [MainScene node];
    
    [scene addChild: layer];
    
    return scene;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    int x = arc4random() % 2;
    
    if(x == 0)
    {
        [[OALSimpleAudio sharedInstance] playEffect:@"fart.m4a"];
    }
    else
    {
        [[OALSimpleAudio sharedInstance] playEffect:@"fart2.m4a"];
    }
    
    score++;
    
    _scorelabel.string = [NSString stringWithFormat:@"Score: %d",score];
    
    CGPoint touchpos = [touch locationInNode:self];
    _goose.position = ccp(touchpos.x,touchpos.y+30);
    
    Egg* egg = [CCBReader load:@"Egg"];
    egg.position = [touch locationInNode:self];
    egg.scale = 0;
    
    [eggs addObject:egg];
    
    id scaleuup = [CCActionScaleTo actionWithDuration:1 scale:0.3];
    [self addChild:egg];
    [egg runAction:scaleuup];
    
    _goose.scaleY = 0.3;
    id scaley = [CCActionScaleTo actionWithDuration:0.3 scale:0.6];
    [_goose runAction:scaley];

}

- (void)update:(CCTime)delta {
    for(int i = 0; i < [eggs count];i++)
    {
        CCSprite* egg = [eggs objectAtIndex:i];
        egg.position = ccp(egg.position.x,egg.position.y - 3);
    }
}


@end
