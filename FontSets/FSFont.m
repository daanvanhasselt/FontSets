//
//  FSFont.m
//  FontSets
//
//  Created by Daan on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FSFont.h"

@implementation FSFont
@synthesize fontFile;
@synthesize fontSize;
@synthesize fontName;
@synthesize fontDescription;
@synthesize isSemi, isBold, isItalic, isLight;

-(NSString *)description{
    return [NSString stringWithFormat:@"%@, %@, %@, %@", fontFile, fontSize, fontName, fontDescription];
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.fontFile forKey:@"fontFile"];
    [aCoder encodeObject:self.fontSize forKey:@"fontSize"];
    [aCoder encodeObject:self.fontName forKey:@"fontName"];
    [aCoder encodeObject:self.fontDescription forKey:@"fontDescription"];
    [aCoder encodeObject:self.isSemi forKey:@"isSemi"];
    [aCoder encodeObject:self.isBold forKey:@"isBold"];
    [aCoder encodeObject:self.isItalic forKey:@"isItalic"];
    [aCoder encodeObject:self.isLight forKey:@"isLight"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [self init]){
        self.fontFile = [aDecoder decodeObjectForKey:@"fontFile"];
        self.fontName = [aDecoder decodeObjectForKey:@"fontName"];
        self.fontSize = [aDecoder decodeObjectForKey:@"fontSize"];
        self.fontDescription = [aDecoder decodeObjectForKey:@"fontDescription"];
        self.isSemi = [aDecoder decodeObjectForKey:@"isSemi"];
        self.isBold = [aDecoder decodeObjectForKey:@"isBold"];
        self.isItalic = [aDecoder decodeObjectForKey:@"isItalic"];
        self.isLight = [aDecoder decodeObjectForKey:@"isLight"];
    }
    return self;
}

- (void)generateName{
    if(self.fontFile == nil || self.fontSize == nil){
        self.fontName = @"";
        return;
    };
    
    NSRange range = NSMakeRange(0, 3);
    NSString *fileAbrev = [self.fontFile substringWithRange:range];
    
    NSString *appendix = [isLight boolValue] ? @"L" : @"";
    appendix = [appendix stringByAppendingFormat:[isSemi boolValue] ? @"S" : @""];
    appendix = [appendix stringByAppendingFormat:[isBold boolValue] ? @"B" : @""];
    appendix = [appendix stringByAppendingFormat:[isItalic boolValue] ? @"I" : @""];
    self.fontName = [NSString stringWithFormat:@"%@-%@%@", fileAbrev, self.fontSize, appendix];
    
    [self generateDescription];
}

- (void)generateDescription{
    self.fontDescription = [NSString stringWithFormat:@"This is the %@ font, size %@. %@ %@ %@ %@", 
                            self.fontFile, 
                            self.fontSize, 
                            [isLight boolValue] ? @" - light - " : @"", 
                            [isSemi boolValue] ? @" - semi - " : @"", 
                            [isBold boolValue] ? @" - bold - " : @"", 
                            [isItalic boolValue] ? @" - italic - " : @""];
}

@end
