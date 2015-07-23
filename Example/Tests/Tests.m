//
//  ResearchKitExtensionTests.m
//  ResearchKitExtensionTests
//
//  Created by Nikola Ristic on 07/22/2015.
//  Copyright (c) 2015 Nikola Ristic. All rights reserved.
//

// https://github.com/Specta/Specta

#import "ResearchKit.h"
#import "ORKOrderedTask+RKEOrderedTask_State.h"

SpecBegin(RKEOrderedTask_States)

describe(@"RKEOrderedTask_State", ^{
    
    it(@"should create new instance", ^{
        id teststruct = @{ @"step" : @[@{ @"cond1": @"step2" }, @{@"cond2":@"step3"}],
                           @"step2" : @"step3" };
        
        
        id result = [[ORKNavigableOrderedTask alloc] init];
        
        expect(result).toNot.equal(nil);
    });
    
//    it(@"should throw argument exception", ^{
//        expect(@"team").toNot.contain(@"I");
//    });
//    
//    it(@"will wait and succeed", ^{
//        waitUntil(^(DoneCallback done) {
//            done();
//        });
//    });
});

SpecEnd

