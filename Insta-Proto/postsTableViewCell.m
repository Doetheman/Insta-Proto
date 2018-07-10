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


@implementation postsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


-(void) setPost:(Post *)post{
    _post = post;
//(    PFFile *)getPFFileFromImage:
    NSString *url = post.image.url ;
    NSURL *urlLink = [NSURL URLWithString:url];
    [self.postImage setImageWithURL: urlLink];
    self.postLabel.text = post.caption;
    
}

@end
