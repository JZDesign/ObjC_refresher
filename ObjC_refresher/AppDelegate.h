//
//  AppDelegate.h
//  ObjC_refresher
//
//  Created by JacobRakidzich on 7/23/17.
//  Copyright © 2017 Jacob Rakidzich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

