//
//  GameViewController.m
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "GameViewController.h"
#import "InfoViewController.h"
#import "Connection.h"
#import "Question.h"
#import "Answer.h"


@interface GameViewController ()

@end

@implementation GameViewController
@synthesize questions,answers,scoreInt;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Connection *conn = [[Connection alloc]init];
    [conn openDB];
    if(scoreInt==0){
        questions = [conn getRandomQuestions];
        q = [questions objectAtIndex:0];
    }else{
        q = [questions objectAtIndex:scoreInt];
    }
    _question.text = [q getTxtQuestion];
    answers= [conn getRandomAnswers:[q getIdQuestion]];
    [q setAns1:[answers objectAtIndex:0]];
    [q setAns2:[answers objectAtIndex:1]];
    [q setAns3:[answers objectAtIndex:2]];
    [q setAns4:[answers objectAtIndex:3]];
    _a1.titleLabel.text = [[q getAns1] getTxtAnswer];
    [_a1 setTitle:[[q getAns1] getTxtAnswer] forState:UIControlStateNormal];
    [_a1 setTitle:[[q getAns1] getTxtAnswer] forState:UIControlStateSelected];
    _a2.titleLabel.text = [[q getAns2] getTxtAnswer];
    [_a2 setTitle:[[q getAns2] getTxtAnswer] forState:UIControlStateNormal];
    [_a2 setTitle:[[q getAns2] getTxtAnswer] forState:UIControlStateSelected];
    _a3.titleLabel.text = [[q getAns3] getTxtAnswer];
    [_a3 setTitle:[[q getAns3] getTxtAnswer] forState:UIControlStateNormal];
    [_a3 setTitle:[[q getAns3] getTxtAnswer] forState:UIControlStateSelected];
    _a4.titleLabel.text = [[q getAns4] getTxtAnswer];
    [_a4 setTitle:[[q getAns4] getTxtAnswer] forState:UIControlStateNormal];
    [_a4 setTitle:[[q getAns4] getTxtAnswer] forState:UIControlStateSelected];
    _score.text = [NSString stringWithFormat:@"Puntaje: %d", scoreInt];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    InfoViewController *detail = [segue destinationViewController];
    NSString *theString = [segue identifier];   // The one we want to switch on
    NSArray *items = @[@"goInfoA", @"goInfoB", @"goInfoC", @"goInfoD"];
    int item = (int)[items indexOfObject:theString];
    detail.scoreInt = scoreInt;
    detail.questions = questions;
    switch (item) {
        case 0:
            if([[[q getAns1] getIsTrue] isEqualToString:@"Y"]){
                NSLog(@"Verdadera");
                detail.win = 1;
            }else{
                NSLog(@"Falsa");
                detail.win = 2;
            }
            break;
        case 1:
            if([[[q getAns2] getIsTrue] isEqualToString:@"Y"]){
                NSLog(@"Verdadera");
                detail.win = 1;
            }else{
                NSLog(@"Falsa");
                detail.win = 2;
            }
            break;
        case 2:
            if([[[q getAns3] getIsTrue] isEqualToString:@"Y"]){
                NSLog(@"Verdadera");
                detail.win = 1;
            }else{
                NSLog(@"Falsa");
                detail.win = 2;
            }
            break;
        case 3:
            if([[[q getAns4] getIsTrue] isEqualToString:@"Y"]){
                NSLog(@"Verdadera");
                detail.win = 1;
            }else{
                NSLog(@"Falsa");
                detail.win = 2;
            }
            break;
        default:
            break;
    }
}


@end
