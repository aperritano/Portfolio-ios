#import "LauncherViewTestController.h"

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation LauncherViewTestController

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) ) {
    self.title = @"Anthony Perritano";
  }
  return self;
}

- (void)dealloc {
  [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// UIViewController

- (void)loadView {
  [super loadView];

  _launcherView = [[TTLauncherView alloc] initWithFrame:self.view.bounds];
  _launcherView.backgroundColor = [UIColor whiteColor];
  _launcherView.delegate = self;
  _launcherView.columnCount = 2;
  _launcherView.pages = [NSArray arrayWithObjects:
    [NSArray arrayWithObjects:
      [[[TTLauncherItem alloc] initWithTitle:@"Web"
                               image:@"bundle://Icon.png"
                               URL:@"tt://image" canDelete:NO] autorelease],
      [[[TTLauncherItem alloc] initWithTitle:@"Info"
                               image:@"bundle://Icon.png"
                               URL:nil canDelete:NO] autorelease],
//      [[[TTLauncherItem alloc] initWithTitle:@"Button 3"
//                               image:@"bundle://Icon.png"
//                               URL:@"fb://item3" canDelete:YES] autorelease],
//      [[[TTLauncherItem alloc] initWithTitle:@"Button 4"
//                               image:@"bundle://Icon.png"
//                               URL:@"fb://item4" canDelete:YES] autorelease],
//      [[[TTLauncherItem alloc] initWithTitle:@"Button 5"
//                               image:@"bundle://Icon.png"
//                               URL:@"fb://item5" canDelete:YES] autorelease],
//      [[[TTLauncherItem alloc] initWithTitle:@"Button 6"
//                               image:@"bundle://Icon.png"
//                               URL:@"fb://item6" canDelete:YES] autorelease],
//      [[[TTLauncherItem alloc] initWithTitle:@"Button 7"
//                               image:@"bundle://Icon.png"
//                               URL:@"fb://item7" canDelete:YES] autorelease],
      nil],
      nil
    ];
  [self.view addSubview:_launcherView];

//  TTLauncherItem* item = [_launcherView itemWithURL:@"fb://item3"];
//  item.badgeNumber = 4;
//  
//  item = [_launcherView itemWithURL:@"fb://item4"];
//  item.badgeNumber = 0;
//
//  item = [_launcherView itemWithURL:@"fb://item5"];
//  item.badgeValue = @"100!";
//
//  item = [_launcherView itemWithURL:@"fb://item6"];
//  item.badgeValue = @"Off";
//
//  item = [_launcherView itemWithURL:@"fb://item7"];
//  item.badgeNumber = 300;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTLauncherViewDelegate

- (void)launcherView:(TTLauncherView*)launcher didSelectItem:(TTLauncherItem*)item {
	[[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:item.URL]];
}

- (void)launcherViewDidBeginEditing:(TTLauncherView*)launcher {
  [self.navigationItem setRightBarButtonItem:[[[UIBarButtonItem alloc]
    initWithBarButtonSystemItem:UIBarButtonSystemItemDone
    target:_launcherView action:@selector(endEditing)] autorelease] animated:YES];
}

- (void)launcherViewDidEndEditing:(TTLauncherView*)launcher {
  [self.navigationItem setRightBarButtonItem:nil animated:YES];
}

@end
