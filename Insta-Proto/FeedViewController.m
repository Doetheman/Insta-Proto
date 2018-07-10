//
//  FeedViewController.m
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/9/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//
#import "postsTableViewCell.h"
#import "Parse.h"
#import "FeedViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "ComposeViewController.h"

@interface FeedViewController ()<UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property NSArray *feed;
@property UIImage *originalImage;
@end

@implementation FeedViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.postsTableView.delegate = self;
    self.postsTableView.dataSource = self;
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(query) userInfo:nil repeats:true];
}
- (IBAction)logout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // Go back to login view
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyBoard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        appDelegate.window.rootViewController = loginViewController;
    }];
}

// construct query
- (void) query{
    
PFQuery *query = [PFQuery queryWithClassName:@"Post"];
[query whereKey:@"likesCount" greaterThan:@100];
query.limit = 20;

// fetch data asynchronously
[query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
    if (posts != nil) {
        self.feed = posts;
        [self.postsTableView reloadData];
    } else {
        NSLog(@"%@", error.localizedDescription);
    }
}];
}

- (IBAction)CameraRoll:(id)sender {
    //instantiates image picker
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    
    
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    } else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [ self presentViewController:imagePickerVC animated:true completion:nil ];
    
   
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    self.originalImage = info[UIImagePickerControllerOriginalImage];
    //UIImage *editedImage =
    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
      [self performSegueWithIdentifier:@"showComposeViewController" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ComposeViewController *composeView = (ComposeViewController *) [segue destinationViewController];
    composeView.composeImage = self.originalImage;
    
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    postsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"postsTableViewCell" forIndexPath: indexPath]; //Deque cell
        // PFObject *posts = self.                   //index
    
//    PFUser *user = [PFUser user];
//    cell.postImage.image = user[@"image"];
//    cell.postLabel.text = user[@"caption" ];
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feed.count;
}


@end
