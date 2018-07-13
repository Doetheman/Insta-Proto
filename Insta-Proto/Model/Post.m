//
//  Post.m
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/10/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//
#import "postsTableViewCell.h"
#import "Post.h"
#import "Parse/Parse.h"
#import <ParseUI/ParseUI.h>

@implementation Post
@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;
@dynamic likes;
+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    Post *newPost = [Post new];
    //Grabs image
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser]; 
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    newPost.likes = [NSMutableArray new];
    [newPost saveInBackgroundWithBlock: completion];
}

+ (PFFile *)getPFFileFromImage: (UIImage * _Nullable)image {
    
    // check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFile fileWithName:@"image.png" data:imageData];
}
-(void)like:( NSString *)object{
    [self addObject:object forKey:@"likedBy"];
    [self saveInBackground];
}
-(void)unlike:( NSString *)object{
    [self removeObserver:object forKeyPath:@"likedBy"];
    [self saveInBackground];
}



@end
