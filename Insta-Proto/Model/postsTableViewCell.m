//
//  postsTableViewCell.m
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/9/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//
#import "Post.h"
#import "ComposeViewController.h"
#import "postsTableViewCell.h"
#import <ParseUI/ParseUI.h>
#import <UIIMageView+AFNetworking.h>
#import "DateTools.h"

@implementation postsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //Make progfile image round
    self.profileImage.layer.cornerRadius = 15;
    self.profileImage.clipsToBounds = true;

    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
//Action of like button
- (IBAction)likeButton:(id)sender {
    [self likeAction];
}
//Will search through to check if user has liked the post or not
-(void)likeAction{
    if ([self.post.likes containsObject: PFUser.currentUser.objectId]) {
        self.likesCount.text = [NSString stringWithFormat:@"%lu", self.post.likes.count - 1];
        [self.like setImage: [UIImage imageNamed:@"purpHeart"] forState:UIControlStateNormal];
        [self.post unlike:PFUser.currentUser.objectId];
    } else {
        self.likesCount.text = [NSString stringWithFormat:@"%lu", self.post.likes.count + 1];
        [self.like setImage:[UIImage imageNamed:@"iconmonstr-heart-thin-240"] forState:UIControlStateNormal];
        [self.post like:PFUser.currentUser.objectId];
    }
}
//Sets objects to post 
-(void) setPost:(Post *)post{
    _post = post;
//(    PFFile *)getPFFileFromImage:
    NSString *url = post.image.url ;
    NSURL *urlLink = [NSURL URLWithString:url];
    self.postImage.image = nil; 
    [self.postImage setImageWithURL: urlLink];
    self.postLabel.text = post.caption;
    self.likesCount.text = [NSString stringWithFormat:@"%@", post.likeCount];
    self.authorHeader.text = post.author.username;
    
    NSDateFormatter * formatter= [[NSDateFormatter alloc]init];
    //Configure input formate to parse the date string
    formatter.dateStyle = NSDateIntervalFormatterMediumStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    self.timeOfPost.text = [formatter stringFromDate:post.createdAt];
//    formatter.dateStyle = NSDateFormatterShortStyle;
//    formatter.timeStyle = NSDateFormatterShortStyle;
//    formatter.timeStyle = NSDateFormatterNoStyle;
//  //    Convert string to date
//       self.timeOfPost.text = date;
}

@end
