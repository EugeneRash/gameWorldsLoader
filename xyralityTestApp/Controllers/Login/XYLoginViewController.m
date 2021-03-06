//
//  LoginViewController.m
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#import "XYLoginViewController.h"
#import "XYDataManager.h"
#import "XYUser.h"

@interface XYLoginViewController ()

@end

@implementation XYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)loginButtonAction:(id)sender {
    
    [self activityEnabled:YES];
    
    XYUser *user = [[XYUser alloc] initWithLogin:self.emailTextfield.text password:self.passwordTextfield.text];
    [[XYDataManager sharedManager] getAvailableWorldsForUser:user withSuccess:^{
        
        [self performSegueWithIdentifier:@"showWorldsListSegue" sender:self];
        [self activityEnabled:NO];

        
    } failureBlock:^(NSError *error) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        [self activityEnabled:NO];

    
    }];
    
}

- (void)activityEnabled:(BOOL)mode {

    [UIApplication sharedApplication].networkActivityIndicatorVisible = mode;
    self.loginButton.enabled = !mode;
    self.emailTextfield.enabled = !mode;
    self.passwordTextfield.enabled = !mode;

}


@end
