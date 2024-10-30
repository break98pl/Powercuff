#import "Powercuff.h"


@interface NSUserDefaults (Powercuff)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end
@implementation Powercuff

#pragma mark - Non-CAML approach

// Icon of your module
- (UIImage *)iconGlyph {
    return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

// Selected color of your module
- (UIColor *)selectedColor {
    return [UIColor colorWithRed:0.972 green:0.8 blue:0.274 alpha:1];
}

#pragma mark - End Non-CAML approach

// Current state of your module
- (BOOL)isSelected {
    CFPropertyListRef powerMode = CFPreferencesCopyValue(CFSTR("PowerMode"), CFSTR("com.rpetrich.powercuff"), kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
	uint64_t thermalMode = 0;
	if (powerMode) {
		if ([(__bridge id)powerMode isKindOfClass:[NSNumber class]]) {
			thermalMode = (uint64_t)[(__bridge NSNumber *)powerMode unsignedLongLongValue];
            if(thermalMode > 0){
                return YES;
            }
		}
		CFRelease(powerMode);
	}
    return NO;
}

- (void)setSelected:(BOOL)selected {
    NSString *const settingsChanged = @"com.rpetrich.powercuff.settingschanged";
    NSString *const powercuffSettingsPath = @"/var/mobile/Library/Preferences/com.rpetrich.powercuff.plist";
    if (selected) {
        [[NSUserDefaults standardUserDefaults] setObject:@3 forKey:@"PowerMode" inDomain:powercuffSettingsPath];
        [[NSUserDefaults standardUserDefaults] setObject:@NO forKey:@"RequireLowPowerMode" inDomain:powercuffSettingsPath];
        CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)settingsChanged, NULL, NULL, YES);
    } else {
        [[NSUserDefaults standardUserDefaults] setObject:@0 forKey:@"PowerMode" inDomain:powercuffSettingsPath];
        [[NSUserDefaults standardUserDefaults] setObject:@NO forKey:@"RequireLowPowerMode" inDomain:powercuffSettingsPath];
        CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)settingsChanged, NULL, NULL, YES);
    }
}

@end
