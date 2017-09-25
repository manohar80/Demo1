//
//  ViewController.m
//  Demo2
//
//  Created by TMSPL on 19/09/17.
//  Copyright © 2017 TMSPL. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)OpenSheet:(id)sender
{
    SecondViewController *View= [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    View.modalPresentationStyle=UIModalPresentationPageSheet;
    [self.navigationController presentViewController:View animated:YES completion:nil];
}



@end
