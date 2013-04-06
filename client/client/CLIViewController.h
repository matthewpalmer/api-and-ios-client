//
//  CLIViewController.h
//  client
//
//  Created by Matthew Palmer on 1/04/13.
//  Copyright (c) 2013 Matthew Palmer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFJSONRequestOperation.h"
#import "AFHTTPClient.h"

@interface CLIViewController : UIViewController
@property (strong, nonatomic)   UITextField *name;
@property (strong, nonatomic)   UITextField *age;
             
-(void)queryApi;
-(void)createApi;
@end
