//
//  SinglePlayerTableViewController.h
//  Hangman
//
//  Created by Atlink on 9/27/18.
//  Copyright © 2018 UHCL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SinglePlayerTableViewController : UITableViewController
{
    NSMutableArray* _dataArray;
    NSMutableArray* _dataModeArray;
    NSString* _guessWord;
}

@end
