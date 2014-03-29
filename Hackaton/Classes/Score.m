//
//  Score.m
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "Score.h"

@implementation Score

-(id)init
{
    self = [super init];
    if (self) {
        idScore = 0;
        nomUser = @"";
        finalScore = 0;
    }
    return self;
}
//GETS
-(int)getIdScore{
    return idScore;
}
-(NSString*)getNomUser{
    return nomUser;
}
-(int)getFinalScore{
    return finalScore;
}
//SETS
-(void)setIdScore:(int)idScoreN{
    idScore = idScoreN;
}
-(void)setNomUser:(NSString*)nomUserN{
    nomUser = nomUserN;
}
-(void)setFinalScore:(int)finalScoreN{
    finalScore  = finalScoreN;
}
@end
