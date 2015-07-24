//
//  ORKOrderedTask+RKEOrderedTask_State.h
//  ResearchKitExtension
//
//  Created by nristic on 7/22/15.
//  Copyright (c) 2015 Nikola Ristic. All rights reserved.
//

#import "ResearchKit.h"

@interface ORKNavigableOrderedTask  (RKEOrderedTask_State)

+ (ORKNavigableOrderedTask *) navigableOrderedTaskWithIdentifier:(NSString *)identifier
                                                    transitionTable:(NSDictionary*)transitionTable;

@end
