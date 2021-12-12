import 'package:toko_netzme/main_dev.dart';
import 'flavor_config.dart';

void main() {
  mainCommon(
      FlavorConfig()
        ..appTitle = "Toko Netzme"
        ..apiEndpoint = {
          Endpoints.tokoApi: "https://tokoapi.netzme.com/",
        }
  );
}