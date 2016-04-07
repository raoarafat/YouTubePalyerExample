//
//  YoutubeThumbnailViewCell.h
//  YouTubeExample
//
//  Created by Arafat on 20/12/2015.
//  Copyright © 2015 Arafat Khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YoutubeThumbnailViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel * lblTitle;
@property(nonatomic, strong) IBOutlet UIImageView * imgViewThumbnail;

@end
