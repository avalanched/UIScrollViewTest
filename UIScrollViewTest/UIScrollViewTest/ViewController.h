//
//  ViewController.h
//  UIScrollViewTest
//
//  Created by Andy Jacobs on 07/05/13.
//
//

#import <UIKit/UIKit.h>
#import "TableView.h"

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic,strong) TableView *tableView;

@property (nonatomic,strong) UITableView *tableView2;
@end
