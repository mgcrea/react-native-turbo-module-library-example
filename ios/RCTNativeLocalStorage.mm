//  RCTNativeLocalStorage.m
//  TurboModuleExample

#import "RCTNativeLocalStorage.h"

#import "generated/NativeLocalStorageSpec/NativeLocalStorageSpec.h"

#import "NativeLocalStorage-Swift.h"

static NSString *const RCTNativeLocalStorageKey = @"local-storage";

@interface RCTNativeLocalStorage ()
@property(strong, nonatomic) NSUserDefaults *localStorage;
@end

@implementation RCTNativeLocalStorage {
  NativeLocalStorage *_swiftLocalStorage;
}

RCT_EXPORT_MODULE(NativeLocalStorageModule)

- (id)init {
  if (self = [super init]) {
    _swiftLocalStorage = [NativeLocalStorage new];
  }
  return self;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params {
  return std::make_shared<facebook::react::NativeLocalStorageSpecJSI>(params);
}

- (NSString *_Nullable)getItem:(NSString *)key {
  return [_swiftLocalStorage getItem:key];
}

- (void)setItem:(NSString *)value key:(NSString *)key {
  [_swiftLocalStorage setItem:value key:key];
}

- (void)removeItem:(NSString *)key {
  [_swiftLocalStorage removeItem:key];
}

- (void)clear {
  [_swiftLocalStorage clear];
}

@end
