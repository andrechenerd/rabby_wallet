abstract class ButtonData {
  final String data;
  final bool isSelected;
  ButtonData({
    required this.data,
    required this.isSelected,
  });
}

abstract class ChangableButton extends ButtonData {
  ChangableButton({required String data, bool isSelected = false})
      : super(data: data, isSelected: isSelected);
  ChangableButton copyWith({
    bool? isSelected,
  });
}

class NumberButton extends ChangableButton {
  NumberButton({required String number, bool isSelected = false})
      : super(data: number, isSelected: isSelected);

  @override
  ChangableButton copyWith({bool? isSelected}) {
    return NumberButton(
        number: super.data, isSelected: isSelected ?? super.isSelected);
  }
}

class AssetConfirmButton extends ChangableButton {
  AssetConfirmButton({required String assetPath, bool isSelected = false})
      : super(data: assetPath, isSelected: isSelected);

  @override
  AssetConfirmButton copyWith({bool? isSelected}) {
    return AssetConfirmButton(
      assetPath: super.data,
      isSelected: isSelected ?? super.isSelected,
    );
  }
}

class AssetClearButton extends ChangableButton {
   AssetClearButton({required String assetPath, bool isSelected = false})
      : super(data: assetPath, isSelected: isSelected);

  @override
  AssetClearButton copyWith({bool? isSelected}) {
    return AssetClearButton(
      assetPath: super.data,
      isSelected: isSelected ?? super.isSelected,
    );
  }
}
