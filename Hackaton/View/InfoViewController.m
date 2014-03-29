//
//  InfoViewController.m
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "InfoViewController.h"
#import "GameViewController.h"
#import "FinalViewController.h"
#import "Question.h"
#import "Answer.h"
#import "Connection.h"

@interface InfoViewController ()

@end

@implementation InfoViewController
@synthesize btnContinuar,imgInformation;

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
    [imgInformation setImage:[UIImage imageNamed:[[_questions objectAtIndex:_scoreInt] getImgQuestion]]];
    Connection *conn = [[Connection alloc]init];
    [conn openDB];
    NSLog(@"Score: %d",_scoreInt);
    NSLog(@"Id de la pregunta: %d",[[_questions objectAtIndex:_scoreInt] getIdQuestion]);
    _secret.text = [conn getAdvice:[[_questions objectAtIndex:_scoreInt] getIdQuestion]];
    _secret.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:19];
    _secret.textColor = [UIColor whiteColor];
    _secret.editable = NO;
    _secret.dataDetectorTypes = UIDataDetectorTypeAll;
    _secret.tintColor = [UIColor colorWithRed:0.400 green:0.157 blue:0.055 alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)continue:(id)sender {
    if(_win == 1){
        if(_scoreInt+1 == [_questions count]){
            NSLog(@"Puntuacion perfecta");
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
            FinalViewController *add = [storyboard instantiateViewControllerWithIdentifier:@"FinalViewController"];
            add.finalScore = (int)[_questions count];
            [self presentViewController:add  animated:YES  completion:nil];
        }
        else{
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
            GameViewController *game = [storyboard instantiateViewControllerWithIdentifier:@"GameViewController"];
            game.scoreInt = _scoreInt + 1;
            game.questions = _questions;
            [self presentViewController:game  animated:YES  completion:nil];
        }
    }else{
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        FinalViewController *add = [storyboard instantiateViewControllerWithIdentifier:@"FinalViewController"];
        add.finalScore = _scoreInt;
        [self presentViewController:add  animated:YES  completion:nil];
    }
}
- (IBAction)shareFb:(id)sender {
    if(NSClassFromString(@"SLComposeViewController") != nil)
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [mySLComposerSheet setInitialText:@"Hey amigos algo interesante de Bogotá"]; //the message you want to post
        [mySLComposerSheet addURL:[NSURL URLWithString:@"http://google.com"]];
        [mySLComposerSheet addImage:imgInformation.image];
        [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        }];
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
}
// Method to share in tw the Information
- (IBAction)shareTw:(id)sender {
    if(NSClassFromString(@"SLComposeViewController") != nil)
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [mySLComposerSheet setInitialText:@"Hey amigos algo interesante de Bogotá"]; //the message you want to post
        [mySLComposerSheet addURL:[NSURL URLWithString:@"http://google.com"]];
        [mySLComposerSheet addImage:imgInformation.image];
        [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        }];
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

*/
    
@end
