//
//  GameViewController.h
//  Hangman
//
//  Created by Atlink on 9/13/18.
//  Copyright © 2018 UHCL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GameViewController : UIViewController <UIAlertViewDelegate>
{
    int _curGuessCount;
    UIAlertView* _loseAlert;
    UIAlertView* _winAlert;
    NSArray* _titlesArray;
    AVAudioPlayer* _correctSoundPlayer;
    AVAudioPlayer* _wrongSoundPlayer;

}

@property (nonatomic, retain) NSString* guessWord;
@end
