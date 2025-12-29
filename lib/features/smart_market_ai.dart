// بازار هوشمند - کمک رایگان به کسب‌وکار و مردم

import 'package:flutter/material.dart';

class SmartMarketAI {
  // ۱. کمک رایگان به کسب‌وکار افراد
  static Map<String, dynamic> getFreeBusinessHelp(String businessType) {
    return {
      'free_services': [
        '🎯 قیمت‌گذاری هوشمند رایگان',
        '📊 تحلیل بازار رایگان',
        '📱 فروشگاه آنلاین رایگان',
        '🤝 مشاوره اولیه رایگان',
        '📚 آموزش رایگان فروش',
        '🔍 بررسی رقبای رایگان',
        '💡 ایده‌های کسب‌وکار رایگان',
      ],
      'no_costs': [
        '❌ هیچ هزینه عضویتی',
        '❌ هیچ هزینه مشاوره',
        '❌ هیچ هزینه پشتیبانی',
        '❌ هیچ کمیسیون فروش',
        '❌ هیچ هزینه تبلیغات اجباری',
      ],
      'revenue_model': [
        '✅ تنها درآمد ما: تبلیغات اختیاری',
        '✅ تبلیغات مرتبط و مفید',
        '✅ امکان مخفی کردن تبلیغات',
        '✅ درآمد از تبلیغات به اشتراک گذاشته با فروشندگان موفق',
      ],
    };
  }
  
  // ۲. سیستم پاداش رایگان
  static Map<String, dynamic> getFreeRewardSystem() {
    return {
      'free_for_everyone': [
        '🆓 ۶ ماه رایگان برای همه',
        '🆓 فروشگاه آنلاین رایگان',
        '🆓 پشتیبانی رایگان',
        '🆓 آموزش رایگان',
      ],
      'social_rewards': [
        '📱 معرفی به دوستان: +۳ ماه رایگان',
        '📢 اشتراک در استوری: +۱ ماه رایگان',
        '⭐ امتیازدهی به برنامه: +۱۵ روز رایگان',
        '💬 نظر مفید: +۱۰ روز رایگان',
      ],
      'gamification': [
        '🎮 امتیازهای رایگان برای فعالیت',
        '🏆 جایزه‌های غیرنقدی',
        '🎁 هدایای تبلیغاتی',
        '🎯 چالش‌های رایگان',
      ],
    };
  }
  
  // ۳. مزایای رایگان برای مردم
  static Map<String, dynamic> getFreeBenefitsForPeople() {
    return {
      'buyers': [
        '🔍 جستجوی رایگان',
        '💰 مقایسه قیمت رایگان',
        '🛡️ تضمین بازگشت وجه',
        '⭐ بررسی امتیاز واقعی',
      ],
      'sellers': [
        '📦 فروش رایگان',
        '📊 آمار رایگان',
        '💬 چت رایگان با خریدار',
        '🎯 پیشنهاد قیمت رایگان',
      ],
    };
  }
  
  // Widget نمایش خدمات رایگان
  static Widget buildFreeServicesWidget(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.celebration, color: Colors.green),
                SizedBox(width: 8),
                Text('همه خدمات رایگان است!', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                )),
              ],
            ),
            
            SizedBox(height: 16),
            
            Text('💰 مدل درآمدی ما:', style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: 8),
            Text('تنها از تبلیغات اختیاری کسب درآمد می‌کنیم',
              style: TextStyle(color: Colors.grey.shade700),
            ),
            
            SizedBox(height: 24),
            
            // خدمات رایگان
            _buildServiceItem(
              '🛒 فروشگاه آنلاین',
              'رایگان برای همیشه',
              Colors.blue,
            ),
            _buildServiceItem(
              '📊 تحلیل بازار',
              'رایگان و هوشمند',
              Colors.green,
            ),
            _buildServiceItem(
              '🎓 آموزش فروش',
              'رایگان و کامل',
              Colors.orange,
            ),
            _buildServiceItem(
              '🤝 پشتیبانی',
              'رایگان ۲۴/۷',
              Colors.purple,
            ),
            
            SizedBox(height: 16),
            
            Divider(),
            
            SizedBox(height: 16),
            
            // تبلیغات اختیاری
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.yellow.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.yellow.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.ads_click, color: Colors.orange),
                      SizedBox(width: 8),
                      Text('تبلیغات اختیاری', style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('• فقط تبلیغات مرتبط با نیاز شما'),
                  Text('• امکان مخفی کردن تبلیغات'),
                  Text('• درآمد حاصل صرف بهبود خدمات می‌شود'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildServiceItem(String title, String subtitle, Color color) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Text(title.substring(0, 2), 
          style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Chip(
        label: Text('رایگان'),
        backgroundColor: Colors.green.shade50,
        labelStyle: TextStyle(color: Colors.green),
      ),
    );
  }
  
  // Widget سیستم پاداش رایگان
  static Widget buildFreeRewardsWidget(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🎁 پاداش‌های رایگان', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            
            SizedBox(height: 16),
            
            // جدول زمان‌های رایگان
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildRewardRow('👤 کاربر جدید', '۶ ماه رایگان'),
                  Divider(height: 1),
                  _buildRewardRow('👥 معرفی دوست', '+۳ ماه رایگان'),
                  Divider(height: 1),
                  _buildRewardRow('📱 اشتراک استوری', '+۱ ماه رایگان'),
                  Divider(height: 1),
                  _buildRewardRow('⭐ امتیاز ۵ ستاره', '+۱۵ روز رایگان'),
                  Divider(height: 1),
                  _buildRewardRow('💬 نظر مفید', '+۱۰ روز رایگان'),
                ],
              ),
            ),
            
            SizedBox(height: 16),
            
            // وضعیت فعلی کاربر
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade50, Colors.green.shade50],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.celebration, size: 40, color: Colors.orange),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('وضعیت فعلی شما:', style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                        SizedBox(height: 4),
                        Text('🎉 ۹ ماه رایگان باقی مانده',
                          style: TextStyle(fontSize: 16, color: Colors.green.shade800)),
                        SizedBox(height: 4),
                        Text('📅 تا دی ۱۴۰۴',
                          style: TextStyle(color: Colors.grey.shade600)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 16),
            
            // دکمه دعوت از دوستان
            ElevatedButton.icon(
              onPressed: () {
                // دعوت از دوستان
              },
              icon: Icon(Icons.group_add),
              label: Text('دعوت از دوستان و دریافت ۳ ماه رایگان'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildRewardRow(String action, String reward) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Expanded(child: Text(action)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(reward, style: TextStyle(
              color: Colors.green.shade800,
              fontWeight: FontWeight.bold,
            )),
          ),
        ],
      ),
    );
  }
}
