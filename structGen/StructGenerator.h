//
//  StructGenerator.h
//  structGen
//
//  Created by Zakk Hoyt on 2/6/16.
//  Copyright © 2016 Zakk Hoyt. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StructGenerator : NSObject


+(NSString*)generateStruct:(NSString*)name members:(NSArray<NSString*>*)members;
@end
