//
//  FSDocument.h
//  FontSets
//
//  Created by Daan on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FSDocument : NSDocument <NSOpenSavePanelDelegate>

- (IBAction)exportHeader:(id)sender;
- (IBAction)selectProjectDir:(id)sender;

// handler for sheet ending
-(void)filePanelDidEnd:(NSWindow*)sheet
            returnCode:(int)returnCode
           contextInfo:(void*)contextInfo;

@property (strong) IBOutlet NSMutableArray *fonts;

@property (strong) NSString *prefix;
@property (strong) NSString *projectDir;


@end
