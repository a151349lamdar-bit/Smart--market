// تغییر حالت فروشگاه (ساده/پیشرفته)

import 'package:flutter/material.dart';

class ShopModeManager {
  // حالت‌های مختلف فروشگاه
  static bool _isAdvancedMode = false;
  
  static bool get isAdvancedMode => _isAdvancedMode;
  
  static void toggleMode() {
    _isAdvancedMode = !_isAdvancedMode;
  }
  
  // تنظیمات حالت ساده
  static Map<String, dynamic> getSimpleModeSettings() {
    return {
      'features': [
        'افزودن محصول ساده',
        'مدیریت موجودی پایه',
        'نمایش محصولات',
        'دریافت سفارشات',
        'چت با خریداران',
      ],
      'restrictions': [
        'حداکثر ۱۵ محصول',
        'تم پیش‌فرض',
        'گزارشات ساده',
        'بدون API',
        'بدون کد سفارشی',
      ],
      'ui_simplifications': [
        'منوی ساده',
        'فرم‌های کوتاه',
        'گزینه‌های محدود',
        'راهنمای مرحله‌ای',
        'بدون تنظیمات پیشرفته',
      ],
    };
  }
  
  // تنظیمات حالت پیشرفته
  static Map<String, dynamic> getAdvancedModeSettings() {
    return {
      'features': [
        'مدیریت کامل محصولات',
        'آنالیز پیشرفته',
        'کد سفارشی CSS/HTML',
        'API دسترسی کامل',
        'اتوماتیک‌سازی',
        'همگام‌سازی با ERP',
        'مدیریت چند فروشگاه',
        'تبلیغات هدفمند',
        'تخفیف‌های هوشمند',
        'گزارش‌های حرفه‌ای',
      ],
      'capabilities': [
        'محصولات نامحدود',
        'تم‌ساز پیشرفته',
        'سئو کامل',
        'ایمیل مارکتینگ',
        'چند زبانه',
        'چند ارزی',
        'مالیات پیشرفته',
        'حمل و نقل پیچیده',
        'سیستم عضویت',
        'وبلاگ و محتوا',
      ],
    };
  }
  
  // Widget سوئیچ تغییر حالت
  static Widget buildModeSwitch(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  _isAdvancedMode ? Icons.rocket_launch : Icons.emoji_people,
                  color: _isAdvancedMode ? Colors.purple : Colors.blue,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _isAdvancedMode ? 'حالت پیشرفته فعال' : 'حالت ساده فعال',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Switch(
                  value: _isAdvancedMode,
                  onChanged: (value) {
                    _isAdvancedMode = value;
                    // برای استفاده در Stateful widget
                  },
                  activeColor: Colors.green,
                ),
              ],
            ),
            
            SizedBox(height: 12),
            
            Text(
              _isAdvancedMode 
                ? 'تمام قابلیت‌های حرفه‌ای در دسترس شماست'
                : 'مناسب برای شروع سریع و آسان',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // بررسی دسترسی به ویژگی بر اساس حالت
  static bool hasAccessToFeature(String feature) {
    final simpleFeatures = getSimpleModeSettings()['features'] as List;
    final advancedFeatures = getAdvancedModeSettings()['features'] as List;
    
    if (_isAdvancedMode) {
      return advancedFeatures.contains(feature);
    } else {
      return simpleFeatures.contains(feature);
    }
  }
  
  // نمایش راهنمای حالت
  static Widget buildModeGuide(BuildContext context) {
    return ExpansionTile(
      title: Text('راهنمای حالت‌ها'),
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildModeComparison(),
              SizedBox(height: 20),
              Text(
                '💡 نکته: همیشه می‌توانید حالت را تغییر دهید',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  static Widget _buildModeComparison() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(2),
      },
      children: [
        TableRow(
          children: [
            _buildModeCell('ویژگی', isHeader: true),
            _buildModeCell('', isHeader: true),
            _buildModeCell('ویژگی', isHeader: true),
          ],
        ),
        ..._createComparisonRows(),
      ],
    );
  }
  
  static List<TableRow> _createComparisonRows() {
    final simple = getSimpleModeSettings()['features'] as List;
    final advanced = getAdvancedModeSettings()['features'] as List;
    
    final maxRows = simple.length > advanced.length ? simple.length : advanced.length;
    
    return List.generate(maxRows, (index) {
      return TableRow(
        children: [
          _buildModeCell(index < simple.length ? '✅ ${simple[index]}' : ''),
          _buildModeCell('🔄'),
          _buildModeCell(index < advanced.length ? '🚀 ${advanced[index]}' : ''),
        ],
      );
    });
  }
  
  static Widget _buildModeCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isHeader ? 14 : 12,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? Colors.blue.shade800 : Colors.grey.shade700,
        ),
      ),
    );
  }
}
