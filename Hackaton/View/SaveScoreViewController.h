//
//  SaveScoreViewController.h
//  Hackaton
//
//  Created by Jorge Raul Ovalle Zuleta on 3/29/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaveScoreViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField * txtNamUser;
@property NSString* namUser;
@property int finalScore;


@end
