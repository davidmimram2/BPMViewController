# BPMViewController
Part of an upcoming side-project of mine.

In situations where auditory feedback isn't possible, BPMViewController provides visual tempo-setting for conductors and soloists alike.

## Usage
BPMViewController allows you to set the BPM and the beats per measure when allocating its instance.

        BPMViewController *_bpmViewController = [[BPMViewController alloc] initWithBPM:120.00 meter:4];

## Future
I understand there are multitudes of improvements and options that could be exposed by additions to this codebase. I can't consistently provide the time this project needs to incorporate things like actual time signature support, colors, etc. **Pull requests and issues are welcome.**