part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  factory ChatState({
    required bool isLoading,
    required ProfileModel currentUser,
    required ChatTypes userChats,
    required List<MessageModel> connectedUserChat,
    required UserModel connectedUser,
  }) = _ChatState;

  factory ChatState.initial() => ChatState(
      currentUser: ProfileModel(
          token: '', user: UserResp(firstname: '', lastname: '', username: '')),
      userChats: ChatTypes(groupChat: [], perSonalChat: []),
      connectedUserChat: [],
      isLoading: false,
      connectedUser:
          UserModel(id: '', username: '', firstname: '', lastname: ''));
}
