//
//  RSSViewController.m
//  ObjC_refresher
//
//  Created by JacobRakidzich on 7/23/17.
//  Copyright © 2017 Jacob Rakidzich. All rights reserved.
//


/*
 // rss item for reference
 <item>
     <title>Ann Coulter’s Delta Snafu Brings Twitter Together In This Week’s News Recap</title>
     <description>The commentator Ann Coulter's dust-up with Delta finally gave the internet a reason to rally behind an airline.</description>
     <link>https://www.wired.com/story/internet-week-129</link>
     <guid isPermaLink="false">596f868157beec1e84cbd88b</guid>
     <pubDate>Sun, 23 Jul 2017 13:00:00 +0000</pubDate>
     <media:content/>
         <category>Culture</category>
         <media:keywords>Internet Week, While You Were Offline</media:keywords>
         <dc:creator>Graeme McMillan</dc:creator>
         <media:thumbnail url="https://media.wired.com/photos/5972448f88c660231060af44/master/pass/Ann-Coulter-675510342.jpg" width="2400" height="1800"/></item>
 
 */

#import "RSSViewController.h"

@interface RSSViewController () {
    
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;
    
}



@end

@implementation RSSViewController


# pragma MARK: Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initialize array and parser for table view and rss feed
    feeds = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:@"https://www.wired.com/feed/rss"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    
    // for dynamic cell size
    _tableView.estimatedRowHeight = 400.0;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.title = @"Wired.com RSS";
}


# pragma MARK: TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // open link in safari
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:feeds[indexPath.row][@"link"]];
    [app openURL:url options:nil completionHandler:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // dynamic cell size
    return UITableViewAutomaticDimension;
}




# pragma MARK: TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return feeds.count;
}

// Modify tableView:cellForRowAtIndexPath below like the following
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.textLabel.numberOfLines = 0;
    
    return cell;
}

# pragma MARK: Parser

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    element = elementName;
    // if rss item found init objects
    if ([element isEqualToString:@"item"]) {
        item = [[NSMutableDictionary alloc] init];
        title = [[NSMutableString alloc] init];
        link = [[NSMutableString alloc] init];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    // set values
    if ([elementName isEqualToString:@"item"]) {
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        
        [feeds addObject:[item copy]];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    // set values
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
        
    } else if ([element isEqualToString:@"link"]){
        [link appendString:string];
    }
}


-(void)parserDidEndDocument:(NSXMLParser *)parser {
    // upon rss feed completion reload table
    [self.tableView reloadData];
}

# pragma MARK: Dismiss VC

- (IBAction)doDoneButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
