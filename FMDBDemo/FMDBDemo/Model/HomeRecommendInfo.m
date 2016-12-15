//
//  Person.m
//  FMDBDemo
//
//  Created by 李龙 on 16/12/14.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "HomeRecommendInfo.h"

@implementation HomeRecommendInfo

+ (instancetype)homeRecommendInfoWithName:(NSString *)name age:(NSString *)age{
    HomeRecommendInfo *tempClass = [HomeRecommendInfo new];
    tempClass.name = name;
    tempClass.age = age;
    return tempClass;
}

@end
