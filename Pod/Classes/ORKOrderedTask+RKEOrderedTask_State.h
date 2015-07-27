//
//  ORKOrderedTask+RKEOrderedTask_State.h
//  ResearchKitExtension
//
//  Created by nristic on 7/22/15.
//  Copyright (c) 2015 Nikola Ristic. All rights reserved.
//

#import "ResearchKit.h"

typedef BOOL(^ConditionBlock)(id object, NSDictionary* bindings);

static ConditionBlock NO_CONDITION = ^BOOL(id object, NSDictionary* bindings){ return TRUE; };

@interface ORKNavigableOrderedTask  (RKEOrderedTask_State)

+ (ORKNavigableOrderedTask *) navigableOrderedTaskWithIdentifier:(NSString *)identifier
                                                           steps:(NSArray*)steps
                                                      conditions:(NSArray*)conditions;

@end
