//
//  YouTubePlayerViewController.m
//  YouTubeExample
//
//  Created by Arafat on 20/12/2015.
//  Copyright © 2015 Arafat Khan. All rights reserved.
//

#import "YouTubePlayerViewController.h"

@interface YouTubePlayerViewController ()

@end

@implementation YouTubePlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"YouTube Player";
    
    [self.playerView loadWithVideoId:@"JgIjGEpSdDw"];
}

- (IBAction)done:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
