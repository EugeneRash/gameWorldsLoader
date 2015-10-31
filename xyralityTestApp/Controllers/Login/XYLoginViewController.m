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
    
    XYUser *user = [[XYUser alloc] init];
    user.login = self.emailTextfield.text;
    user.password = self.passwordTextfield.text;
    
    [[XYDataManager sharedManager] getAvailableWorldsForUser:user withSuccess:^{
        
        [self performSegueWithIdentifier:@"showWorldsListSegue" sender:self];
        
    } failureBlock:^(NSError *error) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    
    }];
    
}
@end
