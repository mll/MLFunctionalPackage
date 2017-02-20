//
//  MLFunctionalPackage.h
//
//  Created by Marek Lipert on 24.04.2014.
//  Copyright (c) 2014 Marek Lipert. All rights reserved.
//

@interface NSDictionary (MLFunctionalPackage)
/** Maps key-value pairs into a new dictionary of key-mapperBlock(val). 
    If the mapper returns nil, the key-value pair is not included in the resulting dictionary. */
- (NSDictionary *) mll_map: (id (^)(id key, id arg)) mapperBlock;
/** Filters the dictionary using filterBlock */
- (NSDictionary *) mll_filter: (BOOL (^)(id key, id arg)) filterBlock;
/** A handy helper that allows to combine two dictionaries. 
    It is not namespaced as it serves as a support for standard library methods */ 
- (NSDictionary *) dictionaryByAddingKeysAndValuesFromDictionary: (NSDictionary *)source;
@end

@interface NSSet (MLFunctionalPackage)
/** A -> #{mapperBlock(a) for all a in A} 
    If the mapper block returns nil, the element is omitted */
- (NSSet *) mll_map: (id (^)(id arg)) mapperBlock;
/** Filters the set */
- (NSSet *) mll_filter: (BOOL (^)(id arg)) filterBlock;
@end

@interface NSOrderedSet (MLFunctionalPackage)
/** A -> #{mapperBlock(a) for all a in A} 
    If the mapper block returns nil, the element is omitted */
- (NSOrderedSet *) mll_map: (id (^)(id arg)) mapperBlock;
/** Filters the set */
- (NSOrderedSet *) mll_filter: (BOOL (^)(id arg)) filterBlock;
/** Reduces the ordered set. 

    If the initialElement is provided, it is used as a basis of reduction. 
    The reduction progresses left-associative, #{a, b, c} -> ((initialElement * a) * b) * c
    In this case the set is empty, initialElement is returned. 
    
    If the initialElement is not used, the following rules apply:
       1) If the set is empty, nil is returned
       2) If the set has only one element, that element is returned
       3) Otherwise, the left-associative reduction is applied: #{a, b, c} -> ((a * b) * c) */

- (id) mll_reduce: (id(^)(id arg1, id arg2)) reduceBlock;
- (id) mll_reduce: (id(^)(id arg1, id arg2)) reduceBlock initialElement: (id) initialElement;
@end

@interface NSArray (MLFunctionalPackage)
/** A -> @[mapperBlock(a) for all a in A] 
    If the mapper block returns nil, the element is omitted */
- (NSArray *) mll_map: (id (^)(id arg)) mapperBlock;
/** Filters the array */
- (NSArray *) mll_filter: (BOOL (^)(id arg)) filterBlock;
/** Reduces the array. 

    If the initialElement is provided, it is used as a basis of reduction. 
    The reduction progresses left-associative, @[a, b, c] -> ((initialElement * a) * b) * c
    In this case the array is empty, initialElement is returned. 
    
    If the initialElement is not used, the following rules apply:
       1) If the array is empty, nil is returned
       2) If the array has only one element, that element is returned
       3) Otherwise, the left-associative reduction is applied: @[a, b, c] -> ((a * b) * c) */

- (id) mll_reduce: (id(^)(id arg1, id arg2)) reduceBlock;
- (id) mll_reduce: (id(^)(id arg1, id arg2)) reduceBlock initialElement: (id) initialElement;

/** A non-namespaced function to supplement the standard library */

/** Creates an array of NSNumbers. E.g. [NSArray rangeFrom:3 to: 6] -> @[@3, @4, @5] */ 
+ (NSArray *) rangeFrom: (NSInteger) from to: (NSInteger) to;

@end


