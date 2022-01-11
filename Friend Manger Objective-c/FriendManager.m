//
//  FriendManager.m
//  FrindManager
//
//  Created by Akram Elhayani on 10/01/2022.
//

#import "FriendManager.h"

@implementation FriendManager
{
    int arrSize;
}

-(void) DeleteAll
{
    system("clear");
    //  printf("\n================================================");
    int deletedEmp = 0 ;
    char answer  = '-';
    do
    {
        printf("are You Sure you want to delete all friends  ? [y,n] : ");
        fflush(stdin);
        scanf("%c",&answer);
        if(answer !='y'&&answer !='n')
        {
            printf("Invalid Answer !\n");
        }
    }
    while (answer !='y'&&answer !='n');
    if(answer == 'y')
    {
        for(int i = 0 ; i<arrSize ; i++)
        {
            if([arr objectAtIndex:i].fid >0)
            {
                [arr objectAtIndex:i].fid = -1 ;
                deletedEmp++;
            }
        }
    }
    
    
    if(deletedEmp == 0 )
    {
        printf("\n================No Data Was Deleted ===============================");
    }
    else
    {
        
        printf("\n================End Of Data , Total deleted :%i==================",deletedEmp);
        
    }
    
    printf("\nPress any Key to get to main menu : ");
    fflush(stdin);
    getc(stdin);
    
    
}

-(void) DeleteByID
{
    int id =-1;
    do
    {
        printf("Please Enter ID : ");
        fflush(stdin);
        scanf("%i",&id );
        if(id < 0 )
        {
            printf("Invalid Input !\n");
        }
        
    }
    while(id <0 );
    int deletedEmp = 0 ;
    char answer  = '-';
    for(int i = 0 ; i<arrSize ; i++)
    {
        
        if([arr objectAtIndex:i].fid ==id)
        {
            
            do
            {
                printf("are You Sure you want to delete %s  ? [y,n] : ",   [ [arr objectAtIndex:i].name cStringUsingEncoding:NSASCIIStringEncoding]);
                fflush(stdin);
                scanf("%c",&answer);
                if(answer !='y'&&answer !='n')
                {
                    printf("Invalid Answer !\n");
                }
            }
            while (answer !='y'&&answer !='n');
            if(answer == 'y')
            {
                [arr objectAtIndex:i].fid=-1;
                deletedEmp++;
            }
        }
    }
    if(deletedEmp == 0 )
    {
        if(answer!='n')
        {
            printf("\n================User Aborted the operation ! ===============================");
        }
        else
        {
            printf("\n================Friend Not Found ===============================");
        }
        
    }
    else
    {
        
        printf("\n================End Of Data , Total deleted :%i==================",deletedEmp);
        
    }
    
    if(deletedEmp==1)
        printf("\nFriend Deleted");
    printf("\nPress any Key to get to main menu");
    getc(stdin);
}
-(void) DeleteByName
{
    char name[25]="\0";
    do
    {
        printf("Please Enter Name : ");
        fflush(stdin);
        scanf("%s", name );
        if( name[0] =='\0'  )
        {
            printf("Invalid Input !\n");
        }
    }
    while(name[0] =='\0' );
    int deletedEmp = 0 ;
    char answer  = '-';
    for(int i = 0 ; i<arrSize ; i++)
    {
        int result = strcmp([ [arr objectAtIndex:i].name cStringUsingEncoding:NSASCIIStringEncoding],name);
        
        if(   result == 0 )//
        {
            
            do
            {
                printf("are You Sure you want to delete %s  ? [y,n] : ",
                       [ [arr objectAtIndex:i].name cStringUsingEncoding:NSASCIIStringEncoding]);
                fflush(stdin);
                scanf("%c",&answer);
                if(answer !='y'&&answer !='n')
                {
                    printf("Invalid Answer !\n");
                }
            }
            while (answer !='y'&&answer !='n');
            if(answer == 'y')
            {
                [arr objectAtIndex:i].fid=-1;
                deletedEmp++;
            }
        }
        
        
        
        
    }
    if(deletedEmp == 0 )
    {
        if(answer!='n')
        {
            printf("\n================User Aborted the operation ! ===============================");
        }
        else
        {
            printf("\n================Friend Not Found ===============================");
        }
        
    }
    else
    {
        
        printf("\n================End Of Data , Total deleted :%i==================",deletedEmp);
        
    }
    if(deletedEmp==0)
        printf("\nFriend Deleted");
    printf("\nPress any Key to get to main menu");
    getc(stdin);
}

