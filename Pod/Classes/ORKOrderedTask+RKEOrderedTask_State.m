//
//  ORKOrderedTask+RKEOrderedTask_State.m
//  ResearchKitExtension
//
//  Created by nristic on 7/22/15.
//  Copyright (c) 2015 Nikola Ristic. All rights reserved.
//

#import "ORKOrderedTask+RKEOrderedTask_State.h"

@implementation ORKNavigableOrderedTask (RKEOrderedTask_State)



+ (ORKNavigableOrderedTask *) navigableOrderedTaskWithIdentifier:(NSString *)identifier
                                                           steps:(NSArray*)steps
                                                      conditions:(NSArray *)conditions {
    
    ORKNavigableOrderedTask* result = [[ORKNavigableOrderedTask alloc] initWithIdentifier:identifier steps:steps];
    
    [conditions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        ORKStepNavigationRule* navigationRule = nil;
        
        if((ConditionBlock)obj == NO_CONDITION)
        {
            navigationRule = [[ORKDirectStepNavigationRule alloc] initWithDestinationStepIdentifier:((ORKStep*)steps[idx+1]).identifier];
        }
        else
        {
            navigationRule = [[ORKPredicateStepNavigationRule alloc]
                              initWithResultPredicates:@[ [NSPredicate predicateWithBlock:(ConditionBlock)obj] ]
                              destinationStepIdentifiers:@[ ((ORKStep*)steps[idx]).identifier ]];
        }
        
        [result setNavigationRule:navigationRule forTriggerStepIdentifier:((ORKStep*)steps[idx]).identifier];
        
    }];

    return result;
}

@end
