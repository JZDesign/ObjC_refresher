//
//  ViewController.m
//  ObjC_refresher
//
//  Created by JacobRakidzich on 7/23/17.
//  Copyright © 2017 Jacob Rakidzich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@property (strong, nonatomic) IBOutlet UISwitch *rgbSwitch;
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) IBOutlet UISlider *redSlider;
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;
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




- (IBAction)doCount:(UIStepper *)sender {
    double value = [sender value];
    [_countLabel setText:[NSString stringWithFormat:@"Count: %d", (int)value]];
}



-(IBAction)sliderValueChanged:(UISlider *)sender {
    
    switch (sender.tag) {
        case 0:
            _redSlider.value = sender.value;
            
            break;
        case 1:
            _greenSlider.value = sender.value;
            break;
        case 2:
            _blueSlider.value = sender.value;
            break;
        default:
            break;
    }
    _myView.backgroundColor = [UIColor colorWithRed:_redSlider.value green:_greenSlider.value blue:_blueSlider.value alpha:1];
    
}



- (IBAction)lockSliders:(id)sender {
    if (_rgbSwitch.on) {
        _redSlider.enabled = true;
        _greenSlider.enabled = true;
        _blueSlider.enabled = true;
    } else {
        _redSlider.enabled = false;
        _greenSlider.enabled = false;
        _blueSlider.enabled = false;
    }
    
}

@end
