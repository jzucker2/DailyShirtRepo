//
//  SecondViewController.m
//  DailyShirtApp
//
//  Created by Jordan Zucker on 8/28/12.
//  Copyright (c) 2012 Jordan Zucker. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UIWebViewDelegate>

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.title = NSLocalizedString(@"Second", @"Second");
        self.title = @"TeeFury";
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_teeFuryWebView setDelegate:self];
    
    NSURL *teeFuryURL = [NSURL URLWithString:@"http://www.teefury.com"];
    NSURLRequest *teeFuryRequest = [NSURLRequest requestWithURL:teeFuryURL];
    [_teeFuryWebView loadRequest:teeFuryRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Web View Delegate

- (void) webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSLog(@"webView didFailLoadWithError: %@", error);
}

@end
