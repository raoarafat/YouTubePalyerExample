//
//  YoutubeViewCell.h
//  SEEKA
//
//  Created by Arafat on 20/12/2015.
//  Copyright © 2015 Arafat Khan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

@interface YoutubeViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel * lblTitle;
@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;

@end
