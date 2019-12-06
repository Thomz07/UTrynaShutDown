@interface NSTask : NSObject
@property(copy) NSArray *arguments;
@property(copy) NSString *currentDirectoryPath;
@property(copy) NSDictionary *environment;
@property(copy) NSString *launchPath;
@property(readonly) int processIdentifier;
@property long long qualityOfService;
@property(getter=isRunning, readonly) bool running;
@property(retain) id standardError;
@property(retain) id standardInput;
@property(retain) id standardOutput;
@property(copy) id /* block */ terminationHandler;
@property(readonly) long long terminationReason;
@property(readonly) int terminationStatus;

+ (id)currentTaskDictionary;
+ (id)launchedTaskWithDictionary:(id)arg1;
+ (id)launchedTaskWithLaunchPath:(id)arg1 arguments:(id)arg2;

- (id)init;
- (void)interrupt;
- (bool)isRunning;
- (void)launch;
- (int)processIdentifier;
- (long long)qualityOfService;
- (bool)resume;
- (bool)suspend;
- (long long)suspendCount;
- (void)terminate;
- (id /* block */)terminationHandler;
- (long long)terminationReason;
- (int)terminationStatus;
@end



#include "TOMRootListController.h"

@implementation TOMRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)respring{

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Respring" message:@"Are you sure you want to respring ?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No",nil];
	[alert show];
}

     -(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
	NSTask *t = [[NSTask alloc] init];
	[t setLaunchPath:@"/usr/bin/killall"];
	[t setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
	[t launch];
    }
    if (buttonIndex == 1)
    {
        
    }
}
    
    




@end
