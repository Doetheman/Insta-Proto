//
//  CollectionViewCell.m
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/11/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//
#import "Post.h"
#import "CollectionViewCell.h"
#import <UIIMageView+AFNetworking.h>

@implementation CollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *tapOnCell = [[UITapGestureRecognizer alloc]initWithTarget:self action: @selector(tapForDetailCell:)];
    NSLog(@"You Tapped");
    [self.cellImage addGestureRecognizer:tapOnCell];
    [self.cellImage setUserInteractionEnabled:YES];
}

-(void) tapForDetailCell:(UITapGestureRecognizer *)sender{
    NSLog(@"got it boss");
    [self.delegate collectionViewCell:self didTap:self.Post];
}

@end
