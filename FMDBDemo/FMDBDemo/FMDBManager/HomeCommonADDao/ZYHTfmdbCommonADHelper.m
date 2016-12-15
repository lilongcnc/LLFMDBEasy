//
//  ZYHTfmdb_CommonADHelper.m
//  FMDBDemo
//
//  Created by 李龙 on 16/12/15.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ZYHTfmdbCommonADHelper.h"
#import "FMDB.h"


@implementation ZYHTfmdbCommonADHelper

ILSingleton_M

- (NSString *)getHomeCommonAD_Path{
    //1.得到一个路径
    NSString *dbPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    dbPath = [dbPath stringByAppendingPathComponent:@"/zyht_homeCommonADInfo.sqlite"];
    NSLog(@"docPath = %@",dbPath);
    
    return dbPath;
}


static NSString * const isCreateTable_HomeRecommendDBFlag = @"isCreateTable_HomeCommonADDBFlag";
- (BOOL)createTable_HomeCommonAD{
    NSUserDefaults *dbDserDefault = [NSUserDefaults standardUserDefaults];
    
    BOOL isCreated = [dbDserDefault boolForKey:isCreateTable_HomeRecommendDBFlag];
    if (isCreated) {
        NSLog(@"-- 该表已经创建过");
        return 1;
    }
    
    //2.在path路径下拼接一个SQLite数据库
    NSString *dbPath = [self getHomeCommonAD_Path];
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:dbPath] == NO) {
        
        FMDatabase * database = [FMDatabase databaseWithPath:dbPath];
        
        //3.初始化FMDatabase对象(就是创建一个数据库,上面对FMDatabase类的作用已经做出解释)
        database = [FMDatabase databaseWithPath:dbPath];
        //4.打开数据库
        if ([database open]) {
            //4.1建表
            //在FMDB中，除了查询之外，所以操作都会使用"executeUpdate"这个方法
            //在FMDB中，除查询之外的所有操作，都称为“更新”create、drop、insert、update、delete等。
            BOOL result = [database executeUpdate:@"create table zyht_homeCommonADInfo (id integer PRIMARY KEY AUTOINCREMENT NOT NULL,img_url text NOT NULL,imgData blob NOT NULL);"];
            [database close];
            
            if (result) {
                NSLog(@"建表成功");
                [dbDserDefault setBool:YES forKey:isCreateTable_HomeRecommendDBFlag]; //标识第一次创建该表成功
                return 1;
            }else{
                NSLog(@"建表失败");
                return 0;
            }
            
        }else{
            //打开数据库失败og
            //error.....
            NSLog(@"error when open db");
            return 0;
        }
    }
    
    return 0;
}

@end
