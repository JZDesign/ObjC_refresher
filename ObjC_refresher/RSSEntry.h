//
//  RSSEntry.h
//  ObjC_refresher
//
//  Created by JacobRakidzich on 7/23/17.
//  Copyright © 2017 Jacob Rakidzich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSEntry : NSObject 

@property (copy) NSString *blogTitle;
@property (copy) NSString *articleTitle;
@property (copy) NSString *articleURL;
@property (copy) NSDate *articleDate;

-(id)initWithBlogTitle:(NSString *)blogTitle articleTitle:(NSString *)articleTitle articleURL:(NSString *)articleURL articleDate:(NSDate *)articleDate;


@end
