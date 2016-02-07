//
//  StructGenerator.m
//  structGen
//
//  Created by Zakk Hoyt on 2/6/16.
//  Copyright © 2016 Zakk Hoyt. All rights reserved.
//

#import "StructGenerator.h"

@implementation StructGenerator

+(NSString*)generateStruct:(NSString*)name members:(NSArray<NSString*>*)members {
    NSString *hString = [StructGenerator generateHStruct:name members:members];
    NSString *mString = [StructGenerator generateMStruct:name members:members];
    NSString *output = [NSString stringWithFormat:@"\n"
                        @".h file\n"
                        @"%@\n"
                        @"\n"
                        @".m file\n"
                        @"%@\n"
                        @"\n",
                        hString, mString];
    return output;
}



//extern const struct TabOrderManagerTitles {
//    __unsafe_unretained NSString *dashboard;
//    __unsafe_unretained NSString *feeding;
//    __unsafe_unretained NSString *sleep;
//    __unsafe_unretained NSString *weight;
//    __unsafe_unretained NSString *diapers;
//    __unsafe_unretained NSString *stats;
//    __unsafe_unretained NSString *length;
//    __unsafe_unretained NSString *photos;
//    __unsafe_unretained NSString *pumping;
//    __unsafe_unretained NSString *dailySchedule;
//    __unsafe_unretained NSString *notes;
//    __unsafe_unretained NSString *babyInfo;
//    __unsafe_unretained NSString *settings;
//    __unsafe_unretained NSString *faqSupport;
//} TabOrderManagerTitles;

+(NSString*)generateHStruct:(NSString*)name members:(NSArray<NSString*>*)members {
    NSString *startString = [NSString stringWithFormat:@"extern const struct %@ {", name];
    NSMutableString *output = [[NSMutableString alloc]initWithString:startString];
    
    
    [members enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *parts = [obj componentsSeparatedByString:@","];
        if(parts.count != 2) {
            NSLog(@"Bad argument: %@", obj);
            return;
        }
        
        NSString *member = [NSString stringWithFormat:@"\t__unsafe_unretained NSString *%@;", parts[0]];
        [output appendFormat:@"\n%@", member];
    }];
    
    NSString *endStr = [NSString stringWithFormat:@"} %@;", name];
    [output appendFormat:@"\n%@", endStr];
    return output;
    
}

//const struct TabOrderManagerTitles TabOrderManagerTitles = {
//    .dashboard = @"Dashboard",
//    .feeding = @"Feeding",
//    .sleep = @"Sleep",
//    .weight = @"Weight",
//    .diapers = @"Diapers",
//    .stats = @"Stats",
//    .length = @"Length",
//    .photos = @"Photos",
//    .pumping = @"Pumping",
//    .dailySchedule = @"Daily Schedule",
//    .notes = @"Notes",
//    .babyInfo = @"Baby Info",
//    .settings = @"Settings",
//    .faqSupport = @"FAQ / Support"
//};

+(NSString*)generateMStruct:(NSString*)name members:(NSArray<NSString*>*)members {
    NSString *startString = [NSString stringWithFormat:@"const struct %@ %@ = {", name, name];
    NSMutableString *output = [[NSMutableString alloc]initWithString:startString];
    
    
    [members enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *parts = [obj componentsSeparatedByString:@","];
        if(parts.count != 2) {
            NSLog(@"Bad argument: %@", obj);
            return;
        }
        
        NSString *member = [NSString stringWithFormat:@"\t.%@ = @\"%@\",", parts[0], parts[1]];
        [output appendFormat:@"\n%@", member];
    }];
    
    NSString *endStr = @"};";
    [output appendFormat:@"\n%@", endStr];
    return output;
}




@end
