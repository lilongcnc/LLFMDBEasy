//
//  ZYHTfmdbHomeScrollADHelper.h
//  FMDBDemo
//
//  Created by 李龙 on 16/12/15.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILSingletom.h"

@interface ZYHTfmdbHomeScrollADHelper : NSObject
ILSingleton_H


- (NSString *)getHomeScrollAD_Path;

- (BOOL)createTable_HomeScrollAD;

@end
