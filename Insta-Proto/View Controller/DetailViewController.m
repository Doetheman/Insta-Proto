//
//  DetailViewController.m
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/11/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//
#import "FLAnimatedImage.h"
#import "Post.h"
#import "DetailViewController.h"
#import "Parse/Parse.h"
#import <UIIMageView+AFNetworking.h>
#import "DateTools.h"

@interface DetailViewController ()
@property (strong , nonatomic) FLAnimatedImage *FLimage;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Makes profile image round
    self.profileImageDetailView.layer.cornerRadius = 15;
    self.profileImageDetailView.clipsToBounds = true;
    
    
    //url for image as a string
    NSString *url = self.selectedPost.image.url ;
    //Make url out of string
    NSURL *urlLink = [NSURL URLWithString:url];
    //Use url to place image in imageview
   // [self.detailImage setImageWithURL: urlLink];
    
    self.FLimage = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:urlLink]];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = self.FLimage;
    
    self.detailImage = imageView;
    //Replace label text with post caption
    self.captionLabel.text = self.selectedPost.caption;
    //Gets the amount of likes from post
    self.likeCount.text = [NSString stringWithFormat:@"%@", self.selectedPost.likeCount];
    //Label text replace with user name
    self.currentUser.text = self.selectedPost.author.username;
    //Another label text with user name above image
    self.currentUserAbovePost.text = self.selectedPost.author.username;
    //Initiate date formate
    [self date];
   
   
}
//Switch view controller to profile view
- (IBAction)profile:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) date{
    NSDateFormatter * formatter= [[NSDateFormatter alloc]init];
    formatter.dateStyle = NSDateIntervalFormatterMediumStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    self.timeLabel.text = [formatter stringFromDate:self.selectedPost.createdAt];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
