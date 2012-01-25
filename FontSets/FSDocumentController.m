//
//  FSDocumentController.m
//  FontSets
//
//  Created by Daan on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FSDocumentController.h"

@implementation FSDocumentController

- (IBAction)exportHeaderForCurrentDocument:(id)sender{
    [[self currentDocument] exportHeader:sender];
}

@end
