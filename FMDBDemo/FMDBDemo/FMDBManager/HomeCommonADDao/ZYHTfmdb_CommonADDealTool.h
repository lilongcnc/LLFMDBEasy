//
//  ZYHTfmdb_CommonADDealTool.h
//  FMDBDemo
//
//  Created by 李龙 on 16/12/15.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "ILSingletom.h"

@interface ZYHTfmdb_CommonADDealTool : NSObject
ILSingleton_H


- (void)insertWithArray:(NSArray *)homeCommonADInfoArray;
- (BOOL)delete:(NSString *)img_url;
- (BOOL)deleteAll;
- (NSArray *)query;

@end
