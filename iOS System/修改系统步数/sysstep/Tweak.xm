#import "QQStepHelp.h"
#import <HealthKit/HealthKit.h>


%hook WDAppDelegate
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2 {
	%log;
	_Bool r = %orig; 
	HKHealthStore *healthStore = [[HKHealthStore alloc] init];
	healthStore = [[HKHealthStore alloc] init];
    HKQuantityType *quantityTypeIdentifier = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    HKQuantity *quantity = [HKQuantity quantityWithUnit:[HKUnit countUnit] doubleValue:1000];
    HKQuantitySample *temperatureSample = [HKQuantitySample quantitySampleWithType:quantityTypeIdentifier quantity:quantity startDate:[NSDate date] endDate:[NSDate date] metadata:nil];
    [healthStore saveObject:temperatureSample withCompletion:^(BOOL success, NSError *error) {
        if (success) {
        }else {
        }
    }];
    return r;
}
%end
