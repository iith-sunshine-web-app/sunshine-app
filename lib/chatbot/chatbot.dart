import 'package:dialog_flowtter/dialog_flowtter.dart';

class ChatBotService {
  Future<String?> sendMessage(String query,String sessionId) async {
    DialogAuthCredentials credentials =
        await DialogAuthCredentials.fromFile('assets/service.json');
    final DialogFlowtter dialogFlowtter = DialogFlowtter(
      credentials: credentials,
      sessionId: sessionId,
    );

    final QueryInput queryInput = QueryInput(
      text: TextInput(
        text: query,
        languageCode: "en",
      ),
    );
    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: queryInput,
    );
    return response.text;
  }
}
