import 'package:exc1_flutter/data/datasourcce/local/db_datasource.dart';
import 'package:exc1_flutter/data/datasourcce/remote/api_datasource.dart';
import 'package:exc1_flutter/data/models/product_mode.dart';
import 'package:exc1_flutter/data/repo/repo.dart';
import 'package:exc1_flutter/domain/entities/product.dart';
import 'package:exc1_flutter/domain/repo/repo.dart';
import 'package:exc1_flutter/domain/use_cases/product_usecase.dart';
import 'package:exc1_flutter/main.dart';
import 'package:exc1_flutter/presentation/edit_add_product/UI/edit_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_screen_test.mocks.dart';

@GenerateMocks([ProductUseCase])
void main() {
  group("edit screen test", () {
    late MockProductUseCase productUseCase;
    late Product product;
    setUpAll(() {
      product = Product(name: "updated", price: 22, id: 1);
      GetIt getIt = GetIt.instance;
      productUseCase = MockProductUseCase();
      getIt.registerSingleton<ProductUseCase>(productUseCase);
      when(productUseCase.updateProduct(any)).thenAnswer((realInvocation) => Future.value(product));
    });
    testWidgets("edit screen test", (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: EditProductScreen(product: Product(name: "productName", price: 20, id: 1)),
      ));
      var title = find.text("edit");
      var productName = find.text("productName");
      var productPrice = find.text(20.toString());
      var submitButton = find.text("submit");
      expect(title, findsOneWidget);
      expect(productName, findsOneWidget);
      expect(productPrice, findsOneWidget);

      await tester.tap(submitButton);
      verify(productUseCase.updateProduct(any)).called(1);
    });
  });
}
