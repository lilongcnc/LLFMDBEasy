//
//  Person.h
//  FMDBDemo
//
//  Created by 李龙 on 16/12/14.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeRecommendInfo : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *age;

+ (instancetype)homeRecommendInfoWithName:(NSString *)name age:(NSString *)age;
@end
