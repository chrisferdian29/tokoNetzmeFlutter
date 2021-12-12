import 'package:toko_netzme/main_dev.dart';
import 'flavor_config.dart';

void main() {

  mainCommon(
    FlavorConfig()
      ..appTitle = "STG"
      ..apiEndpoint = {
        Endpoints.tokoApi: "https://tokoapi-stg.netzme.com/",
      }
  );
}