
//
//  main.m
//  structGen
//
//  Created by Zakk Hoyt on 2/6/16.
//  Copyright © 2016 Zakk Hoyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StructGenerator.h"


void printUsage() {
    NSLog(@"Usage:\n"
          @"structGen name key1,value1 key2,value2");
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        if(argc < 3) {
            printUsage();
        } else {
            NSString *name = [NSString stringWithUTF8String:argv[1]];
            
            NSMutableArray *members = [[NSMutableArray alloc]initWithCapacity:argc-2];
            for(NSUInteger i = 2; i < argc; i++) {
                // Get argv[i] and check for comma
                NSString *arg = [NSString stringWithUTF8String:argv[i]];
                if([arg containsString:@","] == NO) {
                    printUsage();
                    return -1;
                }
                [members addObject:arg];
                
            }
            NSString *generator = [StructGenerator generateStruct:name members:members];
            NSLog(@"\n%@", generator);
            
            return 0;
        }
    }
    return 0;
}
