%hook SBPowerDownController
-(void)orderFront {


    NSDictionary *values = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id text = (NSString *)[values valueForKey:@"textOne"];
    NSString *textFirst = [NSString stringWithFormat:@"%@",text];

    NSDictionary *valuesTwo = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id textDeux = (NSString *)[valuesTwo valueForKey:@"textTwo"];
    NSString *textSecond = [NSString stringWithFormat:@"%@",textDeux];

    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:textFirst message:textSecond delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
    persistentDomainForName:@"com.thomz.utrynashutdown"];
    

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


    NSDictionary *values = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id text = (NSString *)[values valueForKey:@"textOne"];
    NSString *textFirst = [NSString stringWithFormat:@"%@",text];

    NSDictionary *valuesTwo = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.utrynashutdown"];
    id textDeux = (NSString *)[valuesTwo valueForKey:@"textTwo"];
    NSString *textSecond = [NSString stringWithFormat:@"%@",textDeux];

    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:textFirst message:textSecond delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];

    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
    persistentDomainForName:@"com.thomz.utrynashutdown"];

    id isEnabled = [bundleDefaults valueForKey:@"isEnabled"];
    if([isEnabled isEqual:@0]){
    %orig;

} else {
    
    [alertView show];
    
}





}
%end
