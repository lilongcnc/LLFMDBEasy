//
//  HomeCommonADInfo.h
//  FMDBDemo
//
//  Created by 李龙 on 16/12/14.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HomeCommonADInfo : NSObject

@property (nonatomic,copy) NSString *img_url;
@property (nonatomic,strong) NSData *imgData;

+ (instancetype)homeCommonADInfoUIImage:(UIImage *)image img_URL:(NSString *)imgUrl;


@end
