//
//  FinalViewController.m
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "FinalViewController.h"
#import "Connection.h"
#import "SaveScoreViewController.h"

@interface FinalViewController ()

@end

@implementation FinalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)saveScore:(id)sender {
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _txtScore.text = [NSString stringWithFormat:@"Tu puntaje final fue: %d",_finalScore];
    Connection *conn = [[Connection alloc]init];
    [conn openDB];
    int max = [conn selectMaxScore];
    
    if(_finalScore>max){
        _txtRecord.alpha = 1;
        _btnRecord.alpha = 1;
    }
    /*_txtRecord.text = _final;
    
    _txtRecord2.text = _final;*/
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goSave"]) {
        SaveScoreViewController *detail  = [segue destinationViewController];
        detail.finalScore = _finalScore;
    }
    
}


@end
