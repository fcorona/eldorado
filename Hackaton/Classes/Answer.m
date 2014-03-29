//
//  Answer.m
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "Answer.h"

@implementation Answer

-(id)init
{
    self = [super init];
    if (self) {
        idAnswer = 0;
        txtAnswer = @"";
        isTrue = @"";
    }
    return self;
}

//GETS
-(int)getIdAnswer{
    return idAnswer;
}
-(NSString*)getTxtAnswer{
    return txtAnswer;
}
-(NSString*)getIsTrue{
    return isTrue;
}
//SETS
-(void)setIdAnswer:(int)idAnswerN{
    idAnswer = idAnswerN;
}
-(void)setTxtAnswer:(NSString*)txtAnswerN{
    txtAnswer = txtAnswerN;
}
-(void)setIsTrue:(NSString*)isTrueN{
    isTrue = isTrueN;
}

@end
