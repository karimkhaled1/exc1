import 'package:exc1_flutter/data/datasourcce/local/db_datasource.dart';
import 'package:exc1_flutter/data/datasourcce/remote/api_datasource.dart';
import 'package:exc1_flutter/data/models/product_mode.dart';
import 'package:exc1_flutter/data/repo/repo.dart';
import 'package:exc1_flutter/domain/entities/product.dart';
import 'package:exc1_flutter/domain/repo/repo.dart';
import 'package:exc1_flutter/domain/use_cases/product_usecase.dart';
import 'package:exc1_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_screen_test.mocks.dart';

@GenerateMocks([ProductUseCase])
void main() {
  group("home screen test", () {
    late MockProductUseCase productUseCase;

    setUpAll(() {
      GetIt getIt = GetIt.instance;
      productUseCase = MockProductUseCase();
      getIt.registerSingleton<ProductUseCase>(productUseCase);
      when(productUseCase.getProducts()).thenAnswer((realInvocation) => Future.value([Product(name: "name", price: 20, id: 1)]));
      when(productUseCase.deleteProduct(any));
    });
    testWidgets("home screen test", (tester) async {
      await tester.pumpWidget(const MyApp());
      var title = find.text("products");
      var productName = find.text("name");
      var deleteIcon = find.byIcon(Icons.delete);
      expect(title, findsOneWidget);
      await tester.pump(Duration(milliseconds: 100));
      expect(productName, findsOneWidget);
      expect(deleteIcon, findsOneWidget);
      await tester.tap(deleteIcon);
      verify(productUseCase.deleteProduct(any)).called(1);
    });
  });
}
