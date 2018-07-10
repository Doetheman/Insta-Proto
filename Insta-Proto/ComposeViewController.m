//
//  ComposeViewController.m
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/9/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//
#import "FeedViewController.h"
#import "ComposeViewController.h"
#import "Post.h"
@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.image.image = self.composeImage;
    // Do any additional setup after loading the view.
}
- (IBAction)share:(id)sender {
    [Post postUserImage:self.image.image withCaption:self.captionView.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (error != nil ) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User posted successfully");
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancel:(id)sender {
    [self performSegueWithIdentifier:@"showFeed" sender:nil];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
