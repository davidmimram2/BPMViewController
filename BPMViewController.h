//
//  BPMViewController.h
//  StandTune
//
//  Created by Sean on 12/3/15.
//  Copyright © 2015 Sean Quinn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPMViewController : UIViewController

@property double bpm;
@property IBOutlet UILabel *beatLabel;
@property IBOutlet UILabel *bpmLabel;
@property IBOutlet UILabel *tapToCloseLabel;

- (BPMViewController *)initWithBpm:(double)beatsPerMinute meter:(int)bpMeasure;

@end
