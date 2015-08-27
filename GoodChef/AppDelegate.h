//
//  AppDelegate.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
//rdvtabbar
#import "GCTabBarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//全局的tabbar
@property (nonatomic,strong) GCTabBarViewController *tab;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

//方法是获取全局的app delegate
+ (AppDelegate *)shareapp;


@end

