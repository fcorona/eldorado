//
//  GameViewController.h
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"


@interface GameViewController : UIViewController{
    Question* q;
}


@property (nonatomic,strong) IBOutlet UILabel *score;
//@property Question* q;
@property int scoreInt;
@property (nonatomic, strong) NSMutableArray * questions;
@property (nonatomic, strong) NSMutableArray * answers;
@property (nonatomic,strong) IBOutlet UILabel *question;
@property (nonatomic,strong) IBOutlet UIButton *a1;
@property (nonatomic,strong) IBOutlet UIButton *a2;
@property (nonatomic,strong) IBOutlet UIButton *a3;
@property (nonatomic,strong) IBOutlet UIButton *a4;

@end
