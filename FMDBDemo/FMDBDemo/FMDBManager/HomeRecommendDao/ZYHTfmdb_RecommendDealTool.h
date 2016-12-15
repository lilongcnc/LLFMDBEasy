//
//  ZYHTfmdbDealTool.h
//  FMDBDemo
//
//  Created by 李龙 on 16/12/14.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "ILSingletom.h"

@interface ZYHTfmdb_RecommendDealTool : NSObject
ILSingleton_H


- (void)insertWithArray:(NSArray *)homeRecommondInfoArray;
- (BOOL)delete:(NSString *)name;
- (BOOL)deleteAll;
- (NSArray *)query;
- (BOOL)update:(NSString *)name;

@end
