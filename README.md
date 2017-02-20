# MLFunctionalPackage
## A set of map-filter-reduce tools for Objective-C

Thanks to blocks Objective-C has the potential to support functional programming style. 
This library provides the basic map-filter-reduce library functions to further expand this opportunity.

## Installation
  
Use CocoaPods or copy those 2 files directly into the project. 

    pod 'MLFunctionalPackage'

## How to use it?

    See the .h file for detailed documentation.
    A quick example:
    
    #import <MLFunctionalPackage/MLFunctionalPackage.h>
    
    NSLog(@"%@", [[[[[NSArray rangeFrom:10 to: 21] mll_filter: ^(NSNumber *n) { 
       return n.integerValue % 2 == 0; 
    }] mll_map: ^(NSNumber *n) { 
       return [NSString stringWithFormat:@"%d", n.integerValue]; 
    }] mll_reduce: ^(NSString *l, NSString *r) { 
       return [NSString stringWithFormat:@"%@, %@", l, r];
    }] stringByAppendingString: @"."]);