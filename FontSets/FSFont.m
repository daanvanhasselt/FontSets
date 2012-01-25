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
@synthesize fontName;
@synthesize fontDescription;

-(NSString *)description{
    return [NSString stringWithFormat:@"%@, %@, %@", fontFile, fontName, fontDescription];
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.fontFile forKey:@"fontFile"];
    [aCoder encodeObject:self.fontName forKey:@"fontName"];
    [aCoder encodeObject:self.fontDescription forKey:@"fontDescription"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [self init]){
        self.fontFile = [aDecoder decodeObjectForKey:@"fontFile"];
        self.fontName = [aDecoder decodeObjectForKey:@"fontName"];
        self.fontDescription = [aDecoder decodeObjectForKey:@"fontDescription"];
    }
    return self;
}

@end
