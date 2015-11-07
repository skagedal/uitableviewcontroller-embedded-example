//
//  TableViewController.m
//  EmbeddedTableTest
//
//  Created by Simon Kågedal Reimer on 2015-11-07.
//  Copyright © 2015 Bontouch. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];

// So this works, but not when I have empty sections:
//    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!self.isFirstSectionVisible) {
        if (section == 0) return 0;
    }
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (!self.isFirstSectionVisible) {
        if (section == 0) return nil;
    }
    return @"Section";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])
                                                            forIndexPath:indexPath];
    
    cell.textLabel.text = @"Cell";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (!self.isFirstSectionVisible) {
        if (section == 0)
            return 0.1;
    }
    return UITableViewAutomaticDimension;
//    return 30.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (!self.isFirstSectionVisible) {
        if (section == 0)
            return 0.1;
    }
    return UITableViewAutomaticDimension;
}

- (void)setIsFirstSectionVisible:(BOOL)isFirstSectionVisible {
    _isFirstSectionVisible = isFirstSectionVisible;
    [self.tableView reloadData];
}

@end
