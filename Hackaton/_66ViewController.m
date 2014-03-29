//
//  _66ViewController.m
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/28/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "_66ViewController.h"
#import "GameViewController.h"

@interface _66ViewController ()

@end

@implementation _66ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)shareFb:(id)sender {
    if(NSClassFromString(@"SLComposeViewController") != nil)
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [mySLComposerSheet setInitialText:@"Conoce ya El Dorado el mejor juego para aprender de tu ciudad."]; //the message you want to post
        //[mySLComposerSheet addURL:[NSURL URLWithString:@"http://google.com"]];
        //[mySLComposerSheet addImage:imgInformation.image];
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
        [mySLComposerSheet setInitialText:@"Conoce ya El Dorado el mejor juego para aprender de tu ciudad."]; //the message you want to post
        //[mySLComposerSheet addURL:[NSURL URLWithString:@"http://google.com"]];
        //[mySLComposerSheet addImage:imgInformation.image];
        [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        }];
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
}


 #pragma mark - Navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
     if ([[segue identifier] isEqualToString:@"goStart"]) {
         GameViewController *detail = [segue destinationViewController];
         detail.scoreInt = 0;
     }
 }



@end
