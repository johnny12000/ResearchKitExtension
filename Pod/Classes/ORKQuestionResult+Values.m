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
            ORKScaleQuestionResult* scaleQuestionResult = (ORKScaleQuestionResult*)self;
            resultString = [NSString stringWithFormat:@"%@", scaleQuestionResult.scaleAnswer];
            break;
        }
        case ORKQuestionTypeSingleChoice:
        case ORKQuestionTypeMultipleChoice:
        {
            ORKChoiceQuestionResult* choiceQuestionResult = (ORKChoiceQuestionResult*)self;
            resultString = [choiceQuestionResult.choiceAnswers componentsJoinedByString:@","];
            break;
        }
        case ORKQuestionTypeDecimal:
        case ORKQuestionTypeInteger:
        {
            ORKNumericQuestionResult* numbericQuestionResult = (ORKNumericQuestionResult*)self;
            
            BOOL unitExists = numbericQuestionResult.unit && numbericQuestionResult.unit.length != 0;
            
            resultString = [NSString stringWithFormat:@"%@%@%@",
                            numbericQuestionResult.numericAnswer,
                            unitExists ? @" " : @"",
                            unitExists ? numbericQuestionResult.unit : @""];
            break;
        }
        case ORKQuestionTypeBoolean:
        {
            ORKBooleanQuestionResult* booleanQuestionResult = (ORKBooleanQuestionResult*)self;
            resultString = booleanQuestionResult.booleanAnswer ? @"Y" : @"N";
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

