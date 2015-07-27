//
//  ORKQuestionResult+Values.m
//  Pods
//
//  Created by nristic on 7/27/15.
//
//

#import "ORKQuestionResult+Values.h"

@implementation ORKQuestionResult (Values)

- (NSString*)getAnswerString {
    
    NSString* resultString = @"";
    
    switch (self.questionType) {
        case ORKQuestionTypeNone:
        {
            break;
        }
        case ORKQuestionTypeScale:
        {
            break;
        }
        case ORKQuestionTypeSingleChoice:
        {
            break;
        }
        case ORKQuestionTypeMultipleChoice:
        {
            break;
        }
        case ORKQuestionTypeDecimal:
        {
            break;
        }
        case ORKQuestionTypeInteger:
        {
            break;
        }
        case ORKQuestionTypeBoolean:
        {
            break;
        }
        case ORKQuestionTypeText:
        {
            ORKTextQuestionResult* textQuestionResult = (ORKTextQuestionResult*)self;
            
            resultString = textQuestionResult.textAnswer;
            
            break;
        }
        case ORKQuestionTypeTimeOfDay:
        {
            break;
        }
        case ORKQuestionTypeDateAndTime:
        {
            break;
        }
        case ORKQuestionTypeDate:
        {
            break;
        }
        case ORKQuestionTypeTimeInterval:
        {
            break;
        }
        default:
            break;
    }
    
    return resultString;
}


@end

