//
//  FSFont.h
//  FontSets
//
//  Created by Daan on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSFont : NSObject <NSCoding>

@property (strong) NSString *fontFile;
@property (strong) NSNumber *fontSize;
@property (strong) NSString *fontName;
@property (strong) NSString *fontDescription;
@property (strong) NSNumber *isSemi;
@property (strong) NSNumber *isBold;
@property (strong) NSNumber *isItalic;
@property (strong) NSNumber *isLight;

- (void)generateName;
- (void)generateDescription;
@end
