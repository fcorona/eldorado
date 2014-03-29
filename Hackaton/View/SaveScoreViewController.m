//
//  SaveScoreViewController.m
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "SaveScoreViewController.h"
#import "Connection.h"



@interface SaveScoreViewController ()

@end

@implementation SaveScoreViewController

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
    // Do any additional setup after loading the view.
    
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
    _namUser = _txtNamUser.text;
    NSLog(@"%@",_namUser);
    NSLog(@"Puntaje: %d",_finalScore);
    Connection *conn = [[Connection alloc]init];
    [conn openDB];
    //[conn insertScore:_namUser :_finalScore];
}


@end
