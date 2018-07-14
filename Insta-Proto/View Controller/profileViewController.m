//
//  profileViewController.m
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/10/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//
#import "DetailViewController.h"
#import "Post.h"
#import "UIImageView+AFNetworking.h"
#import "CollectionViewCell.h"
#import "profileViewController.h"
#import "Parse/Parse.h"
#import <ParseUI/ParseUI.h>

@interface profileViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,CollectionViewCellDelegate>
@property (strong, nonatomic ) NSArray* currentUserPost;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionview;
@property PFUser * user;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;

@end

@implementation profileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.profilePic.layer.cornerRadius = 45;
    self.profilePic.clipsToBounds = true;
    self.collectionview.dataSource = self;
    self.collectionview.delegate = self;
    self.user = PFUser.currentUser;
    
    [self query];
    
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*) self.collectionview.collectionViewLayout;

    layout.minimumInteritemSpacing =3;
    layout.minimumLineSpacing = 3;
    CGFloat postersPerLine = 3;
    CGFloat itemWidth = (self.collectionview.frame.size.width -  layout.minimumInteritemSpacing*(postersPerLine-1))/postersPerLine;
    CGFloat itemHeight = itemWidth;
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    
    
}
- (void) query{
    
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query whereKey:@"author" equalTo: self.user];
    [query includeKey:@"author"];
    query.limit = 20;
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.currentUserPost = posts;
             [self.collectionview reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
   

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    UICollectionViewCell *cell = sender;
    NSIndexPath *indexPath =[self.collectionview indexPathForCell:cell];
    //Setting delegate to ProfileController
    Post *detail = self.currentUserPost[indexPath.row] ;
    // Pass the selected object to the new view controller.
    DetailViewController *detailController =  [segue destinationViewController];
    
    detailController.selectedPost = detail;
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"profileCell" forIndexPath:indexPath];
    Post *post = self.currentUserPost[indexPath.row];
    cell.delegate = self;
     cell.cellImage.file = post[@"image"];
    [cell.cellImage loadInBackground];
    

   // cell.cellImage.frame = CGRectMake(cell.cellImage.frame.origin.x, cell.cellImage.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   // NSLog([NSString stringWithFormat:@"%lu", self.currentUserPost.count]);

    return self.currentUserPost.count;
    
}


- (void)collectionViewCell:(CollectionViewCell *)collectionViewCell didTap:(Post *)tapPost {
    NSLog(@"Hello"); //Testing if delegation is being called
    [self performSegueWithIdentifier:@"detailView" sender:tapPost];
}

@end
