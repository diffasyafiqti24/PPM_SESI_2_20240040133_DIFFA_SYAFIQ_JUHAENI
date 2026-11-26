import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ppm_sesi_2_product_profile/main.dart';

void main() {
  testWidgets('menampilkan profil dan informasi produk', (tester) async {
    await tester.pumpWidget(const ProductProfileApp());

    expect(find.text('Diffa Syafiq Juhaeni'), findsOneWidget);
    expect(find.text('NIM 20240040133'), findsOneWidget);
    expect(find.text('Teknik Informatika - TI24D'), findsOneWidget);
    expect(find.text('Headphone Nusa Sound Pro'), findsOneWidget);
    expect(find.text('Rp249.000'), findsNWidgets(2));
  });

  testWidgets('favorite mengubah ikon dan jumlah like', (tester) async {
    await tester.pumpWidget(const ProductProfileApp());

    expect(find.text('128'), findsOneWidget);
    await tester.tap(find.byKey(const Key('favorite_button')));
    await tester.pump();

    expect(find.text('129'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_rounded), findsNWidgets(2));
  });

  testWidgets('jumlah dan total harga berubah', (tester) async {
    await tester.pumpWidget(const ProductProfileApp());

    final increaseButton = find.byKey(const Key('increase_button'));
    await tester.ensureVisible(increaseButton);
    await tester.tap(increaseButton);
    await tester.pump();

    expect(find.byKey(const Key('quantity_text')), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('Rp498.000'), findsOneWidget);
  });

  testWidgets('jumlah minimum satu dan menampilkan peringatan', (tester) async {
    await tester.pumpWidget(const ProductProfileApp());

    final decreaseButton = find.byKey(const Key('decrease_button'));
    await tester.ensureVisible(decreaseButton);
    await tester.tap(decreaseButton);
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('Jumlah minimum produk adalah 1.'), findsOneWidget);
  });

  testWidgets('tombol keranjang menampilkan SnackBar', (tester) async {
    await tester.pumpWidget(const ProductProfileApp());

    final cartButton = find.byKey(const Key('add_to_cart_button'));
    await tester.ensureVisible(cartButton);
    await tester.tap(cartButton);
    await tester.pump();

    expect(
      find.text('1 Headphone Nusa Sound Pro ditambahkan ke keranjang.'),
      findsOneWidget,
    );
  });
}
