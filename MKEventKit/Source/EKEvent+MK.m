//
//  EKEvent+MK.m
//  MKEventKit
//
//  Created by Michal Konturek on 18/06/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "EKEvent+MK.h"

#import "EKEventStore+MK.h"

#import <MKFoundationKit/NSDate+MK.h>

@implementation EKEvent (MK)

+ (instancetype)mk_createWithTitle:(NSString *)title
                         startDate:(NSDate *)startDate duration:(NSInteger)duration {
    EKEvent *event = [self mk_create];
    event.alarms = @[[EKAlarm alarmWithAbsoluteDate:startDate]];
    event.calendar = [[EKEventStore mk_registeredEventStore] defaultCalendarForNewEvents];
    event.startDate = startDate;
    event.endDate = [startDate mk_dateByAddingMinutes:duration];
    return event;
}

+ (instancetype)mk_create {
    return [self mk_createWithEventStore:[EKEventStore mk_registeredEventStore]];
}

+ (instancetype)mk_createWithEventStore:(EKEventStore *)store {
    return [self eventWithEventStore:store];
}

+ (instancetype)mk_eventWithID:(NSString *)identifier {
    return [[EKEventStore mk_registeredEventStore] eventWithIdentifier:identifier];
}

+ (NSArray *)mk_eventsFrom:(NSDate *)from to:(NSDate *)to {
    id store = [EKEventStore mk_registeredEventStore];
    id predicate = [store predicateForEventsWithStartDate:from endDate:to calendars:nil];
    return [[EKEventStore mk_registeredEventStore] eventsMatchingPredicate:predicate];
}

- (void)mk_save {
    [[EKEventStore mk_registeredEventStore] saveEvent:self span:EKSpanThisEvent error:nil];
}

- (void)mk_delete {
    [[EKEventStore mk_registeredEventStore] removeEvent:self span:EKSpanThisEvent error:nil];
}

@end
