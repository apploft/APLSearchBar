APLSearchBar
=========

UISearchBar subclass with extended UISearchBarDelegate protocol.

* can automatically resign first responder when search button or clear button is tapped
* asks it's delegate if the text should be cleared when clear button is tapped

![iPhone Screenshot](screenshot.png)


## Installation
Install via cocoapods by adding this to your Podfile:

	pod "APLSearchBar"

## Usage
Import header file:

	#import "APLSearchBar.h"
	
The search bar automatically resigns first responder

* when search button is tapped in case `shouldResignFirstResponderOnSearchButtonClicked` is set to YES
* when clear button is tapped in case `shouldResignFirstResponderOnClear` is set to YES

APLSearchBarDelegate extends UISearchBarDelegate with:

	- (BOOL)searchBarShouldClear:(UISearchBar *)searchBar;

