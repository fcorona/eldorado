//
//  FinalViewController.h
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinalViewController : UIViewController

@property int finalScore;
@property (nonatomic,strong) NSString* imgURl;
@property (nonatomic,strong) IBOutlet UIImageView* imgView;
@property (nonatomic,strong) IBOutlet UILabel * txtScore;
@property (nonatomic,strong) IBOutlet UILabel * txtRecord;
@property (nonatomic,strong) IBOutlet UIButton * btnRecord;
@end
