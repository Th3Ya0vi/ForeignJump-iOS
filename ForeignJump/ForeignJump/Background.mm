//
//  Background.mm
//  ForeignJump
//
//  Created by Francis Visoiu Mistrih on 25/07/13.
//  Copyright Epimac 2013. All rights reserved.
//

// Import the interfaces
#import "Background.h"

@implementation Background {
    CGSize size;
    Hero *hero;
    float worldWidth;
}

#pragma mark - synthesize
@synthesize sun;
@synthesize animation;

#pragma mark - Init methods
-(id) init
{
	if( (self=[super init])) {
		
        size = [[CCDirector sharedDirector] winSize];
        
        hero = [Hero heroInstance];
        animation = true;
        
        worldWidth = [InGame getWorldWidth];
        
        //background
        
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
			background = [CCSprite spriteWithFile:@"Background/bg.png"];
		} else {
			background = [CCSprite spriteWithFile:@"Background/bg.png"];
		}
		background.position = ccp(size.width/2, size.height/2);
        
        [self addChild: background z: 0];

        //end background
        
        [self setupBackgroundImage];
	}
	return self;
}

- (void)setupBackgroundImage {

    sun = [CCSprite spriteWithFile:@"Background/sun.png"];
    
    sun.position = ccp(size.width, size.height/2);

    [self addChild:sun z:1];
    
    //add schedule to move backgrounds
    [self schedule:@selector(moveBackground)];
}

#pragma mark - Update methods
- (void)moveBackground {
    float hpos = hero.texture.position.x;
    float xpos = (worldWidth - hpos)/7;
    sun.position = ccp(xpos, sun.position.y);
}
@end
