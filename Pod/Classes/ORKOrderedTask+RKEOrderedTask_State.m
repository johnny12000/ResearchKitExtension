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
        
        
//        if (obj!= nil && (ConditionBlock)obj != NO_CONDITION) {
//            ORKStepNavigationRule* navigationRule = nil;
//            
//            if([obj isKindOfClass:[NSArray class]]) {
//                
//                NSArray* conditions
//                
//                navigationRule = [[ORKDirectStepNavigationRule alloc] initWithDestinationStepIdentifier:((ORKStep*)steps[idx]).identifier];
//            }
//            else {
//                
//                
//            }
        
            [result setNavigationRule:navigationRule forTriggerStepIdentifier:((ORKStep*)steps[idx]).identifier];
        //}
        
    }];
    
    
//    
//    [transitionTable enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//        
//        
//        if([obj isKindOfClass:[ORKStep class]]) {
//            ORKStep* nextStep = (ORKStep*)obj;
//            
//        }
//        else if([obj isKindOfClass:[NSArray class]]) {
//            NSArray* transitions = (NSArray*)obj;
//            
//            NSMutableArray* predicates = [[NSMutableArray alloc] init];
//            NSMutableArray* states = [[NSMutableArray alloc] init];
//            
//            [transitions enumerateObjectsUsingBlock:^(id obj1, NSUInteger idx, BOOL *stop) {
//                
//                //TODO: figure out predicate format
//                
//                //afORKTaskResult
//                
//                //[predicates addObject:[NSPredicate predicateWithFormat:@"%K = %@" argumentArray:@[@"result", @"conditionvalue"]]];
//                
//                [predicates addObject:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
//                    
//                    NSLog(@"%@", evaluatedObject);
//                    return TRUE;
//                }]];
//                
//                NSDictionary* condition = (NSDictionary*)obj1;
//                
//                [states addObject:condition.allValues.firstObject];
//            }];
//            
//            navigationRule = [[ORKPredicateStepNavigationRule alloc]initWithResultPredicates:predicates destinationStepIdentifiers:states];
//        }
//        
//        
//        if(navigationRule)
//            
//     }];
//    
    return result;
}

@end
