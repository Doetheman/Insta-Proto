//
//  postsTableViewCell.h
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/9/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface postsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *postLabel;

@end
