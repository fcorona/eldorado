//
//  Connection.m
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "Connection.h"
#import "Answer.h"
#import "Question.h"
#import "Score.h"

@implementation Connection
@synthesize returnList;

-(id)init{
    self = [super init];
    if (self) {
        returnList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString *) filePath{
    return [[NSBundle bundleForClass:[self class]] pathForResource:@"Hackaton" ofType:@"sqlite"];
}

//open the db
-(void)openDB {
    if(sqlite3_open([[self filePath] UTF8String], &db)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"Database failed to open");
    }else{
      //  NSLog(@"database opened");
    }
}

//Method to get All Answers by random
-(NSMutableArray*) getRandomQuestions{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM QUESTION ORDER BY RANDOM();"];
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            Question *queObj = [[Question alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSString *field1str = [[NSString alloc]initWithUTF8String:field1];
            [queObj setIdQuestion: field1str.intValue];
            field1 = (char *) sqlite3_column_text(statement, 1);
            [queObj setTxtQuestion: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 2);
            [queObj setImgQuestion:[[NSString alloc]initWithUTF8String:field1]];
            [returnList addObject:queObj];
        }
    }
    return returnList;
}
//Get 4 Answers randomly
-(NSMutableArray*)getRandomAnswers:(int)id_question{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql = [NSString stringWithFormat:@"SELECT id_answer,text_answer,is_answer FROM ANSWER WHERE id_question = %d ORDER BY RANDOM();", id_question];
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            Answer *ansObj = [[Answer alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSString *field1str = [[NSString alloc]initWithUTF8String:field1];
            [ansObj setIdAnswer: field1str.intValue];
            field1 = (char *) sqlite3_column_text(statement, 1);
            [ansObj setTxtAnswer:[[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 2);
            [ansObj setIsTrue:[[NSString alloc]initWithUTF8String:field1]];
            [returnList addObject:ansObj];
        }
    }
    return returnList;
}



//Get All Scores
-(NSMutableArray*)getAllRanking{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM SCORE ORDER BY total_score DESC; "];
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            Score *scoObj = [[Score alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSString *field1str = [[NSString alloc]initWithUTF8String:field1];
            [scoObj setIdScore:field1str.intValue];
            field1 = (char *) sqlite3_column_text(statement, 1);
            [scoObj setNomUser:[[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 2);
            field1str = [[NSString alloc]initWithUTF8String:field1];
            [scoObj setFinalScore:field1str.intValue];
            [returnList addObject:scoObj];
        }
    }
    return returnList;
}


//Save new score
-(void)insertScore:(NSString*)namUser :(int)scoreTotal {
   /* NSString *sql = [NSString stringWithFormat:@"INSERT INTO SCORE (nom_user, total_score) VALUES ('%@',%d);",namUser,scoreTotal];
    NSLog(@"%@",sql);
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        
        sqlite3_step(statement); //Aquí se ejecuta tu consulta
        NSLog(@"Se ejecuto");        
        
    }else{
        NSLog(@"Error en la consulta a la base de datos");
    }
    
    sqlite3_finalize(statement);
    */
    sqlite3_stmt *statement;
        /*const char *sql = [[NSString stringWithFormat:@"INSERT INTO SCORE (nom_user, total_score) VALUES ('%@',%d);",namUser,scoreTotal] UTF8String];*/
    
    
        if (statement == nil) {
//            [NSString stringWithFormat:@"INSERT INTO SCORE (nom_user, total_score) VALUES VALUES(%@,%@)", namUser,scoreTotal];
            const char *sql = [[NSString stringWithFormat:@"INSERT INTO SCORE (nom_user, total_score) VALUES ('%@',%d);",namUser,scoreTotal] UTF8String];
            if (sqlite3_prepare_v2(db, sql, -1, &statement, NULL) != SQLITE_OK) {
                NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(db));
            }
            
           // sqlite3_bind_text(statement, 2, [namUser UTF8String], -1,  SQLITE_TRANSIENT );
           // sqlite3_bind_text(statement, 3, [[NSString stringWithFormat:@"%d",scoreTotal] UTF8String], -1, SQLITE_TRANSIENT );
        }
        sqlite3_step(statement);
        
        sqlite3_reset(statement);
        /*if (success != SQLITE_ERROR) {
            NSLog(@"error");
        }*/
    sqlite3_finalize(statement);
    sqlite3_close(db);

    
    
}

//Select Max Score
-(int)selectMaxScore{
    NSString *sql = [NSString stringWithFormat:@"SELECT MAX(total_score) FROM SCORE;"];
    sqlite3_stmt *statement;
    int max;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSString *field1str = [[NSString alloc]initWithUTF8String:field1];
            max = field1str.intValue;
        }
    }else{
        NSLog(@"Holy crap, an Error!");
    }
    return max;
}

//Select Advice

-(NSString*)getAdvice:(int)id_question{
    
    NSString *sql = [NSString stringWithFormat:@"SELECT txt_advice FROM ADVICE WHERE id_question = %d;",id_question];
    sqlite3_stmt *statement;
    NSString *advice = [[NSString alloc]init];
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSString *field1str = [[NSString alloc]initWithUTF8String:field1];
            advice = field1str;
        }
    }else{
        NSLog(@"Holy crap, an Error!");
    }
    return advice;
}

@end



