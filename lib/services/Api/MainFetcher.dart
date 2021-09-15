class MainFetcher {
  String userToken = "15sdf";
  String apiUrl = "https://shophouse.alwaysdata.net";

  String urlBuilder(String subUrl) {
    return "${this.apiUrl}/$subUrl";
  }
}
