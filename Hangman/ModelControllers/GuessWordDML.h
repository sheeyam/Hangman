//
//  GuessWordDML.h
//  Hangman
//
//  Created by Atlink on 10/2/18.
//  Copyright © 2018 UHCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuessWordDML : NSObject

+ (NSString *)fetchWordFromCategory: (NSString*)categoryname;
+ (bool)addWordWithWord:(NSString *)word category:(NSString *)category;
+ (bool)deleteWord:(NSString *)wordString;

@end
