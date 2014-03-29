//
//  Connection.h
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface Connection : NSObject{
    sqlite3 *db;
}

@property (nonatomic, retain) NSMutableArray *returnList;

-(NSString *) filePath;
-(void) openDB;
-(NSMutableArray*)getRandomQuestions;
-(NSMutableArray*)getRandomAnswers:(int)id_question;
-(NSMutableArray*)getAllRanking;
-(void)insertScore:(NSString*)namUser :(int)scoreTotal;
-(int)selectMaxScore;
-(NSString*)getAdvice:(int)id_question;

@end

