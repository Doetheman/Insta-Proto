//
//  FeedViewController.m
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/9/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//
#import "Post.h"
#import "postsTableViewCell.h"
#import "Parse.h"
#import "FeedViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "ComposeViewController.h"

@interface FeedViewController ()<UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property NSArray *feed;
@property UIImage *originalImage;
@property (nonatomic, strong) UIRefreshControl *refreshControl; //Refresh variable

@end

@implementation FeedViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.postsTableView.delegate = self;
    self.postsTableView.dataSource = self;
    self.postsTableView.rowHeight = 300;
    
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    
    [self resizeImage:self.originalImage withSize:CGSizeMake(200, 200)];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(query) userInfo:nil repeats:true];
    
    //Pull down refresh
    self.refreshControl = [[UIRefreshControl alloc] init]; //initialize refresh control
    [self.refreshControl addTarget:self action:@selector(query) forControlEvents:UIControlEventValueChanged];
    [self.postsTableView insertSubview:self.refreshControl atIndex:0];//add refresh control to table behind the first cell
}
//Logs user out
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
- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
// Opens camera or camera roll
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

//Once image is selected store image in object and perform segue
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
    UINavigationController *navigationConroller = [ segue destinationViewController];
    ComposeViewController *composeView = (ComposeViewController*) navigationConroller.topViewController;
   composeView.composeImage = self.originalImage;

    
}

//Deques cells
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    postsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"postCell" forIndexPath: indexPath]; //Deque cell
    Post * post = self.feed[indexPath.row];
    cell.post = post;
    return cell;
    
}
//Amount of cells tableview will display
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feed.count;
}


@end
