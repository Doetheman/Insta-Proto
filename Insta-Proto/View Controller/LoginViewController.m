//
//  LoginViewController.m
//  Insta-Proto
//
//  Created by Dorian Holmes on 7/9/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//
#import "Parse.h"
#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)registerUser:(id)sender {
    [self registerUser];
}
- (IBAction)signin:(id)sender {
    [self loginUser];
}



- (void)registerUser {
        // initialize a user object
        PFUser *newUser = [PFUser user];
        
        // set user properties
    newUser.username = self.usernameTextField.text;
    newUser.password = self.passwordTextField.text;
        
        // call sign up function on the object
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
            if (error != nil) {
                NSLog(@"Error: %@", error.localizedDescription);
            } else {
                NSLog(@"User registered successfully");
                
                // manually segue to logged in view
                [self performSegueWithIdentifier:@"showSegue" sender:nil];

            }
        }];
    }

- (void)loginUser {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            
            // display view controller that needs to shown after successful login
            [self performSegueWithIdentifier:@"showSegue" sender:nil];

        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
