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
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)likeAction{
    if ([self.post.likes containsObject: PFUser.user.objectId]) {
        self.likesCount.text = [NSString stringWithFormat:@"%lu", self.post.likes.count - 1];
        self.like.setImage: [UIImage imageNamed:@" ]forState:<#(UIControlState)#>
    } else {
        <#statements#>
    }
}
-(void) setPost:(Post *)post{
    _post = post;
//(    PFFile *)getPFFileFromImage:
    NSString *url = post.image.url ;
    NSURL *urlLink = [NSURL URLWithString:url];
    [self.postImage setImageWithURL: urlLink];
    self.postLabel.text = post.caption;
    self.likesCount.text = [NSString stringWithFormat:@"%@", post.likeCount];
    self.authorHeader.text = post.author.username;
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

@end
