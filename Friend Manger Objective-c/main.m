//
//  main.m
//  FrindManager
//
//  Created by Akram Elhayani on 10/01/2022.
//

#import <Cocoa/Cocoa.h>
#import "FriendManager.h"

int main(int argc, const char * argv[]) {
    
    FriendManager *mng = [FriendManager new ];
    int opt =0;
    do
    {
        system("clear");
        opt =[mng DiplayMenu];
        switch (opt)
        {
            case 1 :
                [mng  AddFriend];
                break;
            case 2 :
                [mng   PrintAll];
                break;
            case 3 :
                [mng    PrintByID];
                break;
                
            case 4 :
                [mng    PrintByName];
                break;
            case 5 :
                [mng    DeleteAll];
                break;
            case 6 :
                [mng    DeleteByID];
                break;
            case 7 :
                [mng    DeleteByName];
                break;
                
        }
        
    }
    while(opt != 8);
    
    
    return 0;
}
