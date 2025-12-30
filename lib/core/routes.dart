// تنظیمات مسیرهای برنامه

import 'package:flutter/material.dart';
import 'package:smart_market/features/smart_market_ai.dart';
import 'package:smart_market/features/free_rewards_system.dart';
import 'package:smart_market/features/user_level_system.dart';
import 'package:smart_market/features/smart_ad_system.dart';
import 'package:smart_market/features/image_ai_analyzer.dart';
import 'package:smart_market/features/shop_themes.dart';
import 'package:smart_market/features/shop_mode_switcher.dart';

class AppRoutes {
  // نام مسیرها
  static const String home = '/';
  static const String smartMarketAI = '/smart-market-ai';
  static const String rewards = '/rewards';
  static const String userLevels = '/user-levels';
  static const String smartAds = '/smart-ads';
  static const String imageAnalysis = '/image-analysis';
  static const String shopThemes = '/shop-themes';
  static const String shopMode = '/shop-mode';
  static const String advancedSearch = '/advanced-search';
  
  // تنظیمات مسیرها
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      home: (context) => HomePage(),
      smartMarketAI: (context) => Scaffold(
        appBar: AppBar(title: Text('هوش بازار')),
        body: SmartMarketAI.buildFreeServicesWidget(context),
      ),
      rewards: (context) => FreeRewardsSystem.buildRewardsDashboard(context),
      userLevels: (context) => Scaffold(
        appBar: AppBar(title: Text('سطح‌بندی کاربری')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              UserLevelSystem.buildUserLevelCard(context, 2450),
              SizedBox(height: 20),
              UserLevelSystem.buildUserStatsWidget(
                UserLevelSystem.calculateUserStats('user123')
              ),
            ],
          ),
        ),
      ),
      smartAds: (context) => Scaffold(
        appBar: AppBar(title: Text('آگهی هوشمند')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SmartAdSystem.buildSmartAdForm(context),
              SizedBox(height: 20),
              SmartAdSystem.buildBoostOptions({}),
            ],
          ),
        ),
      ),
      imageAnalysis: (context) => ImageAIAnalyzer.buildFullImageAnalysisScreen(context),
      shopThemes: (context) => Scaffold(
        appBar: AppBar(title: Text('تم‌های فروشگاه')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: ShopThemeManager.buildThemeSelector(context, (theme) {
            // اعمال تم
          }),
        ),
      ),
      shopMode: (context) => Scaffold(
        appBar: AppBar(title: Text('حالت فروشگاه')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ShopModeManager.buildModeSwitch(context),
              SizedBox(height: 20),
              ShopModeManager.buildModeGuide(context),
            ],
          ),
        ),
      ),
    };
  }
  
  // منوی اصلی features
  static Widget buildFeaturesMenu(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🚀 ویژگی‌های هوشمند', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: 16),
            
            _buildFeatureMenuItem(
              context,
              '🧠 هوش بازار',
              'کمک رایگان به کسب‌وکار',
              smartMarketAI,
              Colors.blue,
            ),
            _buildFeatureMenuItem(
              context,
              '🎁 پاداش‌ها',
              'ماه‌های رایگان و جوایز',
              rewards,
              Colors.green,
            ),
            _buildFeatureMenuItem(
              context,
              '⭐ سطح‌بندی',
              '۶ سطح کاربری با رنگ',
              userLevels,
              Colors.purple,
            ),
            _buildFeatureMenuItem(
              context,
              '📢 آگهی هوشمند',
              'سیستم بهتر از دیوار',
              smartAds,
              Colors.orange,
            ),
            _buildFeatureMenuItem(
              context,
              '📸 تحلیل عکس',
              'تشخیص دسته‌بندی خودکار',
              imageAnalysis,
              Colors.teal,
            ),
            _buildFeatureMenuItem(
              context,
              '🎨 تم‌ها',
              '۵ تم مختلف فروشگاه',
              shopThemes,
              Colors.pink,
            ),
            _buildFeatureMenuItem(
              context,
              '🔄 حالت‌ها',
              'ساده/پیشرفته',
              shopMode,
              Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildFeatureMenuItem(
    BuildContext context,
    String title,
    String subtitle,
    String route,
    Color color,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.arrow_forward, color: color),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 12)),
      trailing: Icon(Icons.chevron_left, color: Colors.grey),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

// صفحه اصلی نمونه
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('بازار هوشمند'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // تنظیمات
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // خوشامدگویی
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('🎉 به بازار هوشمند خوش آمدید!',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Text('پلتفرم کامل خرید و فروش با هوش مصنوعی',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 20),
            
            // منوی features
            AppRoutes.buildFeaturesMenu(context),
            
            SizedBox(height: 20),
            
            // جستجوی پیشرفته
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🔍 جستجوی هوشمند', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                    SizedBox(height: 12),
                    // نمونه جستجو
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'جستجوی محصول...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.camera_alt, color: Colors.blue),
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.imageAnalysis);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.filter_list, color: Colors.orange),
                            onPressed: () {
                              // باز کردن فیلترها
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
