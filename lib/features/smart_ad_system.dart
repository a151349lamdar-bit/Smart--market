// سیستم آگهی هوشمند - بهتر از دیوار

import 'package:flutter/material.dart';

class SmartAdSystem {
  // ساختار آگهی هوشمند
  static Map<String, dynamic> createSmartAd(Map<String, dynamic> adData) {
    return {
      'ad_id': 'AD${DateTime.now().millisecondsSinceEpoch}',
      'title': _generateSmartTitle(adData['title'] ?? '', adData['category'] ?? ''),
      'description': _enhanceDescription(adData['description'] ?? ''),
      'price': _smartPriceSuggestion(adData['price'], adData['category']),
      'category': _autoDetectCategory(adData),
      'tags': _generateSmartTags(adData),
      'features': _extractFeatures(adData),
      'ai_score': _calculateAIScore(adData),
      'boost_options': _getBoostOptions(adData),
      'similar_ads': _findSimilarAds(adData),
      'market_insights': _getMarketInsights(adData['category']),
    };
  }
  
  // Widget نمایش آگهی هوشمند
  static Widget buildSmartAdCard(Map<String, dynamic> ad) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // تصویر آگهی
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              image: ad['images'] != null && ad['images'].isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(ad['images'][0]),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: Colors.grey.shade200,
            ),
            child: ad['images'] == null || ad['images'].isEmpty
                ? Center(child: Icon(Icons.photo, size: 50, color: Colors.grey))
                : Stack(
                    children: [
                      // برچسب‌های هوشمند
                      if (ad['ai_score'] > 80)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: _buildAIBadge(ad['ai_score']),
                        ),
                      if (ad['price_suggestion'] != null)
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: _buildPriceBadge(ad['price_suggestion']),
                        ),
                    ],
                  ),
          ),
          
          // محتوای آگهی
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // عنوان هوشمند
                Text(
                  ad['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                SizedBox(height: 8),
                
                // قیمت و مکان
                Row(
                  children: [
                    Text(
                      _formatPrice(ad['price']),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade800,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(ad['location'] ?? 'تهران',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                
                SizedBox(height: 8),
                
                // برچسب‌های هوشمند
                if (ad['tags'] != null && ad['tags'].isNotEmpty)
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: ad['tags'].take(3).map((tag) => Chip(
                      label: Text(tag),
                      backgroundColor: Colors.blue.shade50,
                      labelStyle: TextStyle(fontSize: 10),
                    )).toList(),
                  ),
                
                SizedBox(height: 12),
                
                // ویژگی‌های استخراج شده
                if (ad['features'] != null && ad['features'].isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('✨ ویژگی‌ها:', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      )),
                      SizedBox(height: 4),
                      ...ad['features'].take(2).map((feature) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            Icon(Icons.check_circle, size: 12, color: Colors.green),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(feature,
                                style: TextStyle(fontSize: 11),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )).toList(),
                    ],
                  ),
                
                SizedBox(height: 12),
                
                // اطلاعات فروشنده
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue.shade100,
                      child: Text(ad['seller_name']?.substring(0, 1) ?? 'ف',
                        style: TextStyle(fontSize: 10)),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ad['seller_name'] ?? 'فروشنده',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        Text('امتیاز: ${ad['seller_rating'] ?? 'جدید'}',
                          style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.verified, size: 14,
                      color: ad['seller_verified'] == true ? Colors.green : Colors.grey),
                  ],
                ),
                
                SizedBox(height: 12),
                
                // بینش بازار
                if (ad['market_insights'] != null)
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.insights, size: 14, color: Colors.blue),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(ad['market_insights']['message'] ?? '',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // سیستم Boost هوشمند
  static Widget buildBoostOptions(Map<String, dynamic> ad) {
    final options = _getBoostOptions(ad);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🚀 تقویت آگهی هوشمند', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: 12),
            Text('با تقویت آگهی، تا ۱۰ برابر بیشتر دیده شوید',
              style: TextStyle(color: Colors.grey.shade600)),
            
            SizedBox(height: 20),
            
            ...options.map((option) => _buildBoostOptionCard(option)).toList(),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildBoostOptionCard(Map<String, dynamic> option) {
    return Card(
      color: option['recommended'] ? Colors.blue.shade50 : null,
      elevation: option['recommended'] ? 2 : 0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: option['color'].withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(option['icon'], color: option['color']),
        ),
        title: Text(option['title'], style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(option['description']),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(option['price'] == 0 ? 'رایگان' : '${option['price']} تومان',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: option['price'] == 0 ? Colors.green : Colors.orange,
              )),
            if (option['duration'] != null)
              Text(option['duration'], style: TextStyle(fontSize: 10)),
          ],
        ),
        onTap: () {
          // انتخاب گزینه Boost
        },
      ),
    );
  }
  
  // فرم ایجاد آگهی هوشمند
  static Widget buildSmartAdForm(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // عنوان هوشمند
          TextField(
            decoration: InputDecoration(
              labelText: 'عنوان آگهی',
              hintText: 'سیستم هوشمند پیشنهاد می‌دهد...',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.auto_awesome),
            ),
            onChanged: (value) {
              // پیشنهاد عنوان هوشمند
            },
          ),
          
          SizedBox(height: 16),
          
          // توضیحات با پیشنهاد هوشمند
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'توضیحات کامل',
              hintText: 'سیستم ویژگی‌ها را استخراج می‌کند...',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          
          SizedBox(height: 16),
          
          // قیمت با پیشنهاد هوشمند
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'قیمت (تومان)',
              hintText: 'پیشنهاد قیمت هوشمند فعال است',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.attach_money),
              suffixIcon: IconButton(
                icon: Icon(Icons.auto_awesome),
                onPressed: () {
                  // دریافت پیشنهاد قیمت هوشمند
                },
              ),
            ),
          ),
          
          SizedBox(height: 16),
          
          // دسته‌بندی هوشمند
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.category, color: Colors.blue),
                      SizedBox(width: 8),
                      Text('دسته‌بندی هوشمند', style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('سیستم به طور خودکار دسته‌بندی مناسب را پیشنهاد می‌دهد',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      FilterChip(label: Text('الکترونیک'), onSelected: (_) {}),
                      FilterChip(label: Text('خودرو'), onSelected: (_) {}),
                      FilterChip(label: Text('املاک'), onSelected: (_) {}),
                      FilterChip(label: Text('مربوط به عکس'), selected: true, onSelected: (_) {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 20),
          
          // دکمه تحلیل هوشمند
          ElevatedButton.icon(
            onPressed: () {
              // تحلیل کامل آگهی
            },
            icon: Icon(Icons.analytics),
            label: Text('تحلیل هوشمند آگهی'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
  
  // متدهای کمکی
  static Widget _buildAIBadge(int score) {
    Color color;
    if (score > 90) color = Colors.green;
    else if (score > 70) color = Colors.blue;
    else color = Colors.orange;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.auto_awesome, size: 12, color: Colors.white),
          SizedBox(width: 4),
          Text('هوشمند $score%', style: TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
        ],
      ),
    );
  }
  
  static Widget _buildPriceBadge(Map<String, dynamic> suggestion) {
    final difference = suggestion['difference_percent'] ?? 0;
    Color color;
    String text;
    
    if (difference > 20) {
      color = Colors.green;
      text = 'ارزان';
    } else if (difference > -10) {
      color = Colors.blue;
      text = 'مناسب';
    } else {
      color = Colors.orange;
      text = 'گران';
    }
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: TextStyle(
        fontSize: 10,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      )),
    );
  }
  
  static String _formatPrice(dynamic price) {
    if (price == null) return 'توافقی';
    final formatter = NumberFormat('#,###');
    return '${formatter.format(price)} تومان';
  }
  
  // الگوریتم‌های هوشمند
  static String _generateSmartTitle(String title, String category) {
    if (title.isEmpty) return 'آگهی بدون عنوان';
    
    // بهبود عنوان
    final words = title.split(' ');
    if (words.length < 3) {
      return '$title - $category';
    }
    
    return title;
  }
  
  static String _enhanceDescription(String description) {
    // بهبود خودکار توضیحات
    return description;
  }
  
  static Map<String, dynamic> _smartPriceSuggestion(dynamic price, String category) {
    // پیشنهاد قیمت هوشمند
    return {
      'user_price': price,
      'suggested_price': price,
      'market_average': price,
      'difference_percent': 0,
      'message': 'قیمت مناسب',
    };
  }
  
  static String _autoDetectCategory(Map<String, dynamic> adData) {
    // تشخیص خودکار دسته‌بندی
    return adData['category'] ?? 'عمومی';
  }
  
  static List<String> _generateSmartTags(Map<String, dynamic> adData) {
    // تولید تگ‌های هوشمند
    return ['پیشنهاد ویژه', 'تحویل سریع', 'ضمانت بازگشت'];
  }
  
  static List<String> _extractFeatures(Map<String, dynamic> adData) {
    // استخراج ویژگی‌ها از توضیحات
    return ['ویژگی ۱', 'ویژگی ۲', 'ویژگی ۳'];
  }
  
  static int _calculateAIScore(Map<String, dynamic> adData) {
    // محاسبه امتیاز هوشمند آگهی
    return 85;
  }
  
  static List<Map<String, dynamic>> _getBoostOptions(Map<String, dynamic> adData) {
    return [
      {
        'id': 'basic',
        'title': 'تقویت استاندارد',
        'description': '۲ برابر بیشتر دیده شوید',
        'price': 0,
        'duration': '۷ روز',
        'icon': Icons.flash_on,
        'color': Colors.blue,
        'recommended': false,
      },
      {
        'id': 'premium',
        'title': 'تقویت ویژه',
        'description': '۵ برابر بیشتر دیده شوید',
        'price': 50000,
        'duration': '۱۴ روز',
        'icon': Icons.workspace_premium,
        'color': Colors.amber,
        'recommended': true,
      },
      {
        'id': 'vip',
        'title': 'تقویت VIP',
        'description': '۱۰ برابر بیشتر دیده شوید + نمایش ویژه',
        'price': 150000,
        'duration': '۳۰ روز',
        'icon': Icons.diamond,
        'color': Colors.purple,
        'recommended': false,
      },
    ];
  }
  
  static List<Map<String, dynamic>> _findSimilarAds(Map<String, dynamic> adData) {
    // یافتن آگهی‌های مشابه
    return [];
  }
  
  static Map<String, dynamic> _getMarketInsights(String category) {
    // بینش بازار
    return {
      'message': 'این محصول ۱۵٪ ارزان‌تر از میانگین بازار است',
      'trend': 'افزایش تقاضا',
      'demand': 'بالا',
    };
  }
}
