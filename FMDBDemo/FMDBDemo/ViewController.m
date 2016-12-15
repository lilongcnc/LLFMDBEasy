//
//  ViewController.m
//  FMDBDemo
//
//  Created by 李龙 on 16/12/14.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "ZYHTfmdbHomeRecommendInfoHelper.h"
#import "HomeRecommendInfo.h"
#import "ZYHTfmdb_RecommendDealTool.h"

#import "HomeScrollADInfo.h"
#import "ZYHTfmdbHomeScrollADHelper.h"
#import "ZYHTfmdbHomeScrollADDealTool.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)add:(id)sender {
    
    BOOL result = [[ZYHTfmdbHomeRecommendInfoHelper sharedInstance] createTable_HomeRecommendDB];
    if (result) {
        NSLog(@"建表成功");
        
        HomeRecommendInfo *info1 = [HomeRecommendInfo homeRecommendInfoWithName:@"张三" age:@"10"];
        HomeRecommendInfo *info2 = [HomeRecommendInfo homeRecommendInfoWithName:@"李四" age:@"21"];
        HomeRecommendInfo *info3 = [HomeRecommendInfo homeRecommendInfoWithName:@"王五" age:@"22"];
        HomeRecommendInfo *info4 = [HomeRecommendInfo homeRecommendInfoWithName:@"赵六" age:@"23"];
        
        [[ZYHTfmdb_RecommendDealTool sharedInstance] insertWithArray:@[info1,info2,info3,info4]];
        
    }else{
        NSLog(@"建表失败");
    }
    
  
}

- (IBAction)del:(id)sender {
    [[ZYHTfmdb_RecommendDealTool sharedInstance] deleteAll];
}

- (IBAction)modify:(id)sender {
//    [[ZYHTfmdb_RecommendDealTool sharedInstance] modify];

}

- (IBAction)query:(id)sender {

    NSArray *data = [[ZYHTfmdb_RecommendDealTool sharedInstance] query];
    
    for (HomeRecommendInfo *info in data) {
        NSLog(@"query: name:%@ age:%@ ",info.name,info.age);
    }
}


#pragma mark ================ 图片部分 ================

- (IBAction)img_add:(id)sender {

    
    
}

- (IBAction)img_del:(id)sender {
}

- (IBAction)img_modify:(id)sender {
    //    [[ZYHTfmdb_RecommendDealTool sharedInstance] modify];
    
}

- (IBAction)img_query:(id)sender {
    

}


@end
