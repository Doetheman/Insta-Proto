//
//  DetailViewController.m
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/11/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//
#import "Post.h"
#import "DetailViewController.h"
#import "Parse/Parse.h"
#import <UIIMageView+AFNetworking.h>
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) setPost:(Post *)post{
    self.post = post;
    //(    PFFile *)getPFFileFromImage:
    NSString *url = post.image.url ;
    NSURL *urlLink = [NSURL URLWithString:url];
    [self.detailImage setImageWithURL: urlLink];
    self.captionLabel.text = post.caption;
    self.likeCount.text = [NSString stringWithFormat:@"%@", post.likeCount];
    self.currentUser.text = post.author.username;
    NSDateFormatter * formatter= [[NSDateFormatter alloc]init];
    //Configure input formate to parse the date string
    formatter.dateFormat= @"E MMM d HH:mm:ss Z y";
    //Convert string to date
    // NSDate *date = [formatter dateFromString: post.createdAt];
    //    self.timeStamp= date.shortTimeAgoSinceNow;
    //    //Configure output format
    //    formatter.dateStyle = NSDateFormatterShortStyle;
    //    formatter.timeStyle = NSDateFormatterShortStyle;
    //    formatter.timeStyle = NSDateFormatterNoStyle;
    //    //Convert Date to String
    //    self.createdAtString = [formatter stringFromDate:date];
    //    self.timeOfPost.text=
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
