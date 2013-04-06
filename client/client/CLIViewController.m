//
//  CLIViewController.m
//  client
//
//  Created by Matthew Palmer on 1/04/13.
//  Copyright (c) 2013 Matthew Palmer. All rights reserved.
//

#import "CLIViewController.h"

@interface CLIViewController ()

@end

@implementation CLIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self queryApi];
    
    UIButton *doItAgain = [[UIButton alloc]initWithFrame:CGRectMake(100.0, 100.0, 100.0, 100.0)];
    [doItAgain setBackgroundColor:[UIColor greenColor]];
    [doItAgain setTitle:@"Again" forState:UIControlStateNormal];
    [doItAgain addTarget:self action:@selector(queryApi) forControlEvents:UIControlEventTouchUpInside];
    [[self view]addSubview:doItAgain];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)queryApi
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/read"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"request: %@, response: %@, JSON: %@", request,response,JSON);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id a) {
        NSLog(@"failed");
    }];
    
    [operation start];
}

@end
