//
//  postsTableViewCell.h
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/9/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"


@interface postsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *postLabel;
@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet UILabel *likesCount;
@property (weak, nonatomic) IBOutlet UILabel *timeOfPost;
@property (weak, nonatomic) IBOutlet UILabel *authorHeader;
@property (weak, nonatomic) IBOutlet UIButton *share;
@property (weak, nonatomic) IBOutlet UIButton *like;
@property (weak, nonatomic) IBOutlet UIButton *comment;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;



@end
