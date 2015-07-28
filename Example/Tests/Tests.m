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
#import "ORKTaskResult+Values.h"
#import "ORKQuestionResult+Values.h"

SpecBegin(RKEOrderedTask_States)

describe(@"RKEOrderedTask_State", ^{

    it(@"should create new instance", ^{
    });
});

SpecEnd


SpecBegin(ORKQuestionResult_Values)

describe(@"ORKQuestionResult_Values", ^{
    it(@"should return value for text answer", ^{
    
        ORKTextQuestionResult* textQuestionResult = [[ORKTextQuestionResult alloc] init];
        textQuestionResult.textAnswer = @"Dummy Answer";
        textQuestionResult.questionType = ORKQuestionTypeText;
        
        NSString* result = [textQuestionResult getAnswerString];
        
        expect(result).to.equal(textQuestionResult.textAnswer);
        
    });
    
    it(@"should return empty string for unknown result answers", ^{
        ORKTextQuestionResult* textQuestionResult = [[ORKTextQuestionResult alloc] init];
        textQuestionResult.textAnswer = @"Dummy Answer";
        textQuestionResult.questionType = ORKQuestionTypeNone;
        
        NSString* result = [textQuestionResult getAnswerString];
        
        expect(result).to.equal(@"");
    });
    
    it(@"should return value for scale answer", ^{
        
        ORKScaleQuestionResult* scaleQuestionResult = [[ORKScaleQuestionResult alloc] init];
        scaleQuestionResult.scaleAnswer = [[NSNumber alloc] initWithFloat:1.2];
        scaleQuestionResult.questionType = ORKQuestionTypeScale;
        
        NSString* result = [scaleQuestionResult getAnswerString];
        
        expect(result).to.equal(@"1.2");
    });
    
    it(@"should return choice for choices answer", ^{
        
        ORKChoiceQuestionResult* choiceQuestionResult = [ORKChoiceQuestionResult new];
        choiceQuestionResult.questionType = ORKQuestionTypeSingleChoice;
        choiceQuestionResult.choiceAnswers = @[@"CHOICE"];
        
        NSString* result = [choiceQuestionResult getAnswerString];
        
        expect(result).to.equal(@"CHOICE");
    });
    
    it(@"should return selected choices string for choices answer", ^{
        
        ORKChoiceQuestionResult* choiceQuestionResult = [ORKChoiceQuestionResult new];
        choiceQuestionResult.questionType = ORKQuestionTypeMultipleChoice;
        choiceQuestionResult.choiceAnswers = @[@"CHOICE1", @"CHOICE2"];
        
        NSString* result = [choiceQuestionResult getAnswerString];
        
        expect(result).to.equal(@"CHOICE1,CHOICE2");
    });
});

SpecEnd

SpecBegin(ORKTaskResult_Values)

describe(@"ORKTaskResult_Values", ^{

    it(@"should return value for identifier", ^{
        
        
        ORKTextQuestionResult* q1 = [[ORKTextQuestionResult alloc] init];
        q1.textAnswer = @"Dummy Answer 1";
        q1.questionType = ORKQuestionTypeText;
        
        ORKStepResult* step1 = [[ORKStepResult alloc] init];
        step1.identifier = @"STEP1";
        step1.results = @[q1];
        
        ORKTextQuestionResult* q2 = [[ORKTextQuestionResult alloc] init];
        q2.textAnswer = @"Dummy Answer 2";
        q2.questionType = ORKQuestionTypeText;
        
        ORKStepResult* step2 = [[ORKStepResult alloc] init];
        step2.identifier = @"STEP2";
        step2.results = @[q2];
        
        ORKTextQuestionResult* q3 = [[ORKTextQuestionResult alloc] init];
        q3.textAnswer = @"Dummy Answer 3";
        q3.questionType = ORKQuestionTypeText;
        
        ORKStepResult* step3 = [[ORKStepResult alloc] init];
        step3.identifier = @"STEP3";
        step3.results = @[q3];
        
        
        ORKTaskResult* taskResult = [[ORKTaskResult alloc] init];
        taskResult.results = @[step1, step2, step3];
        
        
        NSString* result = [taskResult getValueForIdentifier:@"STEP3"];
        
        expect(result).to.equal(q3.textAnswer);
        
    });
});

SpecEnd