-(void) PrintByID
{
    int id =-1;
    do
    {
        printf("Please Enter ID : ");
        fflush(stdin);
        scanf("%i",&id );
        if(id < 0 )
        {
            printf("Invalid Input !\n");
        }
        
    }
    while(id <0 );
    int empFound = 0 ;
    for(int i = 0 ; i<arrSize ; i++)
    {
        
        if([arr objectAtIndex:i].fid ==id)
        {
            [self PrintFriend:[arr objectAtIndex:i] :i];
            empFound = 1 ;
            i=arrSize;
            
        }
        else
        {
            
            
        }
    }
    if(empFound==0)
        printf("\nFriend Not Found !");
    printf("\nPress any Key to get to main menu");
    getc(stdin);
}
-(void) PrintByName
{
    char name[25]="\0";
    do
    {
        printf("Please Enter Name : ");
        fflush(stdin);
        scanf("%s", name );
        if( name[0] =='\0'  )
        {
            printf("Invalid Input !\n");
        }
    }
    while(name[0] =='\0' );
    int empFound = 0 ;
    for(int i = 0 ; i<arrSize ; i++)
    {
        int result = strcmp([ [arr objectAtIndex:i].name cStringUsingEncoding:NSASCIIStringEncoding],name);
        //  printf("\n %i",result);
        if(   result == 0 )//
        {
            [self PrintFriend:[arr objectAtIndex:i] :i];
            empFound = 1 ;
            i=arrSize;
        }
    }
    if(empFound==0)
        printf("\nFriend Not Found !");
    printf("\nPress any Key to get to main menu");
    getc(stdin);
}
-(void) PrintAll
{
    system("clear");
    printf("=============================================================\n");
    printf("|I |ID|Name         |Age|Phone        |Email                |\n");
    printf("=============================================================");
 
    int printedf = 0 ;
    for(int i = 0 ; i<arrSize ; i++)
    {
        
        if( [arr objectAtIndex:i].fid >0)
        {
            if(printedf>0)
                printf("\n---+--+-------------+---+-------------+----------------------");
            [self PrintFriend: [arr objectAtIndex:i] :i];
            printedf++;
        }
    }
    if(printedf == 0 )
    {
        printf("                           No Data !                           ");
        printf("===============================================================");
    }
    else
    {
        printf("\n=============================================================");
        printf("\n==========================Count:%i============================",printedf);
       
    }
    printf("\nPress any Key to get to main menu : ");
    fflush(stdin);
    getc(stdin);
}

-(void) PrintFriend:(Friend*)emp :(int) index
{
    NSString *name = [emp.name stringByPaddingToLength:13 withString:@" " startingAtIndex:0];
    NSString *phone = [emp.phone stringByPaddingToLength:13 withString:@" " startingAtIndex:0];
    NSString *mail = [emp.email stringByPaddingToLength:21 withString:@" " startingAtIndex:0];
    NSString *fid = [[@(emp.fid) stringValue] stringByPaddingToLength:2 withString:@" " startingAtIndex:0];
    NSString *ind = [[@(index) stringValue] stringByPaddingToLength:2 withString:@" " startingAtIndex:0];
    NSString *age = [[@(emp.age) stringValue] stringByPaddingToLength:3 withString:@" " startingAtIndex:0];
    printf("\n|%s|%s|%s|%s|%s|%s|"
           ,[ind cStringUsingEncoding:NSASCIIStringEncoding]
           ,[fid cStringUsingEncoding:NSASCIIStringEncoding]
           ,[name cStringUsingEncoding:NSASCIIStringEncoding]
           ,[age cStringUsingEncoding:NSASCIIStringEncoding]
           ,[phone cStringUsingEncoding:NSASCIIStringEncoding]
           ,[mail cStringUsingEncoding:NSASCIIStringEncoding]   );
    
}

