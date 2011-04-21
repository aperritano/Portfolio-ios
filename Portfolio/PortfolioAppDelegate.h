//
//  PortfolioAppDelegate.h
//  Portfolio
//
//  Created by Anthony John Perritano on 3/12/11.
//  Copyright 2011 .t All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PortfolioAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
