//
//  ViewController.m
//  UIScrollViewTest
//
//  Created by Andy Jacobs on 07/05/13.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    _tableView = [[TableView alloc] initWithFrame:CGRectMake(0.f, 0.f, 320.f, 768.f) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(400.f, 0.f, 320.f, 768.f) style:UITableViewStylePlain];
    [self.view addSubview:_tableView2];
    
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    
    
    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
    
    panGesture.minimumNumberOfTouches = 2;
    panGesture.maximumNumberOfTouches = 2;
    panGesture.delegate = self;
    self.view.gestureRecognizers = @[panGesture];
    
    [_tableView.panGestureRecognizer requireGestureRecognizerToFail:panGesture];
    [_tableView2.panGestureRecognizer requireGestureRecognizerToFail:panGesture];
}


- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

-( void) panGestureAction : (UIPanGestureRecognizer *)recognizer
{
    UIView *view = recognizer.view;
    CGPoint translatedPoint = [recognizer translationInView:view];
    
    if( recognizer.state == UIGestureRecognizerStateChanged )
    {
        CGRect frame = self.view.frame;
        frame.origin = translatedPoint;
        self.view.frame = frame;
    } else if( recognizer.state == UIGestureRecognizerStateEnded )
    {
        CGRect frame = self.view.frame;
        frame.origin = CGPointMake(0.f, 0.f)
        ;
        self.view.frame = frame;
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"Test";
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
