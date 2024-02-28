String hideWalletAddress(String address) {
  final partLength = address.length ~/ 3.5;
  return "${address.substring(0,partLength)}.....${address.substring(partLength*3)}";
}