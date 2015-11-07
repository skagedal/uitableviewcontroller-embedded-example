//
//  ViewController.m
//  EmbeddedTableTest
//
//  Created by Simon Kågedal Reimer on 2015-11-07.
//  Copyright © 2015 Bontouch. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIViewController *sub = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                             instantiateViewControllerWithIdentifier:NSStringFromClass([TableViewController class])];


    [self.contentView addSubview:sub.view];
    sub.view.translatesAutoresizingMaskIntoConstraints = NO;
    [sub.view.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [sub.view.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [sub.view.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [sub.view.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    
    [self addChildViewController:sub];
    [sub didMoveToParentViewController:self];
}

- (IBAction)toggleVisibility:(id)sender {
    TableViewController *tableVC = (TableViewController *)self.childViewControllers[0];
    tableVC.isFirstSectionVisible = !tableVC.isFirstSectionVisible;
}

@end
