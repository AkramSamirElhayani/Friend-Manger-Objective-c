//
//  FriendManager.h
//  FrindManager
//
//  Created by Akram Elhayani on 10/01/2022.
//

#import <Foundation/Foundation.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendManager : NSObject
{
    NSMutableArray<Friend*> *arr ;
    
    
}
-(id)init;
-(int)  DiplayMenu;
-(void) AddFriend;
-(void) PrintFriend:(Friend*)emp :(int)index;
-(void) PrintAll;
//-(void) PrintByID:(int)id;
-(void) PrintByID;
//-(void) PrintByName:(NSString*)name;
-(void) PrintByName;
-(void) DeleteAll;
//-(void) DeleteByID:(int)id;
-(void) DeleteByID;
//-(void) DeleteByName:(NSString*)name;
-(void) DeleteByName;
@end

NS_ASSUME_NONNULL_END
