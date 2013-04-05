//
//  CSVSerializationTests.m
//  Integrated Tests
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface CSVSerializationTests : SenTestCase

@end

@implementation CSVSerializationTests

- (void)testSerializingTwoRecords
{
    CSVRow *header = [[CSVHeader alloc] initWithValues:@[@"Name", @"Age", @"Year"]];
    CSVRow *ryan = [[CSVRecord alloc] initWithValues:@[@"Ryan Davies", @20, @"England"]];
    CSVRow *john = [[CSVRecord alloc] initWithValues:@[@"John Smith", @34, @"France"]];
    CSVTable *table = [[CSVTable alloc] initWithRows:@[header, ryan, john]];
    
    NSMutableString *output = [[NSMutableString alloc] init];
    CSVSerializer *serializer = [[CSVSerializer alloc] initWithOutput:output];
    [serializer serialize:recordSet];
    
    NSString *expectedOutput = @"Name,Age,Country\nRyan Davies,20,England\nJohn Smith,34,France\n";
    STAssertEqualObjects(output, expectedOutput, @"Output did not match expected output.");
}

@end
