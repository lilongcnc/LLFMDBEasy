//
//  HomeCommonADInfo.m
//  FMDBDemo
//
//  Created by 李龙 on 16/12/14.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "HomeCommonADInfo.h"

@implementation HomeCommonADInfo

+ (instancetype)homeCommonADInfoUIImage:(UIImage *)image img_URL:(NSString *)imgUrl{
    
    HomeCommonADInfo *info = [HomeCommonADInfo new];
    
    info.imgData = UIImagePNGRepresentation(image);
    info.img_url =imgUrl;
    
    return info;
}

@end
