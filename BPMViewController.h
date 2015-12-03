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

- (id)initWithBpm:(double)beatsPerMinute beatsPerMeasure:(int)bpMeasure;

@end

/**
 
 BPMViewController *_testVC = [[BPMViewController alloc] initWithBpm:120.0 beatsPerMeasure:4];
 [self presentViewController:_testVC animated:YES completion:nil];B
 
 **/
