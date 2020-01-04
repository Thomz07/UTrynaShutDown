/* UTrynaShutDown by Thomz and ExoticSwingset */

@interface SBCoverSheetPresentationManager
-(bool)hasBeenDismissedSinceKeybagLock;
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

    id disableEverything = [defaults valueForKey:@"showNothing"];
    id isEnabled = [defaults valueForKey:@"isEnabled"];

    if([disableEverything isEqual:@0]){
    if([isEnabled isEqual:@0]){
    
    %orig;

    } else {

        [alertView show]; 

    }} else {

  }
}
%end
%end


%group ios13
%hook SBPowerDownViewController

-(void)powerDownViewDidBeginSlide:(id)arg1 {

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

    id showNothing = [defaults valueForKey:@"showNothing"];
    id isEnabled = [defaults valueForKey:@"isEnabled"];

    if([showNothing isEqual:@1]){

    } else {

    if([isEnabled isEqual:@0]){
    
    %orig;

    } else {

    [alertView show];  

    }
  }
}

%end 
%end

%group SOS
%hook SBSOSClawGestureObserver

-(void)_presentSOSInterface {

    NSDictionary *defaults = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];

    SBCoverSheetPresentationManager *lockManager = (SBCoverSheetPresentationManager *)[%c(SBCoverSheetPresentationManager) sharedInstance];

    id emergencyAlert = [defaults valueForKey:@"emergencyAlert"];
    id disableEverything = [defaults valueForKey:@"showNothing"];

    if ([disableEverything isEqual:@1]){

    } else {

    if([emergencyAlert isEqual:@1] && ![lockManager hasBeenDismissedSinceKeybagLock]){
     
    } else {
        %orig;   
    }
  }  
}
%end


%hook SOSManager
+(BOOL)shouldTriggerSOS {

    NSDictionary *defaults = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];

    SBCoverSheetPresentationManager *lockManager = (SBCoverSheetPresentationManager *)[%c(SBCoverSheetPresentationManager) sharedInstance];
    
    id emergencyAlert = [defaults valueForKey:@"emergencyAlert"];
    id disableEverything = [defaults valueForKey:@"showNothing"];

    if([disableEverything isEqual:@1]){
        return NO;
    } else {

    if([emergencyAlert isEqual:@1] && ![lockManager hasBeenDismissedSinceKeybagLock]) {  
        return NO;      
    } else {
        return %orig;  
    }
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