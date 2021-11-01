import 'package:toko_netzme/Helpers/ApiBaseHelper.dart';

import 'auth_lisance.response.dart';

class LivenessRepository {
  final String _apiKey = "78b9f63937763a206bff26c070b94158";

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<AuthLisanceResponse> generateAuthLicense() async {

    Map<String, String> header = new Map();
    header["X-ADVAI-KEY"] =  "3b92db82a081940a";

    Map<String, String> body = new Map();
    body["licenseEffectiveSeconds"] =  "86400";
    body["applicationId"] =  "id.netzme.tokoNetzme";

    final response = await _helper.post("openapi/liveness/v1/auth-license", header, body);

    return AuthLisanceResponse.fromJson(response);
  }
}