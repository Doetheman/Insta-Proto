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
#import "DateTools.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //(    PFFile *)getPFFileFromImage:
    NSString *url = self.selectedPost.image.url ;
    NSURL *urlLink = [NSURL URLWithString:url];
    [self.detailImage setImageWithURL: urlLink];
    self.captionLabel.text = self.selectedPost.caption;
    self.likeCount.text = [NSString stringWithFormat:@"%@", self.selectedPost.likeCount];
    self.currentUser.text = self.selectedPost.author.username;
    NSDateFormatter * formatter= [[NSDateFormatter alloc]init];
    //Configure input formate to parse the date string
    formatter.dateFormat= @"E MMM d HH:mm:ss Z y";
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    //Convert string to date
     NSString *date = [formatter stringFromDate: self.selectedPost.createdAt];
     self.timeLabel.text = date;

}
- (IBAction)profile:(id)sender {
    [self performSegueWithIdentifier:@"showFeed" sender:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
