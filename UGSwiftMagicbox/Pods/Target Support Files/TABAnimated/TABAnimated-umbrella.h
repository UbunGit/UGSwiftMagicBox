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
#import "TABAnimatedCacheManager.h"
#import "TABAnimatedCacheModel.h"
#import "TABAnimatedDocumentMethod.h"
#import "UIView+TABAnimated.h"
#import "UIView+TABControlAnimation.h"
#import "NSArray+TABAnimated.h"
#import "TABBaseComponent.h"
#import "TABComponentLayer.h"
#import "TABComponentManager.h"
#import "TableDeDaSelfModel.h"
#import "TABManagerMethod.h"
#import "TABSentryView.h"
#import "TABCollectionAnimated.h"
#import "TABTableAnimated.h"
#import "TABViewAnimated.h"
#import "TABAnimated.h"
#import "TABPopBgView.h"
#import "TABPopViewController.h"
#import "TABPreviewViewController.h"
#import "TABRevealViewController.h"
#import "TABAnimatedBall.h"
#import "TABRevealFlowBall.h"
#import "TABRevealHomeWindow.h"
#import "TABRevealChainManager.h"
#import "TABRevealChainModel.h"
#import "TABRevealModel.h"
#import "TABButtonProtocol.h"
#import "TABRevealKeepDataUtil.h"
#import "TABRevealAddChainView.h"
#import "TABRevealTableViewCell.h"

FOUNDATION_EXPORT double TABAnimatedVersionNumber;
FOUNDATION_EXPORT const unsigned char TABAnimatedVersionString[];

