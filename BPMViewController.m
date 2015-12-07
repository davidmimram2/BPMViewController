//
//  BPMViewController.m
//  StandTune
//
//  Created by Sean on 12/3/15.
//  Copyright © 2015 Sean Quinn. All rights reserved.
//

#import "BPMViewController.h"

@interface BPMViewController ()

@property int beat;
@property int meter;

@property double timeInterval;

@property BOOL dark;

@property NSTimer *flashTimer;
@property NSTimer *lightTimer;

@end

@implementation BPMViewController
@synthesize bpm, beatLabel, bpmLabel, tapToCloseLabel;

- (BPMViewController *)initWithBpm:(double)beatsPerMinute meter:(int)meter {
    if (!self) {
        self = [super initWithNibName:nil bundle:nil];
    }
    
    if (beatsPerMinute) {
        self.bpm = beatsPerMinute;
    }
    
    if (meter)
        self.meter = meter;
    
    self.dark = false;
    
    return self;
}

- (void)toggleColor:(NSTimer *)timer {
    if (!self.dark) {
        self.view.backgroundColor = [UIColor blackColor];
        self.beatLabel.textColor = [UIColor whiteColor];
        self.bpmLabel.textColor = [UIColor whiteColor];
        self.tapToCloseLabel.textColor = [UIColor whiteColor];
        self.dark = true;
        
        self.lightTimer = [NSTimer scheduledTimerWithTimeInterval:(self.timeInterval / 4) target:self selector:@selector(toggleColor:) userInfo:nil repeats:NO];
        
        ++self.beat;
        if (self.beat > self.meter)
            self.beat = 1;
        self.beatLabel.text = [NSString stringWithFormat:@"%d", self.beat];
    } else {
        [self.lightTimer invalidate];
        self.lightTimer = nil;
        self.view.backgroundColor = [UIColor whiteColor];
        self.beatLabel.textColor = [UIColor blackColor];
        self.bpmLabel.textColor = [UIColor blackColor];
        self.tapToCloseLabel.textColor = [UIColor blackColor];
        self.dark = false;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.beat = 1;
    self.beatLabel.text = [NSString stringWithFormat:@"%d", self.beat];
    self.bpmLabel.text = [NSString stringWithFormat:@"\u2669 = %.0f", self.bpm];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.timeInterval = 60.00 / self.bpm;
    self.flashTimer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(toggleColor:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.flashTimer forMode:NSRunLoopCommonModes];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        tapToCloseLabel.alpha = 0;
    } completion:^(BOOL finished) {
        tapToCloseLabel = nil;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
