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
@property (nonatomic) NSMutableArray *shuffleArray;
@property (nonatomic) int count;
@property (nonatomic) NSMutableString *rnd;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _rnd = [NSMutableString stringWithString:@"Test Shuffle String"];
    _shuffleStringLabel.text = _rnd;
    _shuffleArray = [NSMutableArray arrayWithArray:@[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9]];
    
    [self setArrayLabelText];
    _count = 0;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)setArrayLabelText {
    NSMutableString *str = [NSMutableString stringWithString:@""];
    for (int i = 0; i < _shuffleArray.count; i++) {
        [str appendString:[NSMutableString stringWithFormat:@"%@",[_shuffleArray objectAtIndex:i]]];
    }
    _arrayLabel.text = str;

}

- (IBAction)doShuffleStringLabel:(id)sender {
    // placeholder object for shuffle
    NSString *str;
    for (NSInteger i = _rnd.length - 1, j; i >= 0; i--) {
        // generate random number in range
        j = arc4random() % (i + 1);
        // store placeholder for shuffle
        str = [_rnd substringWithRange:NSMakeRange(i, 1)];
        // shuffle
        [_rnd replaceCharactersInRange:NSMakeRange(i, 1) withString:[_rnd substringWithRange:NSMakeRange(j, 1)]];
        [_rnd replaceCharactersInRange:NSMakeRange(j, 1) withString:str];
    }
    [self shuffleStringLabel].text = _rnd;
}

- (IBAction)doShuffleArray:(id)sender {
    
    for (NSInteger i = _shuffleArray.count - 1, j; i >= 0; i--) {
        // generate random number in range
        j = arc4random() % (i + 1);
        // shuffle
        [_shuffleArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    [self setArrayLabelText];
    
}

- (IBAction)doCount:(id)sender {
}

@end
