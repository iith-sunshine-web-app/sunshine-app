import 'package:dialog_flowtter/dialog_flowtter.dart';

class ChatBotService {
  chatbot(String query) async {
    DialogAuthCredentials credentials =
        await DialogAuthCredentials.fromFile('assets/service.json');
    final DialogFlowtter dialogFlowtter = DialogFlowtter(
      credentials: credentials,
      sessionId: "123456789",
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
    print(response.text);
    return response.text;
  }
}
