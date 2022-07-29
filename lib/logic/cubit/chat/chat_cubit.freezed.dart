// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatState {
  bool get isLoading => throw _privateConstructorUsedError;
  ProfileModel get currentUser => throw _privateConstructorUsedError;
  ChatTypes get userChats => throw _privateConstructorUsedError;
  List<MessageModel> get connectedUserChat =>
      throw _privateConstructorUsedError;
  UserModel get connectedUser => throw _privateConstructorUsedError;
  ChatModel get chatInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      ProfileModel currentUser,
      ChatTypes userChats,
      List<MessageModel> connectedUserChat,
      UserModel connectedUser,
      ChatModel chatInfo});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? currentUser = freezed,
    Object? userChats = freezed,
    Object? connectedUserChat = freezed,
    Object? connectedUser = freezed,
    Object? chatInfo = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      userChats: userChats == freezed
          ? _value.userChats
          : userChats // ignore: cast_nullable_to_non_nullable
              as ChatTypes,
      connectedUserChat: connectedUserChat == freezed
          ? _value.connectedUserChat
          : connectedUserChat // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
      connectedUser: connectedUser == freezed
          ? _value.connectedUser
          : connectedUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
      chatInfo: chatInfo == freezed
          ? _value.chatInfo
          : chatInfo // ignore: cast_nullable_to_non_nullable
              as ChatModel,
    ));
  }
}

/// @nodoc
abstract class _$$_ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$$_ChatStateCopyWith(
          _$_ChatState value, $Res Function(_$_ChatState) then) =
      __$$_ChatStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      ProfileModel currentUser,
      ChatTypes userChats,
      List<MessageModel> connectedUserChat,
      UserModel connectedUser,
      ChatModel chatInfo});
}

/// @nodoc
class __$$_ChatStateCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements _$$_ChatStateCopyWith<$Res> {
  __$$_ChatStateCopyWithImpl(
      _$_ChatState _value, $Res Function(_$_ChatState) _then)
      : super(_value, (v) => _then(v as _$_ChatState));

  @override
  _$_ChatState get _value => super._value as _$_ChatState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? currentUser = freezed,
    Object? userChats = freezed,
    Object? connectedUserChat = freezed,
    Object? connectedUser = freezed,
    Object? chatInfo = freezed,
  }) {
    return _then(_$_ChatState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      userChats: userChats == freezed
          ? _value.userChats
          : userChats // ignore: cast_nullable_to_non_nullable
              as ChatTypes,
      connectedUserChat: connectedUserChat == freezed
          ? _value._connectedUserChat
          : connectedUserChat // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
      connectedUser: connectedUser == freezed
          ? _value.connectedUser
          : connectedUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
      chatInfo: chatInfo == freezed
          ? _value.chatInfo
          : chatInfo // ignore: cast_nullable_to_non_nullable
              as ChatModel,
    ));
  }
}

/// @nodoc

class _$_ChatState implements _ChatState {
  _$_ChatState(
      {required this.isLoading,
      required this.currentUser,
      required this.userChats,
      required final List<MessageModel> connectedUserChat,
      required this.connectedUser,
      required this.chatInfo})
      : _connectedUserChat = connectedUserChat;

  @override
  final bool isLoading;
  @override
  final ProfileModel currentUser;
  @override
  final ChatTypes userChats;
  final List<MessageModel> _connectedUserChat;
  @override
  List<MessageModel> get connectedUserChat {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_connectedUserChat);
  }

  @override
  final UserModel connectedUser;
  @override
  final ChatModel chatInfo;

  @override
  String toString() {
    return 'ChatState(isLoading: $isLoading, currentUser: $currentUser, userChats: $userChats, connectedUserChat: $connectedUserChat, connectedUser: $connectedUser, chatInfo: $chatInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.currentUser, currentUser) &&
            const DeepCollectionEquality().equals(other.userChats, userChats) &&
            const DeepCollectionEquality()
                .equals(other._connectedUserChat, _connectedUserChat) &&
            const DeepCollectionEquality()
                .equals(other.connectedUser, connectedUser) &&
            const DeepCollectionEquality().equals(other.chatInfo, chatInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(currentUser),
      const DeepCollectionEquality().hash(userChats),
      const DeepCollectionEquality().hash(_connectedUserChat),
      const DeepCollectionEquality().hash(connectedUser),
      const DeepCollectionEquality().hash(chatInfo));

  @JsonKey(ignore: true)
  @override
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      __$$_ChatStateCopyWithImpl<_$_ChatState>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  factory _ChatState(
      {required final bool isLoading,
      required final ProfileModel currentUser,
      required final ChatTypes userChats,
      required final List<MessageModel> connectedUserChat,
      required final UserModel connectedUser,
      required final ChatModel chatInfo}) = _$_ChatState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  ProfileModel get currentUser => throw _privateConstructorUsedError;
  @override
  ChatTypes get userChats => throw _privateConstructorUsedError;
  @override
  List<MessageModel> get connectedUserChat =>
      throw _privateConstructorUsedError;
  @override
  UserModel get connectedUser => throw _privateConstructorUsedError;
  @override
  ChatModel get chatInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
