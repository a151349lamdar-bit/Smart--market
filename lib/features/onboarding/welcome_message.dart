// متن زیبا و دلنشین خوشامدگویی

import 'package:flutter/material.dart';

class WelcomeMessage {
  // متن‌های زیبا برای نمایش در ابتدای برنامه
  static List<Map<String, dynamic>> getWelcomeMessages() {
    return [
      {
        'title': '🌟 به خانواده بازار هوشمند خوش آمدی!',
        'message': 'جایی که هر خرید، یک تجربه لذت‌بخش است',
        'icon': Icons.emoji_emotions,
        'color': Colors.amber,
      },
      {
        'title': '🚀 فروشگاهت را همین امروز راه‌اندازی کن!',
        'message': 'با هوش مصنوعی ما، بهترین قیمت را پیشنهاد می‌دهیم',
        'icon': Icons.rocket_launch,
        'color': Colors.purple,
      },
      {
        'title': '💎 مزایای ویژه برای تو',
        'message': '۶ ماه رایگان • قیمت‌گذاری هوشمند • پشتیبانی ۲۴ ساعته',
        'icon': Icons.diamond,
        'color': Colors.teal,
      },
    ];
  }
  
  // Widget نمایش پیام خوشامدگویی (پس از اجرا نمایش داده می‌شود و محو می‌شود)
  static Widget buildWelcomeOverlay(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue.shade50,
            Colors.white,
            Colors.green.shade50,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // لوگو یا آیکون زیبا
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                Icons.shopping_bag,
                size: 60,
                color: Colors.white,
              ),
            ),
            
            SizedBox(height: 32),
            
            // عنوان اصلی
            Text(
              'به بازار هوشمند خوش آمدید',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 16),
            
            // متن دلنشین
            Text(
              'جایی که رویاهای خرید و فروش به واقعیت می‌پیوندد\n'
              'با تکنولوژی هوشمند و تجربه‌ای بی‌نظیر',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 32),
            
            // لیست مزایا با انیمیشن
            Column(
              children: [
                _buildBenefitItem(
                  icon: Icons.auto_awesome,
                  title: 'قیمت‌گذاری هوشمند',
                  subtitle: 'با AI بهترین قیمت را دریافت کنید',
                ),
                _buildBenefitItem(
                  icon: Icons.security,
                  title: 'امنیت ۱۰۰٪',
                  subtitle: 'خرید و فروش با خیال راحت',
                ),
                _buildBenefitItem(
                  icon: Icons.flash_on,
                  title: 'سرعت فوق‌العاده',
                  subtitle: 'تجربه کاربری سریع و روان',
                ),
                _buildBenefitItem(
                  icon: Icons.support_agent,
                  title: 'پشتیبانی ۲۴/۷',
                  subtitle: 'همیشه در کنار شما هستیم',
                ),
              ],
            ),
            
            SizedBox(height: 40),
            
            // دکمه ادامه
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    // محو شدن پیام
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    child: Text(
                      'شروع سفر هوشمند',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 20),
            
            // متن پایین
            Text(
              'با یک کلیک، دنیایی از فرصت‌ها رو به روی شماست',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildBenefitItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 28,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // متن کوتاه برای اسپلش اسکرین
  static String getSplashMessage() {
    return '''
💫 بازار هوشمند 💫

خرید آسان، فروش سریع
با هوش مصنوعی پیشرفته

⚡ تجربه‌ای نو در خرید و فروش
🛡️ امنیت تضمین شده
🤝 جامعه‌ای از خریداران و فروشندگان

آماده‌ای برای شروع؟
''';
  }
  
  // متن تشکر پس از اولین خرید
  static String getFirstPurchaseThankYou() {
    return '''
🎉 اولین خریدت رو انجام دادی! 🎉

از اعتمادت سپاسگزاریم
امیدواریم از خریدت راضی باشی

💝 هدیه ویژه: کد تخفیف ۲۰٪ برای خرید بعدی
🎁 کد: WELCOME20

با احترام،
تیم بازار هوشمند
''';
  }
  
  // متن تشویقی برای فروشندگان
  static String getSellerMotivation() {
    return '''
🏆 به فروشندگان برتر می‌پیوندی!

با بازار هوشمند:
💰 درآمدت رو افزایش بده
⭐ اعتبارت رو بساز
📈 کسب‌وکارت رو رشد بده

🎯 همین الان اولین محصولت رو اضافه کن
🔥 اولین ۱۰۰ فروش: مشاوره رایگان مدیریت فروش

برنده شدن از همینجا شروع می‌شه!
''';
  }
}
