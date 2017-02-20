
Pod::Spec.new do |s|


  s.name         = "MLFunctionalPackage"
  s.version      = "1.0.2"
  s.summary      = "A set of map-filter-reduce tools for Objective-C"

  s.description  = <<-DESC
# MLFunctionalPackage
## A set of map-filter-reduce tools for Objective-C

Thanks to blocks Objective-C has the potential to support functional programming style. 
This library provides the basic map-filter-reduce library functions to further expand this opportunity.

## Installation
  
Use CocoaPods or copy those 2 files directly into the project. 

    pod 'MLFunctionalPackage'

## How to use it?

    #import <MLFunctionalPackage/MLFunctionalPackage.h>
    
    NSLog(@"%@", [[[[[NSArray rangeFrom:10 to: 21] mll_filter: ^(NSNumber *n) { 
       return n.integerValue % 2 == 0; 
    }] mll_map: ^(NSNumber *n) { 
       return [NSString stringWithFormat:@"%d", n.integerValue]; 
    }] mll_reduce: ^(NSString *l, NSString *r) { 
       return [NSString stringWithFormat:@"%@, %@", l, r];
    }] stringByAppendingString: @"."]);
DESC

   s.homepage     = "https://github.com/mll/MLFunctionalPackage"
   s.license   =  'MIT'
   
   s.author             = { "Marek Lipert" => "marek.lipert@gmail.com" }
   s.ios.deployment_target = '5.0'
   s.source       = { :git => "https://github.com/mll/MLFunctionalPackage.git", :tag => "1.0.2" }
   s.source_files  = '*.{h,m}'
   s.requires_arc = true

end
