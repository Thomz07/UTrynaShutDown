%hook SBPowerDownController
-(void)orderFront {

	/* Title text */

    NSDictionary *valuesOne = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id textUn = (NSString *)[valuesOne valueForKey:@"textOne"];
    NSString *textFirst = [NSString stringWithFormat:@"%@",textUn];

    NSDictionary *titleEnable = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id titleEnabled = [titleEnable valueForKey:@"titleEnabled"];

    /* Message text */

    NSDictionary *valuesTwo = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id textDeux = (NSString *)[valuesTwo valueForKey:@"textTwo"];
    NSString *textSecond = [NSString stringWithFormat:@"%@",textDeux];

    NSDictionary *messageEnable = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id messageEnabled = [messageEnable valueForKey:@"messageEnabled"];

    /* Dismiss Text */

    NSDictionary *valuesThree = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id textTrois = (NSString *)[valuesTwo valueForKey:@"textThree"];
    NSString *textThird = [NSString stringWithFormat:@"%@",textTrois];

    NSDictionary *dismissEnable = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id dismissEnabled = [dismissEnable valueForKey:@"dismissEnabled"];


    /* Texts enable */


    if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@1]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:textFirst message:textSecond delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@0]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:textFirst message:textSecond delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@0]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:textSecond delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@0]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:textOne message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@1]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@1]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:textSecond delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@1]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:textFirst message:nil delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else {

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }


    /* Enable switch */

    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];

    id isEnabled = [bundleDefaults valueForKey:@"isEnabled"];
    if([isEnabled isEqual:@0]){
    %orig;

} else {
    [alertView show];   
}

}
%end

%hook SBPowerDownViewController
-(void)powerDownViewDidBeginSlide:(id)arg1 {
	/* Title text */

    NSDictionary *valuesOne = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id textUn = (NSString *)[valuesOne valueForKey:@"textOne"];
    NSString *textFirst = [NSString stringWithFormat:@"%@",textUn];

    NSDictionary *titleEnable = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id titleEnabled = [titleEnable valueForKey:@"titleEnabled"];

    /* Message text */

    NSDictionary *valuesTwo = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id textDeux = (NSString *)[valuesTwo valueForKey:@"textTwo"];
    NSString *textSecond = [NSString stringWithFormat:@"%@",textDeux];

    NSDictionary *messageEnable = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id messageEnabled = [messageEnable valueForKey:@"messageEnabled"];

    /* Dismiss Text */

    NSDictionary *valuesThree = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id textTrois = (NSString *)[valuesTwo valueForKey:@"textThree"];
    NSString *textThird = [NSString stringWithFormat:@"%@",textTrois];

    NSDictionary *dismissEnable = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id dismissEnabled = [dismissEnable valueForKey:@"dismissEnabled"];


    /* Texts enable */


    if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@1]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:textFirst message:textSecond delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@0]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:textFirst message:textSecond delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@0]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:textSecond delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@0]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:textOne message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@1]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@0] && [messageEnabled isEqual:@1] && [dismissEnabled isEqual:@1]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:textSecond delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else if([titleEnabled isEqual:@1] && [messageEnabled isEqual:@0] && [dismissEnabled isEqual:@1]){

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:textFirst message:nil delegate:self cancelButtonTitle:textThird otherButtonTitles:nil];

    }

    else {

    	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    }


    /* Enable switch */

    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];

    id isEnabled = [bundleDefaults valueForKey:@"isEnabled"];
    if([isEnabled isEqual:@0]){
    %orig;

} else {
    [alertView show];   
}

}
%end
