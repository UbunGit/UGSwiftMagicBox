#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "TABAnimationMethod.h"
#import "TABComponentLayer.h"
#import "TABLayer.h"
#import "NSArray+TABAnimated.h"
#import "TABManagerMethod.h"
#import "UICollectionView+TABAnimated.h"
#import "UICollectionViewCell+TABLayoutSubviews.h"
#import "UITableView+TABAnimated.h"
#import "UITableViewCell+TABLayoutSubviews.h"
#import "UIView+TABAnimated.h"
#import "UIView+TABControlAnimation.h"
#import "UIView+TABLayoutSubviews.h"
#import "TABCollectionAnimated.h"
#import "TABTableAnimated.h"
#import "TABViewAnimated.h"
#import "TABAnimated.h"

FOUNDATION_EXPORT double TABAnimatedVersionNumber;
FOUNDATION_EXPORT const unsigned char TABAnimatedVersionString[];

