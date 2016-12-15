//
//  HomeScrollADInfo.m
//  FMDBDemo
//
//  Created by 李龙 on 16/12/14.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "HomeScrollADInfo.h"

@implementation HomeScrollADInfo

+ (instancetype)homeScrollADInfoUIImage:(UIImage *)image img_URL:(NSString *)imgUrl{
    HomeScrollADInfo *info = [HomeScrollADInfo new];
    
    info.imgData = UIImagePNGRepresentation(image);
    info.img_url =imgUrl;
    
    return info;
}


@end
