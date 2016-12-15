//
//  ZYHTfmdbHomeScrollADHelper.h
//  FMDBDemo
//
//  Created by 李龙 on 16/12/15.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILSingletom.h"


//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d\n%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif


@interface ZYHTfmdbHomeScrollADHelper : NSObject
ILSingleton_H


- (NSString *)getHomeScrollAD_Path;

- (BOOL)createTable_HomeScrollAD;

@end
