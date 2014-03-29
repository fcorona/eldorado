//
//  Question.m
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "Question.h"

@implementation Question

-(id)init
{
    self = [super init];
    if (self) {
        idQuestion = 0;
        txtQuestion = @"";
        imgQuestion = @"";
        ans1 = [[Answer alloc] init];
        ans2 = [[Answer alloc] init];
        ans3 = [[Answer alloc] init];
        ans4 = [[Answer alloc] init];
    }
    return self;
}


//GETS
-(int)getIdQuestion{
    return idQuestion;
}
-(NSString*)getTxtQuestion{
    return txtQuestion;
}
-(NSString*)getImgQuestion{
    return imgQuestion;
}
-(Answer*)getAns1{
    return ans1;
}
-(Answer*)getAns2{
    return ans2;
}
-(Answer*)getAns3{
    return ans3;
}
-(Answer*)getAns4{
    return ans4;
}
//SETS
-(void)setIdQuestion:(int)idQuestionN{
    idQuestion = idQuestionN;
}
-(void)setTxtQuestion:(NSString*)txtQuestionN{
    txtQuestion = txtQuestionN;
}
-(void)setImgQuestion:(NSString*)imgQuestionN{
    imgQuestion = imgQuestionN;
}
-(void)setAns1:(Answer*)ans1N{
    ans1 = ans1N;
}
-(void)setAns2:(Answer*)ans2N{
    ans2 = ans2N;
}
-(void)setAns3:(Answer*)ans3N{
    ans3 = ans3N;
}
-(void)setAns4:(Answer*)ans4N{
    ans4 = ans4N;
}
@end
