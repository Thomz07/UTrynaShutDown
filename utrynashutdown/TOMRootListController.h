#import <Preferences/PSListController.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBRespringController.h>
#import <Cephei/HBPreferences.h>

@interface TOMRootListController : HBRootListController 
@property (nonatomic, retain) NSMutableDictionary *savedSpecifiers;
@end

@interface TOMRootViewController : UIViewController<UIAlertViewDelegate> 
@end

@interface PSListController (iOS12Plus)
-(BOOL)containsSpecifier:(id)arg1;
@end





