//
//  ViewController.m
//  ObjC_refresher
//
//  Created by JacobRakidzich on 7/23/17.
//  Copyright © 2017 Jacob Rakidzich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *shuffleStringLabel;
@property (strong, nonatomic) IBOutlet UILabel *arrayLabel;
@property (strong, nonatomic) IBOutlet UILabel *countLabel;
@property (strong, nonatomic) IBOutlet UIStepper *countStepper;
@property (nonatomic) NSArray *shuffleArray;
@property (nonatomic) int count;
@property (nonatomic) NSMutableString *rnd;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _rnd = [NSMutableString stringWithString:@"Test Shuffle String"];
    _shuffleStringLabel.text = _rnd;
    _shuffleArray = @[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9];
    _count = 0;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doShuffleStringLabel:(id)sender {
    NSString *str;
    for (NSInteger i = _rnd.length - 1, j; i >= 0; i--) {
        j = arc4random() % (i + 1);
        str = [_rnd substringWithRange:NSMakeRange(i, 1)];
        [_rnd replaceCharactersInRange:NSMakeRange(i, 1) withString:[_rnd substringWithRange:NSMakeRange(j, 1)]];
        [_rnd replaceCharactersInRange:NSMakeRange(j, 1) withString:str];
    }
    [self shuffleStringLabel].text = _rnd;
}

- (IBAction)doShuffleArray:(id)sender {
}

- (IBAction)doCount:(id)sender {
}

@end
