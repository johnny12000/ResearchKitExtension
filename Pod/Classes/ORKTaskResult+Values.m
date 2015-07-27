//
//  ORKTaskResult+Values.m
//  Pods
//
//  Created by nristic on 7/27/15.
//
//

#import "ORKTaskResult+Values.h"
#import "ORKQuestionResult+Values.h"

@implementation ORKTaskResult (Values)

- (NSString*) getValueForIdentifier:(NSString*)identifier {
    
    NSPredicate* filter = [NSPredicate predicateWithFormat:@"identifier = %@" argumentArray:@[ identifier ]];
    
    NSArray* result = [self.results filteredArrayUsingPredicate:filter];
    
    if(result) {
        ORKStepResult *res = [result firstObject];
        ORKQuestionResult * questionResult = [res.results firstObject];
        return [questionResult getAnswerString];
    }
    return nil;
}

@end