-(void) AddFriend
{
    int id =-1, index  =-1;
    
    do
    {
        printf("\nPlease Select Index : ");
        fflush(stdin);
        scanf("%i",&index);
        if(index < 0 || index > arrSize-1 )
        {
            printf("Invalid Input !\n");
        }
        else
        {
            // Check if Index Contains a value :
            if([arr objectAtIndex:index].fid != -1 )
            {
                
                char answer  = '-';
                do
                {
                    printf("There is an friend data in the selected index , Do you wnat to overwrite ? [y,n] : ");
                    fflush(stdin);
                    scanf("%c",&answer);
                    if(answer !='y'&&answer !='n')
                    {
                        printf("Invalid Answer !\n");
                    }
                }
                while (answer !='y'&&answer !='n');
                if(answer == 'n')
                {
                    index = -1;
                }
                
                
            }
        }
        
    }
    while (index < 0 || index > arrSize-1 );
    do
    {
        printf("Please Enter ID : ");
        fflush(stdin);
        scanf("%i",&id );
        if(id < 0 )
        {
            printf("Invalid Input !\n");
        }
        else
        {
            for(int i = 0 ; i< arrSize ; i++)
            {
                
                if([arr objectAtIndex:i].fid == id)
                {
                    printf("Id already Exist , please enter another Id  !\n");
                    id =-1 ;
                    i=arrSize;
                }
            }
            
            
        }
        
    }
    while(id <0 );
    [arr objectAtIndex:index].fid  =id ;
    [arr objectAtIndex:index].name=@"\0";
    
    printf("Please Enter Name : ");
    fflush(stdin);
    char str[50] = {0};
    scanf("%s", str);
    [arr objectAtIndex:index].name=  [NSString stringWithUTF8String:str];
    
    
    //Age
    int age;
    do
    {
        printf("Please Age : ");
        fflush(stdin);
        scanf("%i",&age );
        if(age <= 0 || age>=80)
        {
            printf("Invalid Input ! , Range must be within 1 and 80 \n");
        }
        else
            [arr objectAtIndex:index].age = age;
            
    }
    while(age <= 0 || age>=80);
    //Email
    printf("Please Enter Email : ");
    fflush(stdin);
    char email[50] = {0};
    scanf("%s", email);
    [arr objectAtIndex:index].email=  [NSString stringWithUTF8String:email];
    //Phone
    printf("Please Enter Phone : ");
    fflush(stdin);
    char phone[50] = {0};
    scanf("%s", phone);
    [arr objectAtIndex:index].phone=  [NSString stringWithUTF8String:phone];
    
    
    
    
    printf("Friend Add Successfully \n");
    int exitToMainFlag = 0;
    do
    {
        char answer  = '-';
        do
        {
            printf("\nGo To Main menu [m] , Print Employee [p] ? [m,p] : ");
            fflush(stdin);
            scanf("%c",&answer);
            if(answer !='m'&&answer !='p')
            {
                printf("Invalid Answer !\n");
            }
        }
        while (answer !='p'&&answer !='m');
        if(answer == 'p')
        {
            [self  PrintFriend:[arr objectAtIndex:index] :index ]; //Employees[index],index);
        }
        else
        {
            exitToMainFlag =1 ;
            
        }
        
    }
    while(exitToMainFlag == 0 );
    
}

-(int)  DiplayMenu
{
    
    int index = 0 ;
    do
    {
        
        printf("1 - Add New Friend\n");
        printf("2 - Display All\n");
        printf("3 - Print By ID\n");
        printf("4 - Get By Name\n");
        printf("5 - Delete All\n");
        printf("6 - Delete By ID\n");
        printf("7 - Delete By Name \n");
        printf("8 - Exit App\n");
        printf("Please Select an option: ");
        fflush(stdin);
        scanf("%i",&index);
        if(index > 8 || index <= 0)
        {
            index = 0 ;
            printf("Invalid input ! \n");
        }
        
        
        
        
    }
    while(index == 0 );
    return index;
}

- (id)init {
    if (self = [super init]) { // equivalent to "self does not equal nil"
        arrSize = 10 ;
        arr = [NSMutableArray arrayWithCapacity:arrSize];
        
        for(int i = 0; i < arrSize; i++) {
            
            [arr addObject:[Friend new ]];
        }
    }
    return self;
}
@end
