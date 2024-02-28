import 'package:equatable/equatable.dart';

class BackupSeedPhraseState extends Equatable {
  final bool isLoading;
  final bool isShown;
  final List<String> menmonicPhrases;
  const BackupSeedPhraseState({
    required this.isLoading,
    required this.menmonicPhrases,
    required this.isShown,
  });

  BackupSeedPhraseState copyWith({
    bool? isLoading,
    List<String>? menmonicPhrases,
    bool? isShown,
  }) {
    return BackupSeedPhraseState(
      isLoading: isLoading ?? this.isLoading,
      menmonicPhrases: menmonicPhrases ?? this.menmonicPhrases,
      isShown: isShown ?? this.isShown,
    );
  }

  @override
  List<Object?> get props => [isLoading, menmonicPhrases,isShown,];

  factory BackupSeedPhraseState.initial() {
    return const BackupSeedPhraseState(
      isLoading: false,
      menmonicPhrases: [],
      isShown: false,
    );
  }
}
