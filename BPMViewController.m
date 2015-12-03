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
@property int beatsPerMeasure;

@property BOOL dark;

@property NSTimer *flashTimer;
@property NSTimer *lightTimer;

@end

@implementation BPMViewController
@synthesize bpm, beatLabel;

- (id)initWithBpm:(double)beatsPerMinute beatsPerMeasure:(int)bpMeasure {
    if (!self) {
        self = [super initWithNibName:nil bundle:nil];
    }
    
    if (beatsPerMinute)
        self.bpm = beatsPerMinute;
    
    if (bpMeasure)
        self.beatsPerMeasure = bpMeasure;
    
    self.dark = false;
    
    return self;
}

- (void)flash {
    if (!self.dark) {
        self.view.backgroundColor = [UIColor blackColor];
        self.beatLabel.textColor = [UIColor whiteColor];
        self.dark = true;
        self.lightTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(flash) userInfo:nil repeats:NO];
        
        ++self.beat;
        if (self.beat > self.beatsPerMeasure)
            self.beat = 1;
        self.beatLabel.text = [NSString stringWithFormat:@"%d", self.beat];
        
    } else {
        [self.lightTimer invalidate];
        self.lightTimer = nil;
        self.view.backgroundColor = [UIColor whiteColor];
        self.beatLabel.textColor = [UIColor blackColor];
        self.dark = false;
    }
}

- (void)startCounting {
    double timeInterval = 60.00 / self.bpm;
    self.flashTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(flash) userInfo:nil repeats:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.beat = 1;
    self.beatLabel.text = [NSString stringWithFormat:@"%d", self.beat];
}

- (void)viewWillAppear:(BOOL)animated {
    [self startCounting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
