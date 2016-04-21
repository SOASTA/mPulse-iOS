//
//  MPConfigMetricTests.m
//  Boomerang
//
//  Created by Giri Senji on 5/28/14.
//  Copyright (c) 2014 SOASTA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MPConfigMetric.h"
#import "NSObject+TT_SBJSON.h"
#import "NSString+MPExtensions.h"
#import "JSON.h"

@interface MPConfigMetricTests : XCTestCase

@end

@implementation MPConfigMetricTests

-(void) testConfigMetric
{
  // Human readable version of JSON
  //    {
  //      "name": "MetricName",
  //      "index": "10",
  //      "type": "MetricType",
  //      "label": "MetricLabel",
  //      "dataType": "MetricDataType"
  //    }
  NSString *metricJson = @"{\"name\":\"MetricName\",\"index\":\"10\",\"type\":\"MetricType\",\"label\":\"MetricLabel\",\"dataType\":\"MetricDataType\"}";

  MPConfigMetric *metric = [[MPConfigMetric alloc] initWithDictionary:[metricJson tt_JSONValue]];
  
  XCTAssertNotNil(metric, @"initWithDictionary should always return a valid MPConfigMetric.");
  
  XCTAssertEqualObjects(metric.name, @"MetricName", @"Incorrect metric name.");
  XCTAssertEqual(metric.index, 10, @"Incorrect metric index.");
  XCTAssertEqualObjects(metric.type, @"MetricType", @"Incorrect metric type.");
  XCTAssertEqualObjects(metric.label, @"MetricLabel", @"Incorrect metric type.");
}

@end
