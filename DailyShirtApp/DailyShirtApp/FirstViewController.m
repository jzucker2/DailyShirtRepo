//
//  FirstViewController.m
//  DailyShirtApp
//
//  Created by Jordan Zucker on 8/28/12.
//  Copyright (c) 2012 Jordan Zucker. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () <UIWebViewDelegate>

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.title = NSLocalizedString(@"First", @"First");
        self.title = @"Woot";
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_wootWebView setDelegate:self];
    
    NSURL *wootURL = [NSURL URLWithString:@"http://www.shirt.woot.com"];
    NSURLRequest *wootRequest = [NSURLRequest requestWithURL:wootURL];
    [_wootWebView loadRequest:wootRequest];
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
