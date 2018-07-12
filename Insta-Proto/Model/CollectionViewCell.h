//
//  CollectionViewCell.h
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/11/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <ParseUI/ParseUI.h>


//Protocal to delegate when cell is tapped
@protocol CollectionViewCellDelegate;


@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PFImageView *cellImage;
@property (strong, nonatomic) Post *Post;
@property (strong, nonatomic) id<CollectionViewCellDelegate> delegate;
@end

@protocol CollectionViewCellDelegate

-(void) collectionViewCell:(CollectionViewCell *)collectionViewCell didTap:(Post *) tapPost;

@end
