//
//  InfoViewController.h
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface InfoViewController : UIViewController{
    SLComposeViewController *mySLComposerSheet;
}
@property int win;
@property int scoreInt;
@property (nonatomic, strong) NSMutableArray * questions;
@property (nonatomic,strong) IBOutlet UIButton *btnContinuar;
@property (nonatomic,strong) IBOutlet UIImageView *imgInformation;
@property (nonatomic,strong) IBOutlet UITextView *secret;

@end
