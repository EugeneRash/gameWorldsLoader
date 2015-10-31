//
//  LoginViewController.h
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

- (IBAction)loginButtonAction:(id)sender;

@end
