//
//  SidebarViewController.h
//  WeView 2
//
//  Copyright (c) 2013 Charles Matthew Chen. All rights reserved.
//
//  Distributed under the Apache License v2.0.
//  http://www.apache.org/licenses/LICENSE-2.0.html
//

#pragma once

#import <UIKit/UIKit.h>

#import "SelectDemoViewController.h"
#import "ViewTreeViewController.h"
#import "ViewEditorController.h"

@interface SidebarViewController : UIViewController

@property (nonatomic) SelectDemoViewController *selectDemoViewController;

@property (nonatomic) ViewTreeViewController *viewTreeViewController;

@property (nonatomic) ViewEditorController *viewEditorController;

@end