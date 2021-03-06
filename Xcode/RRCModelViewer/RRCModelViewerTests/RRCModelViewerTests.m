//
//  RRCModelViewerTests.m
//  RRCModelViewerTests
//
//  Created by Ricardo on 1/18/14.
//  Copyright (c) 2014 RendonCepeda. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RRCColladaParser.h"
#import "RRCOpenglesModel.h"

@interface RRCModelViewerTests : XCTestCase

@end

@implementation RRCModelViewerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCourse
{
    // "Hello, World!"
    NSLog(@"Hello, World!");
}

- (void)testParser
{
    NSLog(@"%@:- Parser", [self class]);
    
    RRCColladaParser* parser = [[RRCColladaParser alloc] initWithXML:@"Models/mushroom"];
    
    if([parser didParseXML])
    {
        NSLog(@"Successfully parsed XML");
        [parser logCOLLADA];
        
        RRCOpenglesModel* model = [[RRCOpenglesModel alloc] initWithCollada:parser.collada];
        if([model didConvertCollada])
        {
            NSLog(@"Successfully converted COLLADA");
            [model logOpenGLES];
        }
        else
            XCTFail(@"Error converting COLLADA");
    }
    else
        XCTFail(@"Error parsing XML");
}

@end
