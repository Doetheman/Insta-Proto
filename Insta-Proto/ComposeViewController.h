//
//  ComposeViewController.h
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/9/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextView *caption;
@property (strong, nonatomic) UIImage *composeImage;
@end
