//
//  ResearchKitExtensionTests.m
//  ResearchKitExtensionTests
//
//  Created by Nikola Ristic on 07/24/2015.
//  Copyright (c) 2015 Nikola Ristic. All rights reserved.
//

// https://github.com/Specta/Specta

#import "ResearchKit.h"
#import "ORKOrderedTask+RKEOrderedTask_State.h"

SpecBegin(RKEOrderedTask_States)

describe(@"RKEOrderedTask_State", ^{

    it(@"should create new instance", ^{
        
        ORKStep* step1 = [[ORKStep alloc] initWithIdentifier:@"STEP1"];
        ORKStep* step2 = [[ORKStep alloc] initWithIdentifier:@"STEP2"];
        ORKStep* step3 = [[ORKStep alloc] initWithIdentifier:@"STEP3"];
        
        id teststruct = @{ step1 : @[@{ @"cond1" : step2 }, @{ @"cond2" : step3 }],
                           step2 : step3,
                           step3 : @"" };
        
        
        
        id result = [ORKNavigableOrderedTask navigableOrderedTaskWithIdentifier:@"testIdentifier"
                                                                transitionTable:teststruct];
        
        expect(result).toNot.equal(nil);
    });
});

SpecEnd

