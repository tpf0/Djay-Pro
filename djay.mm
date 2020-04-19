#import <UIKit.h>
#import <substarte.h>

// Enable Pro version for Djay App
// com.algoriddim.djay-iphone-free
// UIAlert to show if the installation success or no!


%hook AppDelegate

- (void)applicationDidBecomeActive:(id)application {
    NSUserDefaults *validate = [NSUserDefaults standardUserDefaults];
    NSString *alreadyRun = @"already_run";
    if ([validate boolForKey:alreadyRun])
    return;
    [validate setBool:YES forKey:alreadyRun];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"DJay"
    message:@"Sucessfully Activated!!!" delegate:nil cancelButtonTitle:@"Thanks!"
    otherButtonTitles:nil];
    [alert show];
}

%end


// Djay Pro start here

%hook ARLegacyUnlockUIModel
-(bool)hasUnlocked {
  return YES;
}
}

-(void)setHasUnlocked:(bool)arg1 {
  arg1 = YES;
  %orig(arg1);
}
}

-(bool)actionsEnabled {
  return YES;
}
}

-(void)setActionsEnabled:(bool)arg1 {
  arg1 = YES;
  %orig(arg1);
}
%end

%hook DJTLicenseManager
-(bool)userIsEligibleForLegacy {
  return YES;
}
}

-(bool)userHasLegacyUnlocked {
  return YES;
}
}

-(bool)hasSubscription {
  return YES;
}
}

-(void)setHasSubscription:(bool)arg1 {
  arg1 = YES;
  %orig(arg1);
}
%end

%hook AppFeatures
-(void)setHasSubscription:(bool)arg1 {
  arg1 = YES;
  %orig(arg1);
%end

%hook ARSubscriptionUpsellUIModel
-(bool)hasSubscription {
  return YES;
}
%end
