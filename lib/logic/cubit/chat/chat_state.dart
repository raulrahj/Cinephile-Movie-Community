part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  factory ChatState({
    required bool isLoading,
    required ProfileModel currentUser,
    required ChatTypes userChats,
    required List<MessageModel> connectedUserChat,
    required UserModel connectedUser,
    required ChatModel chatInfo
  }) = _ChatState;

  factory ChatState.initial() => ChatState(
      currentUser: ProfileModel(
          token: '', user: UserResp(firstname: '', lastname: '', username: '')),
      userChats: ChatTypes(groupChat: [], perSonalChat: []),
      connectedUserChat: [],
      isLoading: false,
      chatInfo: ChatModel(members: [],id: ''),
      connectedUser:
          UserModel(id: '', username: '', firstname: '', lastname: ''));
}
