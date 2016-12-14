//
//  ZYHTFMDBOpenHelper.h
//  FMDBDemo
//
//  Created by 李龙 on 16/12/14.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILSingletom.h"

@interface ZYHTfmdbHomeRecommendInfoHelper : NSObject

ILSingleton_H

- (NSString *)getHomeRecommendDB_Path;

- (BOOL)createTable_HomeRecommendDB;

@end

