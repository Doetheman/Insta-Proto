//
//  Post.h
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/10/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//
#import "Parse/Parse.h"
#import "PFObject.h"

@interface Post : PFObject<PFSubclassing>
//attributes for post 
@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFile *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion;


@end
