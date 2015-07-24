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
                                                    transitionTable:(NSDictionary*)transitionTable {
    NSArray* steps = [transitionTable allKeys];
    ORKNavigableOrderedTask* result = [[ORKNavigableOrderedTask alloc] initWithIdentifier:identifier steps:steps];
    
    [transitionTable enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        ORKStepNavigationRule* navigationRule = nil;
        
        if([obj isKindOfClass:[ORKStep class]]) {
            ORKStep* nextStep = (ORKStep*)obj;
            navigationRule = [[ORKDirectStepNavigationRule alloc] initWithDestinationStepIdentifier:nextStep.identifier];
        }
        else if([obj isKindOfClass:[NSArray class]]) {
            NSArray* transitions = (NSArray*)obj;
            
            NSMutableArray* predicates = [[NSMutableArray alloc] init];
            NSMutableArray* states = [[NSMutableArray alloc] init];
            
            [transitions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                //TODO: figure out predicate format
                
                [predicates addObject:[NSPredicate predicateWithFormat:@"%K = %@" argumentArray:@[@"result", @"conditionvalue"]]];
                [states addObject:obj];
            }];
            
            navigationRule = [[ORKPredicateStepNavigationRule alloc]initWithResultPredicates:predicates destinationStepIdentifiers:states];
        }
        
        
        if(navigationRule)
            [result setNavigationRule:navigationRule forTriggerStepIdentifier:((ORKStep*)key).identifier];
     }];
    
    return result;
}

@end
