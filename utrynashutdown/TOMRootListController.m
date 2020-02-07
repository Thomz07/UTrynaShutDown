#include "TOMRootListController.h"

#import <Cephei/HBPreferences.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Preferences/PSTableCell.h>

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

@interface CustomCell : PSTableCell {
}
@end

@implementation CustomCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if (self) {
		UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(90,25,500,30)];
		[title setNumberOfLines:0];
		[title setText:@"UTrynaShutDown"];
		[title setTextColor:[UIColor whiteColor]];
		[title setFont:[UIFont systemFontOfSize:30]];

		UILabel *developers = [[UILabel alloc] initWithFrame:CGRectMake(90,55,500,20)];
		[developers setNumberOfLines:0];
		[developers setText:@"Version 1.3.2"];
		[developers setTextColor:[UIColor whiteColor]];
		[developers setFont:[UIFont systemFontOfSize:15]];

		NSBundle *bundle = [[NSBundle alloc]initWithPath:@"/Library/PreferenceBundles/UTrynaShutDown.bundle"];
		UIImage *logo = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"icon" ofType:@"png"]];
		UIImageView *icon = [[UIImageView alloc]initWithImage:logo];
		[icon setFrame:CGRectMake(20,22.5,55,55)];

		[self setBackgroundColor:[UIColor colorWithRed:1.00 green:0.37 blue:0.42 alpha:1.0]];
		[self addSubview:title];
		[self addSubview:developers];
		[self addSubview:icon];
	
	}
	return self;
}

@end

@implementation TOMRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	    NSArray *chosenLabels = @[@"textOne", @"textTwo", @"textThree"];
		self.savedSpecifiers = (!self.savedSpecifiers) ? [[NSMutableDictionary alloc] init] : self.savedSpecifiers;
		for(PSSpecifier *specifier in [self specifiers]) {
			if([chosenLabels containsObject:[specifier propertyForKey:@"key"]]) {
			[self.savedSpecifiers setObject:specifier forKey:[specifier propertyForKey:@"key"]];
			}
		}
	}

	[[UISwitch appearanceWhenContainedInInstancesOfClasses:@[[TOMRootListController class]]] setOnTintColor:[UIColor colorWithRed:1.00 green:0.37 blue:0.42 alpha:1.0]];


	return _specifiers;
}


-(void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
		[super setPreferenceValue:value specifier:specifier];

		HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.thomz.utrynashutdown"];
		BOOL titleEnabled = [preferences boolForKey:@"titleEnabled"];
		BOOL messageEnabled = [preferences boolForKey:@"messageEnabled"];
		BOOL dismissEnabled = [preferences boolForKey:@"dismissEnabled"];

		if(titleEnabled == NO){
         [self removeContiguousSpecifiers:@[self.savedSpecifiers[@"textOne"]] animated:YES];
		} else if(titleEnabled == YES && ![self containsSpecifier:self.savedSpecifiers[@"textOne"]]) {
			[self insertContiguousSpecifiers:@[self.savedSpecifiers[@"textOne"]] afterSpecifierID:@"Title Text" animated:YES];
		}

		if(messageEnabled == NO){
         [self removeContiguousSpecifiers:@[self.savedSpecifiers[@"textTwo"]] animated:YES];
		} else if(messageEnabled == YES && ![self containsSpecifier:self.savedSpecifiers[@"textTwo"]]) {
			[self insertContiguousSpecifiers:@[self.savedSpecifiers[@"textTwo"]] afterSpecifierID:@"Message Text" animated:YES];
		}

		if(dismissEnabled == NO){
         [self removeContiguousSpecifiers:@[self.savedSpecifiers[@"textThree"]] animated:YES];
		} else if(dismissEnabled == YES && ![self containsSpecifier:self.savedSpecifiers[@"textThree"]]) {
			[self insertContiguousSpecifiers:@[self.savedSpecifiers[@"textThree"]] afterSpecifierID:@"Dismiss Text" animated:YES];
		}
     

}

-(void)viewDidLoad {
		[super viewDidLoad];

		HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.thomz.utrynashutdown"];
		BOOL titleEnabled = [preferences boolForKey:@"titleEnabled"];
		BOOL messageEnabled = [preferences boolForKey:@"messageEnabled"];
		BOOL dismissEnabled = [preferences boolForKey:@"dismissEnabled"];

		if(titleEnabled == NO){
			[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"textOne"]] animated:YES];
		}
		if(messageEnabled == NO){
			[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"textTwo"]] animated:YES];
		}
		if(dismissEnabled == NO){
			[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"textThree"]] animated:YES];
		}
}


-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	/* Icon at the top */

	NSBundle *bundle = [[NSBundle alloc]initWithPath:@"/Library/PreferenceBundles/UTrynaShutDown.bundle"];

	UIImage *logo = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"icon" ofType:@"png"]];
	self.navigationItem.titleView = [[UIImageView alloc]initWithImage:logo];

	/* Respring Button */

	UIBarButtonItem *respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStylePlain target:self action:@selector(respring)];
    self.navigationItem.rightBarButtonItem = respringButton;

	

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY > 100) {
        [UIView animateWithDuration:0.2 animations:^{
         
			self.navigationItem.titleView.alpha = 0.0;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            	self.navigationItem.titleView.alpha = 1.0;
				
        }];
    }

    if (offsetY > 0) offsetY = 0;

}

-(void)respring{

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Respring" message:@"Are you sure you want to respring ?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No",nil];
	[alert show];
}


-(void)paypal{

	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://paypal.me/Thomz07"]];
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

-(void)resetPrefs:(id)sender {
	HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.thomz.utrynashutdown"];
	[preferences removeAllObjects];
	if(![self containsSpecifier:self.savedSpecifiers[@"textTwo"]]){
		[self insertContiguousSpecifiers:@[self.savedSpecifiers[@"textOne"]] afterSpecifierID:@"Title Text" animated:YES];
		[self insertContiguousSpecifiers:@[self.savedSpecifiers[@"textTwo"]] afterSpecifierID:@"Message Text" animated:YES];
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"textThree"]] animated:YES];
	}
	[self reloadSpecifiers];
}
// just some tests don't mind about this
-(void)testPrefs:(id)sender{
	HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.thomz.utrynashutdown"];
	BOOL test = [preferences boolForKey:@"titleEnabled"];
	/*id test = [preferences preferencesForIdentifier:@"com.thomz.utrynashutdown"];*/
	if(test == NO){
		[self reloadSpecifiers];
	}
}

-(PSSpecifier *)specifierForKey:(NSString *)key {
		for(PSSpecifier *specifier in [self specifiers]) {
			if([[specifier propertyForKey:@"key"] isEqualToString:key]) {
				return specifier;
			}
		}

		return nil;
	}

@end
