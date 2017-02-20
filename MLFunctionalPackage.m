//
//  MLFunctionalPackage.m
//  
//  Created by Marek Lipert on 24.04.2014.
//  Copyright (c) 2014 Marek Lipert. All rights reserved.
//

#import "MLFunctionalPackage.h"

@implementation NSDictionary (MLFunctionalPackage)

- (NSDictionary *) dictionaryByAddingKeysAndValuesFromDictionary: (NSDictionary *)source {
    NSMutableDictionary *d = [NSMutableDictionary dictionaryWithDictionary:self];
    [d addEntriesFromDictionary:source];
    return d;
}

- (NSDictionary *) mll_map: (id (^)(id key, id arg)) mapperBlock {
    NSMutableDictionary *retVal = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    for (id key in self) {
        id obj = self[key];
        id m = mapperBlock(key, obj);
        if(m) [retVal setObject:m forKey:key];
    }
    
    return retVal;
}

- (NSDictionary *) mll_filter: (BOOL (^)(id key, id arg)) filterBlock {
    NSMutableDictionary *retVal = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    for (id key in self) {
        id obj = self[key];
        BOOL filteredIn = filterBlock(key, obj);
        if(filteredIn) [retVal setObject:obj forKey:key];
    }
    
    return retVal;
}

@end

@implementation NSSet (MLFunctionalPackage)

- (NSSet *) mll_map: (id (^)(id arg)) mapperBlock {
    NSMutableSet *retVal = [NSMutableSet setWithCapacity:self.count];
    
    for (id obj in self) {
        id mapped = mapperBlock(obj);
        if(mapped) [retVal addObject:mapped];
    }
    
    return retVal;
}

- (NSSet *) mll_filter: (BOOL (^)(id arg)) filterBlock {
    NSMutableSet *retVal = [NSMutableSet setWithCapacity:self.count];
    
    for (id obj in self) {
        BOOL filteredIn = filterBlock(obj);
        if(filteredIn) [retVal addObject:obj];
    }
    
    return retVal;
}

@end

@implementation NSOrderedSet (MLFunctionalPackage)

- (NSOrderedSet *) mll_map: (id (^)(id arg)) mapperBlock {
    NSMutableOrderedSet *retVal = [NSMutableOrderedSet orderedSetWithCapacity:self.count];
    
    for (id obj in self) {
        id mapped = mapperBlock(obj);
        if(mapped) [retVal addObject:mapped];
    }
    
    return retVal;

}

- (NSOrderedSet *) mll_filter: (BOOL (^)(id arg)) filterBlock {
    NSMutableOrderedSet *retVal = [NSMutableOrderedSet orderedSetWithCapacity:self.count];
    
    for (id obj in self) {
        BOOL filteredIn = filterBlock(obj);
        if(filteredIn) [retVal addObject:obj];
    }
    
    return retVal;
}

- (id) mll_reduce: (id(^)(id arg1, id arg2)) reduceBlock {
    NSParameterAssert(reduceBlock);
    
    if(self.count == 0) return nil;
    if(self.count == 1) return self[0];
    id cumulative = self[0];
    for(int i=1; i < self.count; i++) cumulative = reduceBlock(cumulative, self[i]);
    return cumulative;
}

- (id) mll_reduce: (id(^)(id arg1, id arg2)) reduceBlock initialElement: (id) initialElement {
    NSParameterAssert(reduceBlock);
    NSParameterAssert(initialElement);
    
    id cumulative = initialElement;
    for(int i=0; i < self.count; i++) cumulative = reduceBlock(cumulative, self[i]);
    return cumulative;
}


@end

@implementation NSArray(MLFunctionalPackage)

- (NSArray *) mll_map: (id (^)(id arg)) mapperBlock {
    NSMutableArray *retVal = [NSMutableArray arrayWithCapacity: self.count];
    
    for (id obj in self) {
        id mapped = mapperBlock(obj);
        if(mapped) [retVal addObject:mapped];
    }
    
    return retVal;
}

- (NSArray *) mll_filter: (BOOL (^)(id arg)) filterBlock {
    NSMutableArray *retVal = [NSMutableArray arrayWithCapacity: self.count];
    
    for (id obj in self) {
        BOOL filteredIn = filterBlock(obj);
        if(filteredIn) [retVal addObject:obj];
    }
    
    return retVal;
}

- (id) mll_reduce: (id(^)(id arg1, id arg2)) reduceBlock {
    NSParameterAssert(reduceBlock);

    if(self.count == 0) return nil;
    if(self.count == 1) return self[0];
    id cumulative = self[0];
    for(int i=1; i < self.count; i++) cumulative = reduceBlock(cumulative, self[i]);
    return cumulative;
}

- (id) mll_reduce: (id(^)(id arg1, id arg2)) reduceBlock initialElement: (id) initialElement {
    NSParameterAssert(reduceBlock);
    NSParameterAssert(initialElement);
    if (self.count == 0) return reduceBlock(nil,nil);
    id cumulative = initialElement;
    for(int i=0; i < self.count; i++) cumulative = reduceBlock(cumulative, self[i]);
    return cumulative;
}

+ (NSArray *) rangeFrom: (NSInteger) from to: (NSInteger) to {
    NSMutableArray *retVal = [NSMutableArray arrayWithCapacity: to - from];
    for(NSInteger i = from; i < to; i++) [retVal addObject:@(i)];
    return retVal;
}

@end




