#import <UIKit/UIKit.h>

@protocol APLSearchBarDelegate <UISearchBarDelegate>

@optional
/** Asks the delegate if the specified search bar's text should be cleared. */
- (BOOL)searchBarShouldClear:(UISearchBar *)searchBar;

@end

@interface APLSearchBar : UISearchBar

/** The search bar’s delegate object. */
@property(nonatomic, assign) id<APLSearchBarDelegate> delegate;

/** A Boolean value that indicates whether the search bar should resign first responder and dismiss the keyboard if displayed when the search bar's clear button is tapped. Default is NO. */
@property(nonatomic) BOOL shouldResignFirstResponderOnClear;

/** A Boolean value that indicates whether the search bar should resign first responder and dismiss the keyboard if displayed when the search button is tapped. Default is NO. */
@property(nonatomic) BOOL shouldResignFirstResponderOnSearchButtonClicked;

@end
