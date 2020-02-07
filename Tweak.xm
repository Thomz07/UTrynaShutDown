/* UTrynaShutDown by Thomz and ExoticSwingset */

#include <Cephei/HBPreferences.h>

@interface SBCoverSheetPresentationManager
-(bool)hasBeenDismissedSinceKeybagLock;
+(id)sharedInstance;
@end

        HBPreferences *preferences;
        BOOL isEnabled;
        BOOL showNothing;
        BOOL titleEnabled;
        BOOL messageEnabled;
        BOOL dismissEnabled;
        BOOL emergencyAlert;
        NSString *textOne;
        NSString *textTwo;
        NSString *textThree;

        #define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
        #define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
        #define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
        #define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
        #define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

    void prefs(){

        preferences = [[HBPreferences alloc] initWithIdentifier:@"com.thomz.utrynashutdown"];
        [preferences registerDefaults:@{
            @"isEnabled": @YES,
            @"showNothing": @NO,
            @"titleEnabled":@YES,
            @"messageEnabled":@YES,
            @"dismissEnabled":@NO,
            @"emergencyAlert":@NO,
            @"textOne": @"",
            @"textTwo": @"",
            @"textThree": @""
        }];

        [preferences registerBool:&isEnabled default:YES forKey:@"isEnabled"];
        [preferences registerBool:&showNothing default:NO forKey:@"showNothing"];
        [preferences registerBool:&titleEnabled default:YES forKey:@"titleEnabled"];
        [preferences registerBool:&messageEnabled default:YES forKey:@"messageEnabled"];
        [preferences registerBool:&dismissEnabled default:NO forKey:@"dismissEnabled"];
        [preferences registerBool:&emergencyAlert default:YES forKey:@"emergencyAlert"];
        [preferences registerObject:&textOne default:@"Hello" forKey:@"textOne"];
        [preferences registerObject:&textTwo default:@"Thank you for downloading UTrynaShutDown" forKey:@"textTwo"];
        [preferences registerObject:&textThree default:@"Dismiss" forKey:@"textThree"];

    }



%group ios12
%hook SBPowerDownController
-(void)orderFront {

    prefs();

    if(isEnabled){

    UIAlertView *alertView;

    if(titleEnabled && messageEnabled && dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:textOne message:textTwo delegate:self cancelButtonTitle:textThree otherButtonTitles:nil];
    }

    else if(titleEnabled && messageEnabled && !dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:textOne message:textTwo delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    }

    else if(!titleEnabled && messageEnabled && !dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:nil message:textTwo delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    }

    else if(titleEnabled && !messageEnabled && !dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:textOne message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    }

    else if(!titleEnabled && !messageEnabled && dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:textThree otherButtonTitles:nil];
    }

    else if(!titleEnabled && messageEnabled && dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:nil message:textTwo delegate:self cancelButtonTitle:textThree otherButtonTitles:nil];
    }

    else if(titleEnabled && !messageEnabled && dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:textOne message:nil delegate:self cancelButtonTitle:textThree otherButtonTitles:nil];
    }

    else if(!titleEnabled && !messageEnabled && !dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    }  

    if(showNothing){

    } else {
        [alertView show];
    }
    
    } else {
        %orig;
    }
    
}
%end
%end


%group ios13
%hook SBPowerDownViewController

-(void)viewWillAppear:(BOOL)arg1 {

    prefs();

    if(isEnabled){

    UIAlertView *alertView;

    if(titleEnabled && messageEnabled && dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:textOne message:textTwo delegate:self cancelButtonTitle:textThree otherButtonTitles:nil];
    }

    else if(titleEnabled && messageEnabled && !dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:textOne message:textTwo delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    }

    else if(!titleEnabled && messageEnabled && !dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:nil message:textTwo delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    }

    else if(titleEnabled && !messageEnabled && !dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:textOne message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    }

    else if(!titleEnabled && !messageEnabled && dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:textThree otherButtonTitles:nil];
    }

    else if(!titleEnabled && messageEnabled && dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:nil message:textTwo delegate:self cancelButtonTitle:textThree otherButtonTitles:nil];
    }

    else if(titleEnabled && !messageEnabled && dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:textOne message:nil delegate:self cancelButtonTitle:textThree otherButtonTitles:nil];
    }

    else if(!titleEnabled && !messageEnabled && !dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    }  

    if(showNothing){
        %orig(NO);
    } else {
        %orig(NO);
        [alertView show];
    }
    
    } else {
        %orig(YES);
    }

}
%end 
%end

%group SOS
%hook SBSOSClawGestureObserver

-(void)_presentSOSInterface {

    prefs();

    if(isEnabled){

    UIAlertView *alertView;

    if(titleEnabled && messageEnabled && dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:textOne message:textTwo delegate:self cancelButtonTitle:textThree otherButtonTitles:nil];
    }

    else if(titleEnabled && messageEnabled && !dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:textOne message:textTwo delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    }

    else if(!titleEnabled && messageEnabled && !dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:nil message:textTwo delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    }

    else if(titleEnabled && !messageEnabled && !dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:textOne message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    }

    else if(!titleEnabled && !messageEnabled && dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:textThree otherButtonTitles:nil];
    }

    else if(!titleEnabled && messageEnabled && dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:nil message:textTwo delegate:self cancelButtonTitle:textThree otherButtonTitles:nil];
    }

    else if(titleEnabled && !messageEnabled && dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:textOne message:nil delegate:self cancelButtonTitle:textThree otherButtonTitles:nil];
    }

    else if(!titleEnabled && !messageEnabled && !dismissEnabled){
        alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    }

    SBCoverSheetPresentationManager *lockManager = (SBCoverSheetPresentationManager *)[%c(SBCoverSheetPresentationManager) sharedInstance];

    if (showNothing){

    } else {

    if(emergencyAlert && ![lockManager hasBeenDismissedSinceKeybagLock]){
     
    } else {
        [alertView show];   
            }
        }  
    }
}

%end


%hook SOSManager
+(BOOL)shouldTriggerSOS {

    prefs();

    if(isEnabled){

    SBCoverSheetPresentationManager *lockManager = (SBCoverSheetPresentationManager *)[%c(SBCoverSheetPresentationManager) sharedInstance];

    if (showNothing){
        return NO;
    } else {

    if(emergencyAlert && ![lockManager hasBeenDismissedSinceKeybagLock]){
        return NO;
    } else {
        return %orig;   
    }
    } 
    } else {

        return %orig;
    }
}

%end
%end 



%ctor {

    prefs();

    %init(SOS);

    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"13")){
        %init(ios13);     
    } else {
        %init(ios12);   
    }

    
}