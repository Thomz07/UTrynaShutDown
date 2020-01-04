@interface SBCoverSheetPresentationManager
-(bool)hasBeenDismissedSinceKeybagLock; // Using this to check when the device is on the lock screen.
+(id)sharedInstance;
@end

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

%group ios12
%hook SBPowerDownController
-(void)orderFront {

    SBCoverSheetPresentationManager *lockManager = (SBCoverSheetPresentationManager *)[%c(SBCoverSheetPresentationManager) sharedInstance];

    NSDictionary *defaults = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];

 /* Title Text */

    id textUn = (NSString *)[defaults valueForKey:@"textOne"];
    NSString *textFirst;
    textFirst = [NSString stringWithFormat:@"%@",textUn];

    id titleEnabled = [defaults valueForKey:@"titleEnabled"];

    /* Message text */

    id textDeux = (NSString *)[defaults valueForKey:@"textTwo"];
    NSString *textSecond;
    textSecond = [NSString stringWithFormat:@"%@",textDeux];

    id messageEnabled = [defaults valueForKey:@"messageEnabled"];

    /* Dismiss Text */

    id textTrois = (NSString *)[defaults valueForKey:@"textThree"];
    NSString *textThird;
    textThird = [NSString stringWithFormat:@"%@",textTrois];


    id dismissEnabled = [defaults valueForKey:@"dismissEnabled"];


    /* Texts enable */

    UIAlertView *alertView;

        if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@1]){

        alertView = [[UIAlertView alloc]initWithTitle:textFirst message:textSecond delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@0]){

        alertView = [[UIAlertView alloc]initWithTitle:textFirst message:textSecond delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@0]){

        alertView = [[UIAlertView alloc]initWithTitle:nil message:textSecond delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@0]){

        alertView = [[UIAlertView alloc]initWithTitle:textFirst message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@1]){

        alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@1]){

        alertView = [[UIAlertView alloc]initWithTitle:nil message:textSecond delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@1]){

        alertView = [[UIAlertView alloc]initWithTitle:textFirst message:nil delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else {

        alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    /* Enable switch */

    id disableEverything = [defaults valueForKey:@"showNothing"];
    id isEnabled = [defaults valueForKey:@"isEnabled"];

    if ([isEnabled isEqual:@0]) {
      %orig;
    } else if (![lockManager hasBeenDismissedSinceKeybagLock]) {
      if ([disableEverything isEqual:@0]) {
        [alertView show];
      } else {}
    } else {
      %orig;
    }
}
%end
%end


%group ios13
%hook SBPowerDownViewController

-(void)powerDownViewDidBeginSlide:(id)arg1 {

    SBCoverSheetPresentationManager *lockManager = (SBCoverSheetPresentationManager *)[%c(SBCoverSheetPresentationManager) sharedInstance];

    NSDictionary *defaults = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];

    /* Title text */


    id textUn = (NSString *)[defaults valueForKey:@"textOne"];
    NSString *textFirst;
    textFirst = [NSString stringWithFormat:@"%@",textUn];


    id titleEnabled = [defaults valueForKey:@"titleEnabled"];

    /* Message text */


    id textDeux = (NSString *)[defaults valueForKey:@"textTwo"];
    NSString *textSecond;
    textSecond = [NSString stringWithFormat:@"%@",textDeux];


    id messageEnabled = [defaults valueForKey:@"messageEnabled"];

    /* Dismiss Text */


    id textTrois = (NSString *)[defaults valueForKey:@"textThree"];
    NSString *textThird;
    textThird = [NSString stringWithFormat:@"%@",textTrois];


    id dismissEnabled = [defaults valueForKey:@"dismissEnabled"];


    /* Texts enable */

    UIAlertView *alertView;

        if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@1]){

        alertView = [[UIAlertView alloc]initWithTitle:textFirst message:textSecond delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@0]){

        alertView = [[UIAlertView alloc]initWithTitle:textFirst message:textSecond delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@0]){

        alertView = [[UIAlertView alloc]initWithTitle:nil message:textSecond delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@0]){

        alertView = [[UIAlertView alloc]initWithTitle:textFirst message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@1]){

        alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@1]){

        alertView = [[UIAlertView alloc]initWithTitle:nil message:textSecond delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@1]){

        alertView = [[UIAlertView alloc]initWithTitle:textFirst message:nil delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else {

        alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }


    /* Enable switch */

    id isEnabled = [defaults valueForKey:@"isEnabled"];
    id disableEverything = [defaults valueForKey:@"showNothing"];

    if ([isEnabled isEqual:@0]) {
      %orig;
    } else if (![lockManager hasBeenDismissedSinceKeybagLock]) {
      if ([disableEverything isEqual:@0]) {
        [alertView show];
      } else {}
    } else {
      %orig;
    }
}

%end
%end

%group SOS
%hook SBSOSClawGestureObserver

-(void)_presentSOSInterface {

    NSDictionary *defaults = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];

    /* Title text */

   id textUn = (NSString *)[defaults valueForKey:@"textOne"];
   NSString *textFirst;
   textFirst = [NSString stringWithFormat:@"%@",textUn];

   id titleEnabled = [defaults valueForKey:@"titleEnabled"];

   /* Message text */

   id textDeux = (NSString *)[defaults valueForKey:@"textTwo"];
   NSString *textSecond;
   textSecond = [NSString stringWithFormat:@"%@",textDeux];

   id messageEnabled = [defaults valueForKey:@"messageEnabled"];

   /* Dismiss Text */

   id textTrois = (NSString *)[defaults valueForKey:@"textThree"];
   NSString *textThird;
   textThird = [NSString stringWithFormat:@"%@",textTrois];


   id dismissEnabled = [defaults valueForKey:@"dismissEnabled"];


   /* Texts enable */

   UIAlertView *alertView;

       if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@1]){

       alertView = [[UIAlertView alloc]initWithTitle:textFirst message:textSecond delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

   }

   else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@0]){

       alertView = [[UIAlertView alloc]initWithTitle:textFirst message:textSecond delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

   }

   else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@0]){

       alertView = [[UIAlertView alloc]initWithTitle:nil message:textSecond delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

   }

   else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@0]){

       alertView = [[UIAlertView alloc]initWithTitle:textFirst message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

   }

   else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@1]){

       alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

   }

   else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@1]){

       alertView = [[UIAlertView alloc]initWithTitle:nil message:textSecond delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

   }

   else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@1]){

       alertView = [[UIAlertView alloc]initWithTitle:textFirst message:nil delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

   }

   else {

       alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

   }

    SBCoverSheetPresentationManager *lockManager = (SBCoverSheetPresentationManager *)[%c(SBCoverSheetPresentationManager) sharedInstance];

    id emergencyAlert = [defaults valueForKey:@"emergencyAlert"];
    id disableEverything = [defaults valueForKey:@"showNothing"];
    id isEnabled = [defaults valueForKey:@"isEnabled"];

    if ([isEnabled isEqual:@0]) {
      %orig;
    } else if (![lockManager hasBeenDismissedSinceKeybagLock] && [emergencyAlert isEqual:@1]) {
      if ([disableEverything isEqual:@0]) {
        [alertView show];
      } else {}
    } else {
      %orig;
    }
}
%end


%hook SOSManager
+(BOOL)shouldTriggerSOS {

    SBCoverSheetPresentationManager *lockManager = (SBCoverSheetPresentationManager *)[%c(SBCoverSheetPresentationManager) sharedInstance];

    id emergencyAlert = [defaults valueForKey:@"emergencyAlert"];
    id isEnabled = [defaults valueForKey:@"isEnabled"];

    if (![lockManager hasBeenDismissedSinceKeybagLock] && [emergencyAlert isEqual:@1] && [isEnabled isEqual:@1]) {
      return NO;
    } else {
      return %orig;
    }
}
%end
%end


%ctor {

    %init(SOS);

    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"13")){
        %init(ios13);


    } else {
        %init(ios12);

    }

}



