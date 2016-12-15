//
//  ViewController.m
//  FMDBDemo
//
//  Created by 李龙 on 16/12/14.
//  Copyright © 2016年 李龙. All rights reserved.
//


//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d\n%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif


#import "ViewController.h"
#import "ZYHTfmdbHomeRecommendInfoHelper.h"
#import "HomeRecommendInfo.h"
#import "ZYHTfmdb_RecommendDealTool.h"

#import "HomeScrollADInfo.h"
#import "ZYHTfmdbHomeScrollADHelper.h"
#import "ZYHTfmdb_HomeScrollADDealTool.h"

#import "HomeCommonADInfo.h"
#import "ZYHTfmdb_CommonADDealTool.h"
#import "ZYHTfmdbCommonADHelper.h"

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

    BOOL result = [[ZYHTfmdbHomeScrollADHelper sharedInstance] createTable_HomeScrollAD];
    if (result) {
        NSLog(@"建表成功");
        
        HomeScrollADInfo *info1 = [HomeScrollADInfo homeScrollADInfoUIImage:[UIImage imageNamed:@"10.png"] img_URL:@"1111111111"];
        
        [[ZYHTfmdb_HomeScrollADDealTool sharedInstance] insertWithArray:@[info1]];
        
    }else{
        NSLog(@"建表失败");
    }
    
}

- (IBAction)img_del:(id)sender {
    [[ZYHTfmdb_HomeScrollADDealTool sharedInstance] deleteAll];
}

- (IBAction)img_modify:(id)sender {}

- (IBAction)img_query:(id)sender {
    
    self.showImageView.image = nil;

    
    NSArray *array = [[ZYHTfmdb_HomeScrollADDealTool sharedInstance] query];
    for (HomeScrollADInfo *info in array) {
        
        NSLog(@"img_query: name:%@ age:%@ ",info.imgData,info.img_url);
        UIImage *image = [UIImage imageWithData: info.imgData];
        self.showImageView.image = image;
    }

}



#pragma mark ================ 图片部分2 ================

- (IBAction)img_add2:(id)sender {
    
    BOOL result = [[ZYHTfmdbCommonADHelper sharedInstance] createTable_HomeCommonAD];
    if (result) {
        HomeCommonADInfo *info1 = [HomeCommonADInfo homeCommonADInfoUIImage:[UIImage imageNamed:@"21.png"] img_URL:@"22222222"];
        
        [[ZYHTfmdb_CommonADDealTool sharedInstance] insertWithArray:@[info1]];
        
    }else{
    }
    
}

- (IBAction)img_del2:(id)sender {
    [[ZYHTfmdb_HomeScrollADDealTool sharedInstance] deleteAll];
}

- (IBAction)img_modify2:(id)sender {}


- (IBAction)img_query2:(id)sender {
    
    self.showImageView.image = nil;
    
    NSArray *array = [[ZYHTfmdb_CommonADDealTool sharedInstance] query];

    for (HomeCommonADInfo *info in array) {
        
        NSLog(@"img_query2: name:%@ age:%@ ",info.imgData,info.img_url);
        UIImage *image = [UIImage imageWithData: info.imgData];
        self.showImageView.image = image;
    }
    
}

@end
