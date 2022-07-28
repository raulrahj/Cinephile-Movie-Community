import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_box/data/models/chat/m_chat.dart';
import 'package:open_box/data/models/chat/m_message.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/chat/chat_repo.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/view/chat_screen/inbox_screen.dart';

part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

// @injectable
class ChatCubit extends Cubit<ChatState> {
  // final ChatRepo _chatRepo;
  ChatCubit() : super(ChatState.initial());

  Future getCurrentUser() async {
    final currentUser = await SharedService.getUserProfile();
    emit(state.copyWith(currentUser: currentUser!));
  }

  Future createChat({required ChatModel chat}) async {
    await ChatRepo().createChat(chat: chat);
  }

  Future getUserChats() async {
    final ChatTypes userChats =
        await ChatRepo().userChats(userId: state.currentUser.user!.id!);
    emit(state.copyWith(userChats: userChats));
  }

  Future findChat({required String clientId}) async {
    final getStarted = await ChatRepo()
        .findChat(userId: state.currentUser.user!.id!, clientId: clientId);
    final UserModel? conntdctedUser = await UserRepo().getUser(id: clientId);
    emit(state.copyWith(
        connectedUserChat: getStarted, connectedUser: conntdctedUser!));
  }

  Future addMessage({required MessageModel message}) async {
    await ChatRepo().addMessage(message: message);
    emit(state);
  }

  Future getMessages({required String chatId, required String clientId}) async {
    final getStarted = await ChatRepo().getMessages(chatId: chatId);
    final UserModel? conntdctedUser = await UserRepo().getUser(id: clientId);
    emit(state.copyWith(
        connectedUser: conntdctedUser!, connectedUserChat: getStarted));
  }
}
