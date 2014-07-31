#import "APLSearchBar.h"

@interface APLSearchBar () <APLSearchBarDelegate>

@property (nonatomic) BOOL shouldBeginEditing;
@property(nonatomic, assign) id<APLSearchBarDelegate> realDelegate;

@end

@implementation APLSearchBar

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit {
    self.shouldBeginEditing = YES;
    [super setDelegate:self];
}

#pragma mark - getter & setter

- (void)setDelegate:(id<APLSearchBarDelegate>)delegate {
    self.realDelegate = delegate;
}

- (id<APLSearchBarDelegate>)delegate {
    return self.realDelegate;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return [self searchBarShouldClear:self];
}

#pragma mark - APLSearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (self.shouldResignFirstResponderOnClear && ![searchBar isFirstResponder]) {
        self.shouldBeginEditing = NO;
    }
    if ([self.realDelegate respondsToSelector:@selector(searchBar:textDidChange:)]) {
        [self.realDelegate searchBar:searchBar textDidChange:searchText];
    }
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return [self.realDelegate respondsToSelector:@selector(searchBar:shouldChangeTextInRange:replacementText:)] ? [self.realDelegate searchBar:searchBar shouldChangeTextInRange:range replacementText:text] : YES;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    if (self.shouldResignFirstResponderOnClear && !self.shouldBeginEditing) {
        self.shouldBeginEditing = YES;
        return NO;
    }
    return [self.realDelegate respondsToSelector:@selector(searchBarShouldBeginEditing:)] ? [self.realDelegate searchBarShouldBeginEditing:searchBar] : YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    if ([self.realDelegate respondsToSelector:@selector(searchBarTextDidBeginEditing:)]) {
        [self.realDelegate searchBarTextDidBeginEditing:searchBar];
    }
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    return [self.realDelegate respondsToSelector:@selector(searchBarShouldEndEditing:)] ? [self.realDelegate searchBarShouldEndEditing:searchBar] : YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    if ([self.realDelegate respondsToSelector:@selector(searchBarTextDidEndEditing:)]) {
        [self.realDelegate searchBarTextDidEndEditing:searchBar];
    }
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar {
    if ([self.realDelegate respondsToSelector:@selector(searchBarBookmarkButtonClicked:)]) {
        [self.realDelegate searchBarBookmarkButtonClicked:searchBar];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    if ([self.realDelegate respondsToSelector:@selector(searchBarCancelButtonClicked:)]) {
        [self.realDelegate searchBarCancelButtonClicked:searchBar];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (self.shouldResignFirstResponderOnSearchButtonClicked) {
        [searchBar resignFirstResponder];
    }
    if ([self.realDelegate respondsToSelector:@selector(searchBarSearchButtonClicked:)]) {
        [self.realDelegate searchBarSearchButtonClicked:searchBar];
    }
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar {
    if ([self.realDelegate respondsToSelector:@selector(searchBarResultsListButtonClicked:)]) {
        [self.realDelegate searchBarResultsListButtonClicked:searchBar];
    }
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    if ([self.realDelegate respondsToSelector:@selector(searchBar:selectedScopeButtonIndexDidChange:)]) {
        [self.realDelegate searchBar:searchBar selectedScopeButtonIndexDidChange:selectedScope];
    }
}

- (BOOL)searchBarShouldClear:(UISearchBar *)searchBar {
    if (self.shouldResignFirstResponderOnClear) {
        [searchBar resignFirstResponder];
    }
    return [self.realDelegate respondsToSelector:@selector(searchBarShouldClear:)] ? [self.realDelegate searchBarShouldClear:searchBar] : YES;
}

@end
