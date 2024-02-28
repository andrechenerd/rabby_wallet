import 'package:equatable/equatable.dart';

class SendState extends Equatable {
  final double exchange;
 const SendState({
    required this.exchange,
  });

  SendState copyWith({
    double? exchange,
  }) {
    return SendState(
      exchange: exchange ?? this.exchange,
    );
  }

  @override
  List<Object> get props => [exchange];


  factory SendState.initial(){
    return const SendState(exchange: 0.000023);
  }
}
