//
//  SecondViewController.m
//  Demo2
//
//  Created by TMSPL on 21/09/17.
//  Copyright © 2017 TMSPL. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UIScrollViewDelegate>
{
    NSMutableArray *ArrayColors;
}

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // [self setupNavigationBar];
    
    ArrayColors=[[NSMutableArray alloc]initWithObjects:@"Red",@"Green",@"Yellow", nil];
    
    for (int i=0; i<ArrayColors.count; i++)
    {
        UIView *viewTemp=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*i, 0, 300, 200)];
        viewTemp.backgroundColor=[UIColor redColor];
        [_scrollview addSubview:viewTemp];
    }
    
//    [_scrollview setContentSize:CGSizeMake(1280,500)];
//    _scrollview.delegate=self;
//    _scrollview.pagingEnabled=YES;
//    _pagecontroller.backgroundColor=[UIColor redColor];
//   // _pagecontroller.tintColor=[UIColor blackColor];
//    _pagecontroller.pageIndicatorTintColor = [UIColor blackColor];
//    _pagecontroller.currentPageIndicatorTintColor = [UIColor whiteColor];
//    _pagecontroller.numberOfPages=ArrayColors.count;
//    
//    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
//    
//    [self setupNavigationBar];
//   
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    [_pagecontroller setCurrentPage:page];
}

- (void)scrollingTimer
{
    CGFloat contentOffset = _scrollview.contentOffset.x;
    int nextPage = (int)(contentOffset/_scrollview.frame.size.width) + 1 ;
    
    if( nextPage!=[ArrayColors count])
    {
        [_scrollview scrollRectToVisible:CGRectMake(nextPage*_scrollview.frame.size.width, 0, _scrollview.frame.size.width, _scrollview.frame.size.height) animated:YES];
        _pagecontroller.currentPage=nextPage;
    }
    else
    {
        [_scrollview scrollRectToVisible:CGRectMake(0, 0, _scrollview.frame.size.width, _scrollview.frame.size.height) animated:YES];
        _pagecontroller.currentPage=0;
    }
}

-(void)setupNavigationBar
{
    self.title = @"Close";
    UIBarButtonItem *NewBarButtonItem = [[UIBarButtonItem alloc]
                                         initWithImage:[UIImage imageNamed:@"NavBar-Close"]
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(closeMethod:)];
    self.navigationItem.leftBarButtonItem = NewBarButtonItem;
    
}



- (void)closeMethod:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
