//
//  RSSEntry.m
//  ObjC_refresher
//
//  Created by JacobRakidzich on 7/23/17.
//  Copyright © 2017 Jacob Rakidzich. All rights reserved.
//

#import "RSSEntry.h"

@implementation RSSEntry

- (id)initWithBlogTitle:(NSString*)blogTitle articleTitle:(NSString*)articleTitle articleURL:(NSString*)articleURL articleDate:(NSDate*)articleDate
{
    if ((self = [super init])) {
        _blogTitle = [blogTitle copy];
        _articleTitle = [articleTitle copy];
        _articleURL = [articleURL copy];
        _articleDate = [articleDate copy];
    }
    return self;
}


@end
