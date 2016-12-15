//
//  ZYHTfmdbHomeScrollADDealTool.m
//  FMDBDemo
//
//  Created by 李龙 on 16/12/15.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ZYHTfmdbHomeScrollADDealTool.h"
#import "ZYHTfmdbHomeScrollADHelper.h"
#import "HomeScrollADInfo.h"


@interface ZYHTfmdbHomeScrollADDealTool ()

@property (nonatomic, copy) NSString * dbPath;

@end

@implementation ZYHTfmdbHomeScrollADDealTool
ILSingleton_M


-(NSString *)dbPath{
    return [ZYHTfmdbHomeScrollADHelper sharedInstance].getHomeScrollAD_Path;
}

#pragma mark ------------ 插入 ------------
- (void)insertWithArray:(NSArray *)homeScrollADInfoArray{
    FMDatabase * database = [FMDatabase databaseWithPath:self.dbPath];
    if ([database open]) {
        for (NSInteger i = 0; i < homeScrollADInfoArray.count; i++) {
            
            //获取单个模型
            HomeScrollADInfo *tempInfo = homeScrollADInfoArray[i];
            NSString *img_url = tempInfo.img_url;
            NSData *imgData = tempInfo.imgData;
            
            //存入数据库方式一
            //使用"?"的地方代表不确定，而且不需要写单引号'',会自动包装，"?"代表的对象要使用@()来包装一下，例如：
            //            NSString * sql = @"insert into zyht_homeScrollADInfo(name,age) values (?,?)";
            //            [database executeUpdate:sql,name,[NSNumber numberWithInt:age]];
            
            //存入数据库方式二
            NSString * sql = @"insert into zyht_homeScrollADInfo(img_url,imgData) values (%@,%@)";
            [database executeUpdateWithFormat:sql,img_url,imgData];
        }
    }
    
    [database close];
}

#pragma mark ----------- 删除 ----------
//根据字段内容删除
- (BOOL)delete:(NSString *)img_url{
    
    FMDatabase * db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) {
        NSString * sql = @"delete from zyht_homeScrollADInfo where img_url = %@";
        BOOL res = [db executeUpdateWithFormat:sql,img_url];
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
        
        NSString * sql = @"delete from zyht_homeScrollADInfo";
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
        FMResultSet *resultSet = [db executeQuery:@"select * from zyht_homeScrollADInfo"];
        
        NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:10];
        
        //遍历结果
        while ([resultSet next]) {
            //从数据库获取数据
            NSString *img_url = [resultSet stringForColumn:@"img_url"];
            NSData *imgData = [resultSet dataForColumn:@"imgData"];
            NSLog(@"--img_url:%@---imgData:%@",img_url,imgData);
            
            //图片处理
//            [imgData writeToFile:@"/tmp/compass.icns" atomically:NO];

            //赋值模型
//            NSData *imageData = [NSData dataWithContentsOfFile: imagePath];
            UIImage *image = [UIImage imageWithData: imgData];
            HomeScrollADInfo *oneInfo = [HomeScrollADInfo homeScrollADInfoUIImage:image img_URL:img_url];
            
            //增加数组中
            [tempArray addObject:oneInfo];
        }
        
        [db close];
        return tempArray;
    }
    return nil;
}
@end
