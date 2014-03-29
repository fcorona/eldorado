//
//  Question.h
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Answer.h"

@interface Question : NSObject{
    int idQuestion;
    NSString * txtQuestion;
    NSString * imgQuestion;
    Answer* ans1;
    Answer* ans2;
    Answer* ans3;
    Answer* ans4;
}

//GETS
-(int)getIdQuestion;
-(NSString*)getTxtQuestion;
-(NSString*)getImgQuestion;
-(Answer*)getAns1;
-(Answer*)getAns2;
-(Answer*)getAns3;
-(Answer*)getAns4;
//SETS
-(void)setIdQuestion:(int)idQuestionN;
-(void)setTxtQuestion:(NSString*)txtQuestionN;
-(void)setImgQuestion:(NSString*)imgQuestionN;
-(void)setAns1:(Answer*)getAns1N;
-(void)setAns2:(Answer*)getAns2N;
-(void)setAns3:(Answer*)getAns3N;
-(void)setAns4:(Answer*)getAns4N;

@end
