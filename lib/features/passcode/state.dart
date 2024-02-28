// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PassCodeScreenState extends Equatable {
  final String code;

  int get codeLength => code.length;
  bool get isCompleted => codeLength == 6;

  const PassCodeScreenState({
    required this.code,
  });

  PassCodeScreenState copyWith({
    String? code,
  }) {
    return PassCodeScreenState(
      code: code ?? this.code,
    );
  }

  @override
  List<Object> get props => [code];

  factory PassCodeScreenState.initial() {
    return const PassCodeScreenState(code: "");
  }
}
