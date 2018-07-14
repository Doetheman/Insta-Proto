//
//  DetailViewController.h
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/11/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//
#import "Post.h"
#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) Post *selectedPost;
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UILabel *currentUser;
@property (weak, nonatomic) IBOutlet UILabel *currentUserAbovePost;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageDetailView;


@end
