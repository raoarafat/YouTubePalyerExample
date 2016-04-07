//
//  ViewController.m
//  YouTubeExample
//
//  Created by Arafat on 19/12/2015.
//  Copyright © 2015 Arafat Khan. All rights reserved.
//

#import "ViewController.h"
#import "YoutubeViewCell.h"
#import "YoutubeThumbnailViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"YouTube Example App";
    
//    NSDictionary *playerVars = @{
//                                 @"playsinline" : @1,
//                                 };
//    [self.playerView loadWithVideoId:@"Uvj827SqHak" playerVars:playerVars];
    
//    
//    self.playerView.delegate = self;
//    
//    NSURL * url = [self.playerView videoUrl];
//    
//    NSTimeInterval time = [self.playerView duration];
//    
//    [self.playerView loadWithVideoId:@"Uvj827SqHak"];
    
  //  [self playVideoWithId:@"Uvj827SqHak"];
}

- (IBAction)playVideo:(id)sender {
    [self.playerView playVideo];
}

- (IBAction)stopVideo:(id)sender {
    [self.playerView stopVideo];
}

// for you tube thumbnail images
//http://img.youtube.com/vi/LKk6SvGmJj4/0.jpg

//NSString * youtubeID = @"TJkmc8-eyvE";
//NSURL *youtubeURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.youtube.com/vi/%@/0.jpg",youtubeId];
//default
//hqdefault
//mqdefault
//sddefault
//maxresdefault



- (void)playVideoWithId:(NSString *)videoId {
    
    NSString *youTubeVideoHTML = @"<html><head><style>body{margin:0px 0px 0px 0px;}</style></head> <body> <div id=\"player\"></div> <script> var tag = document.createElement('script'); tag.src = 'http://www.youtube.com/player_api'; var firstScriptTag = document.getElementsByTagName('script')[0]; firstScriptTag.parentNode.insertBefore(tag, firstScriptTag); var player; function onYouTubePlayerAPIReady() { player = new YT.Player('player', { width:'768', height:'1024', videoId:'sLVGweQU7rQ', events: { 'onReady': onPlayerReady } }); } function onPlayerReady(event) { event.target.playVideo(); } </script> </body> </html>";
    
    NSString *html = [NSString stringWithFormat:youTubeVideoHTML, videoId];
    
    UIWebView *videoView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024)];
    videoView.backgroundColor = [UIColor clearColor];
    videoView.opaque = NO;
    //videoView.delegate = self;
    [self.view addSubview:videoView];
    
    videoView.mediaPlaybackRequiresUserAction = NO;
    
    [videoView loadHTMLString:youTubeVideoHTML baseURL:[[NSBundle mainBundle] resourceURL]];
}

#pragma mark - UITableViewDelegate & DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    /* Return the number of sections. */
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /* Return the number of rows in the section. */
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    /* Specify Custom ImagesTableViewCell here */
//    static NSString *CellIdentifier = @"YoutubeViewCell";
//    
//    YoutubeViewCell *cell = (YoutubeViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    /* Configure the cell */
//    if (cell == nil) {
//        cell = [[YoutubeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    
//    cell.playerView.delegate = self;
//    
//    [cell.playerView setTag:indexPath.row];
//    
//    [cell.playerView loadWithVideoId:@"JgIjGEpSdDw"];
//    cell.lblTitle.text = @"Hindi Song";

    
    
    /* Specify Custom ImagesTableViewCell here */
    static NSString *CellIdentifier = @"YoutubeThumbnailViewCell";
    
    YoutubeThumbnailViewCell *cell = (YoutubeThumbnailViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    /* Configure the cell */
    if (cell == nil) {
        cell = [[YoutubeThumbnailViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    [cell.imageView setTag:indexPath.row];
    
   
   // NSString *url = [NSString stringWithFormat:@"http://www.gettyimages.co.uk/CMS/StaticContent/1391099215267_hero2.jpg"];
    
    NSString * youtubeID = @"JgIjGEpSdDw";
    NSString *url = [NSString stringWithFormat:@"http://img.youtube.com/vi/%@/hqdefault.jpg",youtubeID];
    
    
    NSURL *youtubeURL = [NSURL URLWithString:url];
    
    [cell.imgViewThumbnail sd_setImageWithURL:youtubeURL placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(error){
                cell.imgViewThumbnail.image = [UIImage imageNamed:@"img_thumb_product.png"];
            }else{
                cell.imgViewThumbnail.image = image;
            }
        });
        
        
    }];
    
    cell.lblTitle.text = @"Architecture | View Peter Maddison's story";

    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [self.tblView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"segueToYouTubePlayer" sender:self];
}

#pragma mark - YTPlayerView Delegate


- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state {
    switch (state) {
        case kYTPlayerStatePlaying:{
            NSLog(@"Started playback");
            NSURL * url = [self.playerView videoUrl];
            
            NSTimeInterval time = [self.playerView duration];
        }
            break;
        case kYTPlayerStatePaused:
            NSLog(@"Paused playback");
            break;
        default:
            break;
    }
}

- (void)playerViewDidBecomeReady:(YTPlayerView *)playerView{
    
    NSInteger tag = playerView.tag;
    
    NSLog(@"tag:%ld",(long)tag);
    
    NSTimeInterval time = [self.playerView duration];
    
    double minutes = floor(time/60);
    double seconds = round(time - minutes * 60);
    
    NSURL * url = [self.playerView videoUrl];
    
    

}


@end
