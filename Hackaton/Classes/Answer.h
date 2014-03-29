//
//  Answer.h
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Answer : NSObject
{
    int idAnswer;
    NSString *txtAnswer;
    NSString *isTrue;
}

//GETS
-(int)getIdAnswer;
-(NSString*)getTxtAnswer;
-(NSString*)getIsTrue;
//SETS
-(void)setIdAnswer:(int)idAnswerN;
-(void)setTxtAnswer:(NSString*)txtAnswerN;
-(void)setIsTrue:(NSString*)isTrueN;

@end
