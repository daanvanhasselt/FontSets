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
@property (strong) NSString *fontName;
@property (strong) NSString *fontDescription;

@end
