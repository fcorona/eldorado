//
//  Score.h
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject{
    int idScore;
    NSString* nomUser;
    int finalScore;
}
//GETS
-(int)getIdScore;
-(NSString*)getNomUser;
-(int)getFinalScore;
//SETS
-(void)setIdScore:(int)idScoreN;
-(void)setNomUser:(NSString*)nomUserN;
-(void)setFinalScore:(int)finalScoreN;

@end
