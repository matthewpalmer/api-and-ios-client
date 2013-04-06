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
    //[self queryApi];
    
    UIButton *readApi = [[UIButton alloc]initWithFrame:CGRectMake(10.0, 10.0, 100.0, 50.0)];
    [readApi setBackgroundColor:[UIColor greenColor]];
    [readApi setTitle:@"Read" forState:UIControlStateNormal];
    [readApi addTarget:self action:@selector(queryApi) forControlEvents:UIControlEventTouchUpInside];
    [[self view]addSubview:readApi];
    
    UIButton *createApi = [[UIButton alloc]initWithFrame:CGRectMake(160.0, 10.0, 100.0, 50.0)];
    [createApi setBackgroundColor:[UIColor blueColor]];
    [createApi setTitle:@"Create" forState:UIControlStateNormal];
    [createApi addTarget:self action:@selector(createApi) forControlEvents:UIControlEventTouchUpInside];
    [[self view]addSubview:createApi];
    
    _name = [[UITextField alloc]initWithFrame:CGRectMake(60.0, 90.0, 200.0, 50.0)];
    _age  = [[UITextField alloc]initWithFrame:CGRectMake(60.0, 190.0, 200.0, 50.0)];
    
    [_name setPlaceholder:@"Name"];
    [_name setBackgroundColor:[UIColor whiteColor]];
    [_age  setPlaceholder:@"Age"];
    [_age  setBackgroundColor:[UIColor whiteColor]];
    
    [[self view]addSubview:_name];
    [[self view]addSubview:_age];
    
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
- (void)createApi
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setValue:[_name text] forKey:@"name"];
    [params setValue:[_age text] forKey:@"age"];
    
    [httpClient postPath:@"/create" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"200 - OK");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
    }];
}

@end
