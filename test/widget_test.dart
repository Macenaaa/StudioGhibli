import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studio_ghibli/main.dart'; // Importando o main.dart para rodar o app

void main() {
  testWidgets('Verificar se a tela inicial exibe o título e a lista', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const StudioGhibliapp());

    // Verifique se o título 'Studio Ghibli' está presente na tela
    expect(find.text('Studio Ghibli'), findsOneWidget);

    // Verifique se a lista de personagens está visível
    // Você pode verificar se o primeiro item da lista está presente
    expect(find.byType(ListView), findsOneWidget); // Verifica se há uma ListView na tela
    expect(find.byType(ListTile), findsOneWidget); // Verifica se pelo menos um item de lista está presente

    // Outros testes podem ser adicionados, como interações com a lista, navegação, etc.
  });
}
