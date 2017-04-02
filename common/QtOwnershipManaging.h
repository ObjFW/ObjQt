#import <ObjFW/ObjFW.h>

@protocol QtOwnershipManaging
- (void)takeOwnership;
- (void)giveUpOwnership;
@end
