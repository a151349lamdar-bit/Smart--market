// چندین تم (قالب) برای فروشگاه

import 'package:flutter/material.dart';

class ShopThemeManager {
  // لیست تم‌های آماده
  static final List<ShopTheme> _availableThemes = [
    ShopTheme(
      id: 'default',
      name: 'پیش‌فرض',
      description: 'تم ساده و استاندارد',
      colors: {
        'primary': Colors.blue,
        'secondary': Colors.blueAccent,
        'background': Colors.white,
        'surface': Colors.grey.shade50,
        'text': Colors.black87,
        'accent': Colors.orange,
      },
      fontFamily: 'Vazir',
      borderRadius: 8.0,
      price: 0, // رایگان
    ),
    ShopTheme(
      id: 'modern',
      name: 'مدرن',
      description: 'طراحی مدرن و مینیمال',
      colors: {
        'primary': Color(0xFF2C3E50),
        'secondary': Color(0xFF3498DB),
        'background': Color(0xFFECF0F1),
        'surface': Colors.white,
        'text': Color(0xFF2C3E50),
        'accent': Color(0xFFE74C3C),
      },
      fontFamily: 'Vazir',
      borderRadius: 12.0,
      price: 0, // رایگان
    ),
    ShopTheme(
      id: 'luxury',
      name: 'لوکس',
      description: 'طراحی لوکس و اختصاصی',
      colors: {
        'primary': Color(0xFF8B4513),
        'secondary': Color(0xFFDAA520),
        'background': Color(0xFFFAF3E0),
        'surface': Colors.white,
        'text': Color(0xFF4A3728),
        'accent': Color(0xFFC19A6B),
      },
      fontFamily: 'Vazir',
      borderRadius: 16.0,
      price: 0, // رایگان برای شروع
    ),
    ShopTheme(
      id: 'dark',
      name: 'تاریک',
      description: 'تم تاریک برای چشم‌ها',
      colors: {
        'primary': Color(0xFFBB86FC),
        'secondary': Color(0xFF03DAC6),
        'background': Color(0xFF121212),
        'surface': Color(0xFF1E1E1E),
        'text': Colors.white,
        'accent': Color(0xFFCF6679),
      },
      fontFamily: 'Vazir',
      borderRadius: 8.0,
      price: 0,
    ),
    ShopTheme(
      id: 'nature',
      name: 'طبیعت',
      description: 'طراحی آرامش‌بخش و طبیعی',
      colors: {
        'primary': Color(0xFF2E7D32),
        'secondary': Color(0xFF4CAF50),
        'background': Color(0xFFF1F8E9),
        'surface': Colors.white,
        'text': Color(0xFF1B5E20),
        'accent': Color(0xFFFF9800),
      },
      fontFamily: 'Vazir',
      borderRadius: 20.0,
      price: 0,
    ),
  ];
  
  static List<ShopTheme> getAvailableThemes() {
    return _availableThemes;
  }
  
  // Widget نمایش تم‌ها
  static Widget buildThemeSelector(BuildContext context, Function(ShopTheme) onThemeSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            '🎨 انتخاب تم فروشگاه',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemCount: _availableThemes.length,
          itemBuilder: (context, index) {
            final theme = _availableThemes[index];
            return _buildThemeCard(theme, onThemeSelected);
          },
        ),
      ],
    );
  }
  
  static Widget _buildThemeCard(ShopTheme theme, Function(ShopTheme) onThemeSelected) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onThemeSelected(theme),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // نمونه رنگ‌ها
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [
                      theme.colors['primary']!,
                      theme.colors['secondary']!,
                      theme.colors['accent']!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              
              SizedBox(height: 12),
              
              // نام تم
              Text(
                theme.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              
              SizedBox(height: 4),
              
              // توضیحات
              Expanded(
                child: Text(
                  theme.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              
              SizedBox(height: 8),
              
              // قیمت و وضعیت
              Row(
                children: [
                  Icon(Icons.circle, size: 8, color: Colors.green),
                  SizedBox(width: 4),
                  Text(
                    theme.price == 0 ? 'رایگان' : '${theme.price} تومان',
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.price == 0 ? Colors.green : Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // اعمال تم به برنامه
  static ThemeData applyTheme(ShopTheme theme) {
    return ThemeData(
      primaryColor: theme.colors['primary'],
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: _createMaterialColor(theme.colors['primary']!),
        backgroundColor: theme.colors['background'],
        cardColor: theme.colors['surface'],
        accentColor: theme.colors['accent'],
      ),
      fontFamily: theme.fontFamily,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme.borderRadius),
        ),
        elevation: 2,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colors['primary'],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(theme.borderRadius),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(theme.borderRadius),
        ),
      ),
    );
  }
  
  // ایجاد MaterialColor از رنگ دلخواه
  static MaterialColor _createMaterialColor(Color color) {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = color.red, g = color.green, b = color.blue;
    
    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    
    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    
    return MaterialColor(color.value, swatch);
  }
  
  // پیش‌نمایش تم
  static Widget buildThemePreview(ShopTheme theme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colors['background'],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'پیش‌نمایش: ${theme.name}',
            style: TextStyle(
              color: theme.colors['text'],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colors['surface'],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'این یک نمونه متن در تم ${theme.name} است',
              style: TextStyle(
                color: theme.colors['text'],
              ),
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colors['primary'],
            ),
            child: Text('دکمه نمونه'),
          ),
        ],
      ),
    );
  }
}

class ShopTheme {
  final String id;
  final String name;
  final String description;
  final Map<String, Color> colors;
  final String fontFamily;
  final double borderRadius;
  final int price; // قیمت به تومان
  
  ShopTheme({
    required this.id,
    required this.name,
    required this.description,
    required this.colors,
    required this.fontFamily,
    required this.borderRadius,
    required this.price,
  });
}
