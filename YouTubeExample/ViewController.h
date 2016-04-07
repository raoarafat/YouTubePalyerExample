//
//  ViewController.h
//  YouTubeExample
//
//  Created by Arafat on 19/12/2015.
//  Copyright © 2015 Arafat Khan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController : UIViewController<YTPlayerViewDelegate>

@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;

@property (weak, nonatomic) IBOutlet UITableView * tblView;

@end

