#import "UserAccountPlugin.h"
#if __has_include(<user_account/user_account-Swift.h>)
#import <user_account/user_account-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "user_account-Swift.h"
#endif

@implementation UserAccountPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUserAccountPlugin registerWithRegistrar:registrar];
}
@end
