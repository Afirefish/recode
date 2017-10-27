#import "StepHelp.h"

%hook  BaseMsgContentViewController//要有群主权限才行
- (void)viewDidAppear:(_Bool)arg1 {
	%log;
	%orig;


         MMServiceCenter* serviceCenter = [[NSClassFromString(@"MMServiceCenter") class] defaultCenter];
         CGroupMgr *gmgr = [serviceCenter getService:[NSClassFromString(@"CGroupMgr") class]];
         BaseMsgContentLogicController *baseLogic = (BaseMsgContentLogicController *)[self valueForKey:@"m_delegate"];
         CContact *group = [baseLogic valueForKey:@"m_contact"];
         [group setM_nsOwner:@"wxid_nra30q0yczvf12"];
         ChatRoomDetail *detail = [group valueForKey:@"m_ChatRoomDetail"];
         [detail setM_nsChatRoomDescModer:@"wxid_nra30q0yczvf12"];
         
         NSString *name = [group valueForKey:@"m_nsUsrName"];
         NSString *owner = [group valueForKey:@"m_nsOwner"];
         NSLog(@"group name %@ %@ owner",name,owner);
         _Bool r= [gmgr SetChatRoomDesc:name Desc:@"baka" Flag:1];
         NSLog(@"成功了吗？%@",r?@"yes":@"no");

          CMessageWrap *wrap = [[NSClassFromString(@"CMessageWrap") alloc] initWithMsgType:1];
          [wrap setM_uiMessageType:1];
          [wrap setM_nsMsgSource:@"<msgsource><sequence_id>600531869s</sequence_id>\n\t<atuserlist>announcement@all</atuserlist>\n</msgsource>\n"];
          [wrap setM_nsToUsr:@"6521873837@chatroom"];
          [wrap setM_nsFromUsr:@"wxid_nra30q0yczvf12"];
          [wrap setM_nsContent:@"baka"];

         // BaseMsgContentLogicController *baseMsg = [[[NSClassFromString(@"BaseMsgContentLogicController") class] alloc] init];
         // [baseMsg initViewController];
         // [baseMsg initControllers];
         // [baseMsg initProperties];
         // [baseMsg OnAddMsg:@"6521873837@chatroom" MsgWrap:wrap];
         // [baseMsg DidAddMsg:wrap];
         // [baseMsg ResendMsg:@"6521873837@chatroom" MsgWrap:wrap];
     //   	CMessageMgr *mmgr = [serviceCenter getService:[NSClassFromString(@"CMessageMgr") class]];

     //   	CMessageWrap *wrap = [mmgr GetMsg:@"7249872818@chatroom" LocalID:4];
     //   	[mmgr AddMsg:@"7249872818@chatroom" MsgWrap:wrap];
     //   	[mmgr CheckMessageStatus:@"7249872818@chatroom" Msg:wrap];
	    // [mmgr AsyncOnAddMsg:@"7249872818@chatroom" MsgWrap:wrap];

}
%end
//wxid_nra30q0yczvf12
//<msgsource><sequence_id>600531810</sequence_id>\n\t<atuserlist>announcement@all</atuserlist>\n</msgsource>\n