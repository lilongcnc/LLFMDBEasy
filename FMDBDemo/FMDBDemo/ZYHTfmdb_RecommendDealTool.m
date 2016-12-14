//
//  ZYHTfmdbDealTool.m
//  FMDBDemo
//
//  Created by 李龙 on 16/12/14.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ZYHTfmdb_RecommendDealTool.h"
#import "ZYHTfmdbHomeRecommendInfoHelper.h"
#import "HomeRecommendInfo.h"


@interface ZYHTfmdb_RecommendDealTool ()

 @property (nonatomic, copy) NSString * dbPath;

@end

@implementation ZYHTfmdb_RecommendDealTool

ILSingleton_M

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self insert];
//    [self delete:@"jack-80"];
//    [self deleteAll];
//    [self select];
//    [self update:@"jack-1000"];
//}

/* 声明数据库实例属性 */
//@property (strong,nonatomic) FMDatabase *database;



-(NSString *)dbPath{
    return [ZYHTfmdbHomeRecommendInfoHelper sharedInstance].getHomeRecommendDB_Path;
}

#pragma mark ------------ 插入 ------------
- (void)insertWithArray:(NSArray *)homeRecommondInfoArray{
    FMDatabase * database = [FMDatabase databaseWithPath:self.dbPath];
    if ([database open]) {
        for (NSInteger i = 0; i < homeRecommondInfoArray.count; i++) {
            
            //获取单个模型
            HomeRecommendInfo *tempInfo = homeRecommondInfoArray[i];
            NSString *name = tempInfo.name;
            int age = [tempInfo.age intValue];
            
            //存入数据库方式一
            //使用"?"的地方代表不确定，而且不需要写单引号'',会自动包装，"?"代表的对象要使用@()来包装一下，例如：
//            NSString * sql = @"insert into zyht_homeRecommendInfo(name,age) values (?,?)";
//            [database executeUpdate:sql,name,[NSNumber numberWithInt:age]];
            
            //存入数据库方式二
            NSString * sql = @"insert into zyht_homeRecommendInfo(name,age) values (%@,%d)";
            [database executeUpdateWithFormat:sql,name,age];
        }
    }
    
    [database close];
}

#pragma mark ----------- 删除 ----------
//根据字段内容删除
- (BOOL)delete:(NSString *)name{
    
    FMDatabase * db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) {
        NSString * sql = @"delete from zyht_homeRecommendInfo where name = %@";
        BOOL res = [db executeUpdateWithFormat:sql,name];
        [db close];

        if (!res) {
            NSLog(@"error to delete db data");
            return 0;
        } else {
            NSLog(@"succ to deleta db data");
            return 1;
        }
    }

    return 0;
}

//删除表中全部内容
- (BOOL)deleteAll{
    
    FMDatabase * db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) {
        
        NSString * sql = @"delete from zyht_homeRecommendInfo";
        BOOL res = [db executeUpdate:sql];
        [db close];
        
        if (!res) {
            NSLog(@"error to delete db data");
            return 0;
        } else {
            NSLog(@"succ to deleta db data");
            return 1;
        }
    }
    
    return 0;
}


#pragma mark ---------- 查询 ----------
- (NSArray *)query{
    FMDatabase * db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) {
        //创建查询结果对象
        FMResultSet *resultSet = [db executeQuery:@"select * from zyht_homeRecommendInfo"];
        
        NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:10];
        
        //遍历结果
        while ([resultSet next]) {
            //从数据库获取数据
            int ID = [resultSet intForColumn:@"id"];
            NSString *name = [resultSet stringForColumn:@"name"];
            int age = [resultSet intForColumn:@"age"];
            NSLog(@"%d---%@---%d",ID,name,age);
            
            //赋值模型
            HomeRecommendInfo *oneInfo = [HomeRecommendInfo homeRecommendInfoWithName:name age:[NSString stringWithFormat:@"%d",age]];
            
            //增加数组中
            [tempArray addObject:oneInfo];
        }
        
        [db close];
        return tempArray;
    }
    return nil;
}


#pragma mark ------------- 修改 -------------
- (BOOL)update:(NSString *)name{
    FMDatabase * db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) {
        BOOL res = [db executeUpdateWithFormat:@"update zyht_homeRecommendInfo set name = %@ where name = 'jack-38'",name];
        [db close];
        
        if (!res) {
            NSLog(@"error to delete db data");
            return 0;
        } else {
            NSLog(@"succ to deleta db data");
            return 1;
        }
    }
    
    return 0;
}


@end
