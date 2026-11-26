import 'package:flutter/material.dart';

void main() {
  runApp(const ProductProfileApp());
}

class ProductProfileApp extends StatelessWidget {
  const ProductProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF00695C);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PPM Sesi 2',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7F6),
        cardTheme: const CardThemeData(
          elevation: 0,
          margin: EdgeInsets.zero,
        ),
      ),
      home: const ProductProfilePage(),
    );
  }
}

class ProductProfilePage extends StatelessWidget {
  const ProductProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        title: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'PPM Sesi 2 - Diffa Syafiq Juhaeni (20240040133)',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  StudentProfileCard(),
                  SizedBox(height: 20),
                  PromoBanner(),
                  SizedBox(height: 20),
                  ProductCard(),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StudentProfileCard extends StatelessWidget {
  const StudentProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 38,
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              child: const Icon(Icons.person_rounded, size: 44),
            ),
            const SizedBox(width: 18),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Diffa Syafiq Juhaeni',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 8),
                  ProfileLine(
                    icon: Icons.badge_outlined,
                    text: 'NIM 20240040133',
                  ),
                  SizedBox(height: 5),
                  ProfileLine(
                    icon: Icons.school_outlined,
                    text: 'Teknik Informatika - TI24D',
                  ),
                  SizedBox(height: 9),
                  RatingStars(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileLine extends StatelessWidget {
  const ProfileLine({required this.icon, required this.text, super.key});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 7),
        Expanded(child: Text(text)),
      ],
    );
  }
}

class RatingStars extends StatelessWidget {
  const RatingStars({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.star_rounded, color: Color(0xFFFFB300), size: 21),
        Icon(Icons.star_rounded, color: Color(0xFFFFB300), size: 21),
        Icon(Icons.star_rounded, color: Color(0xFFFFB300), size: 21),
        Icon(Icons.star_rounded, color: Color(0xFFFFB300), size: 21),
        Icon(Icons.star_rounded, color: Color(0xFFFFB300), size: 21),
      ],
    );
  }
}

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      height: 132,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.primary, const Color(0xFF009688)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -42,
            child: Container(
              width: 145,
              height: 145,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(24),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 34,
            bottom: -54,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFFFC107).withAlpha(55),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const Positioned(
            left: 20,
            top: 18,
            right: 125,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PROMO MAHASISWA',
                  style: TextStyle(
                    color: Color(0xFFFFD54F),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.1,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Belanja lebih hemat, belajar makin semangat!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    height: 1.15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'Diskon khusus hingga 25%',
                  style: TextStyle(color: Color(0xFFE0F2F1)),
                ),
              ],
            ),
          ),
          const Positioned(
            right: 22,
            top: 35,
            child: Icon(
              Icons.local_offer_rounded,
              color: Colors.white,
              size: 62,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  static const int _unitPrice = 249000;

  bool _isFavorite = false;
  int _likeCount = 128;
  int _quantity = 1;

  int get _totalPrice => _unitPrice * _quantity;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      _likeCount += _isFavorite ? 1 : -1;
    });
  }

  void _increaseQuantity() {
    setState(() {
      _quantity += 1;
    });
  }

  void _decreaseQuantity() {
    if (_quantity == 1) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Jumlah minimum produk adalah 1.')),
        );
      return;
    }

    setState(() {
      _quantity -= 1;
    });
  }

  void _addToCart() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            '$_quantity Headphone Nusa Sound Pro ditambahkan ke keranjang.',
          ),
          action: SnackBarAction(label: 'OK', onPressed: () {}),
        ),
      );
  }

  String _formatRupiah(int value) {
    final digits = value.toString();
    final buffer = StringBuffer();

    for (var index = 0; index < digits.length; index++) {
      final remaining = digits.length - index;
      buffer.write(digits[index]);
      if (remaining > 1 && remaining % 3 == 1) {
        buffer.write('.');
      }
    }

    return 'Rp$buffer';
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 24,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: 210,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE0F2F1), Color(0xFFB2DFDB)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.headphones_rounded,
                    size: 118,
                    color: colors.primary,
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      key: const Key('favorite_button'),
                      tooltip: _isFavorite
                          ? 'Hapus dari favorit'
                          : 'Tambahkan ke favorit',
                      onPressed: _toggleFavorite,
                      icon: Icon(
                        _isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: _isFavorite
                            ? const Color(0xFFE53935)
                            : colors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 12,
                  top: 12,
                  child: Chip(
                    avatar: Icon(Icons.bolt_rounded, size: 18),
                    label: Text('Best Seller'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Headphone Nusa Sound Pro',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Kategori: Elektronik',
                        style: TextStyle(color: Color(0xFF607D8B)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    Icon(
                      _isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: _isFavorite
                          ? const Color(0xFFE53935)
                          : colors.onSurfaceVariant,
                      size: 19,
                    ),
                    Text(
                      '$_likeCount',
                      key: const Key('like_count'),
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              _formatRupiah(_unitPrice),
              style: TextStyle(
                color: colors.primary,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest.withAlpha(120),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Jumlah produk',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  IconButton.filledTonal(
                    key: const Key('decrease_button'),
                    onPressed: _decreaseQuantity,
                    icon: const Icon(Icons.remove_rounded),
                  ),
                  SizedBox(
                    width: 52,
                    child: Text(
                      '$_quantity',
                      key: const Key('quantity_text'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  IconButton.filled(
                    key: const Key('increase_button'),
                    onPressed: _increaseQuantity,
                    icon: const Icon(Icons.add_rounded),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Total harga',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  _formatRupiah(_totalPrice),
                  key: const Key('total_price'),
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            FilledButton.icon(
              key: const Key('add_to_cart_button'),
              onPressed: _addToCart,
              icon: const Icon(Icons.shopping_cart_checkout_rounded),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 13),
                child: Text(
                  'Tambah ke Keranjang',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
