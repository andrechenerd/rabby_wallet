abstract class SharingService {
  Future<void> share(List files,{final String? link});
  Future<void> shareLink(String link);
}