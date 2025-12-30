// فهرست همه feature های پروژه

// ۱. سیستم‌های اصلی
export 'shop_mode_switcher.dart';    // تغییر حالت ساده/پیشرفته
export 'shop_themes.dart';          // تم‌های فروشگاه
export 'advanced_search.dart';      // جستجوی پیشرفته
export 'smart_market_ai.dart';      // هوش بازار رایگان
export 'free_rewards_system.dart';  // سیستم پاداش رایگان
export 'user_level_system.dart';    // سطح‌بندی کاربران
export 'smart_ad_system.dart';      // آگهی هوشمند
export 'image_ai_analyzer.dart';    // تحلیل عکس با AI

// ۲. کامپوننت‌های آماده
class SmartFeatures {
  // ایجاد نمونه از همه feature ها
  static Map<String, dynamic> getAllFeatures() {
    return {
      'shop_mode': 'سیستم دوحالته فروشگاه',
      'shop_themes': '۵ تم مختلف فروشگاه',
      'advanced_search': 'جستجوی متن، عکس و مکان',
      'market_ai': 'هوش بازار برای کسب‌وکار',
      'rewards': 'سیستم پاداش رایگان',
      'user_levels': '۶ سطح کاربری با رنگ',
      'smart_ads': 'سیستم آگهی هوشمند',
      'image_ai': 'تحلیل عکس خودکار',
    };
  }
  
  // بررسی فعال بودن feature ها
  static Map<String, bool> checkFeatureAvailability() {
    return {
      'shop_mode': true,
      'shop_themes': true,
      'advanced_search': true,
      'market_ai': true,
      'rewards': true,
      'user_levels': true,
      'smart_ads': true,
      'image_ai': true,
    };
  }
  
  // راهنمای استفاده از features
  static Map<String, String> getFeatureUsageGuide() {
    return {
      'shop_mode': 'برای تغییر حالت، به تنظیمات فروشگاه بروید',
      'shop_themes': 'تم مورد نظر را از بخش طراحی انتخاب کنید',
      'advanced_search': 'در نوار جستجو از آیکون‌های اضافی استفاده کنید',
      'market_ai': 'در داشبورد کسب‌وکار موجود است',
      'rewards': 'در بخش پاداش‌های من مشاهده کنید',
      'user_levels': 'در پروفایل کاربری نمایش داده می‌شود',
      'smart_ads': 'هنگام ایجاد آگهی فعال می‌شود',
      'image_ai': 'هنگام آپلود عکس محصول فعال می‌شود',
    };
  }
}
