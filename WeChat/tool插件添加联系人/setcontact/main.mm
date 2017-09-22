#import "TaskImportContacts.h"

int main(int argc, char **argv, char **envp) {
    NSDictionary *dic = @{@"type":@"APPEND",
                                   @"contacts":@[@{@"name":@"王一",@"phone":@"13712340009"},
                                                     @{@"name":@"王二",@"phone":@"13712340008"},
                                                         @{@"name":@"王三",@"phone":@"13712340007"},
                                                             @{@"name":@"王四",@"phone":@"13712340006"}]
                                                                 };
    NSMutableDictionary *mutdic = [dic mutableCopy];
    NSLog(@"executethis");
    TASK_IMPORT_CONTACTS *sta = [[TASK_IMPORT_CONTACTS alloc] init];
    [sta start:mutdic];
	return 0;
}

// vim:ft=objc
