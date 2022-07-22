// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  List<UserModel> get userList => throw _privateConstructorUsedError;
  List<SearchResult> get movieList => throw _privateConstructorUsedError;
  List<ReviewResult> get reviewList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call(
      {List<UserModel> userList,
      List<SearchResult> movieList,
      List<ReviewResult> reviewList});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object? userList = freezed,
    Object? movieList = freezed,
    Object? reviewList = freezed,
  }) {
    return _then(_value.copyWith(
      userList: userList == freezed
          ? _value.userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      movieList: movieList == freezed
          ? _value.movieList
          : movieList // ignore: cast_nullable_to_non_nullable
              as List<SearchResult>,
      reviewList: reviewList == freezed
          ? _value.reviewList
          : reviewList // ignore: cast_nullable_to_non_nullable
              as List<ReviewResult>,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<UserModel> userList,
      List<SearchResult> movieList,
      List<ReviewResult> reviewList});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, (v) => _then(v as _$_SearchState));

  @override
  _$_SearchState get _value => super._value as _$_SearchState;

  @override
  $Res call({
    Object? userList = freezed,
    Object? movieList = freezed,
    Object? reviewList = freezed,
  }) {
    return _then(_$_SearchState(
      userList: userList == freezed
          ? _value._userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      movieList: movieList == freezed
          ? _value._movieList
          : movieList // ignore: cast_nullable_to_non_nullable
              as List<SearchResult>,
      reviewList: reviewList == freezed
          ? _value._reviewList
          : reviewList // ignore: cast_nullable_to_non_nullable
              as List<ReviewResult>,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {required final List<UserModel> userList,
      required final List<SearchResult> movieList,
      required final List<ReviewResult> reviewList})
      : _userList = userList,
        _movieList = movieList,
        _reviewList = reviewList;

  final List<UserModel> _userList;
  @override
  List<UserModel> get userList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userList);
  }

  final List<SearchResult> _movieList;
  @override
  List<SearchResult> get movieList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movieList);
  }

  final List<ReviewResult> _reviewList;
  @override
  List<ReviewResult> get reviewList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewList);
  }

  @override
  String toString() {
    return 'SearchState(userList: $userList, movieList: $movieList, reviewList: $reviewList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            const DeepCollectionEquality().equals(other._userList, _userList) &&
            const DeepCollectionEquality()
                .equals(other._movieList, _movieList) &&
            const DeepCollectionEquality()
                .equals(other._reviewList, _reviewList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_userList),
      const DeepCollectionEquality().hash(_movieList),
      const DeepCollectionEquality().hash(_reviewList));

  @JsonKey(ignore: true)
  @override
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {required final List<UserModel> userList,
      required final List<SearchResult> movieList,
      required final List<ReviewResult> reviewList}) = _$_SearchState;

  @override
  List<UserModel> get userList => throw _privateConstructorUsedError;
  @override
  List<SearchResult> get movieList => throw _privateConstructorUsedError;
  @override
  List<ReviewResult> get reviewList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
