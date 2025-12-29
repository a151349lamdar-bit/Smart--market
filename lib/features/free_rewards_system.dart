// سیستم پاداش رایگان کامل

import 'package:flutter/material.dart';

class FreeRewardsSystem {
  // انواع پاداش‌های رایگان
  static Map<String, dynamic> getAllRewards() {
    return {
      'free_months_system': {
        'new_user': {'months': 6, 'description': '۶ ماه رایگان برای کاربر جدید'},
        'referral': {'months': 3, 'description': '۳ ماه رایگان برای معرفی هر دوست'},
        'story_share': {'months': 1, 'description': '۱ ماه رایگان برای اشتراک در استوری'},
        'app_review': {'months': 0.5, 'description': '۱۵ روز رایگان برای امتیاز ۵ ستاره'},
        'helpful_comment': {'months': 0.33, 'description': '۱۰ روز رایگان برای نظر مفید'},
        'first_sale': {'months': 2, 'description': '۲ ماه رایگان برای اولین فروش'},
        'first_purchase': {'months': 1, 'description': '۱ ماه رایگان برای اولین خرید'},
      },
      'social_rewards': [
        {'action': 'share_on_instagram', 'reward': '۱ ماه رایگان + هدیه ویژه'},
        {'action': 'share_on_telegram', 'reward': '۱۵ روز رایگان'},
        {'action': 'share_on_twitter', 'reward': '۱۰ روز رایگان'},
        {'action': 'create_video_review', 'reward': '۳ ماه رایگان'},
      ],
      'gamification_rewards': [
        {'points': 1000, 'reward': '۱۰,۰۰۰ تومان تخفیف تبلیغات'},
        {'points': 2000, 'reward': '۲۰,۰۰۰ تومان تخفیف تبلیغات'},
        {'points': 5000, 'reward': '۵۰,۰۰۰ تومان تخفیف تبلیغات'},
        {'points': 10000, 'reward': 'هدیه ویژه + مصاحبه اختصاصی'},
      ],
      'loyalty_program': [
        {'level': 'برنز', 'requirements': '۳ ماه فعالیت', 'rewards': 'پشتیبانی ویژه'},
        {'level': 'نقره', 'requirements': '۶ ماه فعالیت', 'rewards': 'تبلیغات رایگان محدود'},
        {'level': 'طلایی', 'requirements': '۱ سال فعالیت', 'rewards': 'تبلیغات رایگان + مشاوره'},
        {'level': 'پلاتینیوم', 'requirements': '۲ سال فعالیت', 'rewards': 'همه خدمات رایگان دائمی'},
      ],
    };
  }
  
  // محاسبه وضعیت پاداش کاربر
  static Map<String, dynamic> calculateUserRewards(String userId) {
    return {
      'user_id': userId,
      'free_months_remaining': 9,
      'free_months_expiry': '۱۴۰۴/۱۰/۱۵',
      'referral_code': 'SMART${userId.substring(0, 6).toUpperCase()}',
      'referral_count': 3,
      'total_rewards': {
        'free_months_earned': 12,
        'free_months_used': 3,
        'social_shares': 5,
        'app_reviews': 2,
        'helpful_comments': 8,
      },
      'available_rewards': [
        '۳ ماه رایگان (معرفی دوستان)',
        '۱ ماه رایگان (اشتراک استوری)',
        '۱۵ روز رایگان (امتیاز ۵ ستاره)',
        '۵۰,۰۰۰ تومان تخفیف تبلیغات (۵۰۰۰ امتیاز)',
      ],
      'next_rewards': [
        {'action': 'معرفی ۲ دوست دیگر', 'reward': '۶ ماه رایگان اضافی'},
        {'action': '۱۰ نظر مفید', 'reward': '۱ ماه رایگان'},
        {'action': 'رسیدن به ۱۰۰۰۰ امتیاز', 'reward': 'هدیه ویژه'},
      ],
    };
  }
  
  // سیستم امتیازدهی
  static Map<String, int> getPointsSystem() {
    return {
      'daily_login': 10,
      'add_product': 50,
      'make_sale': 100,
      'make_purchase': 30,
      'write_review': 20,
      'helpful_comment': 25,
      'share_on_social': 40,
      'refer_friend': 150,
      'complete_profile': 30,
      'verify_phone': 50,
      'verify_email': 30,
      'first_sale_bonus': 500,
      'first_purchase_bonus': 300,
      'monthly_active_bonus': 200,
    };
  }
  
  // Widget نمایش داشبورد پاداش
  static Widget buildRewardsDashboard(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🎁 پاداش‌های رایگان شما'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // کارت وضعیت فعلی
            _buildStatusCard(),
            SizedBox(height: 20),
            
            // پاداش‌های فعال
            _buildActiveRewards(),
            SizedBox(height: 20),
            
            // روش‌های کسب پاداش
            _buildWaysToEarn(),
            SizedBox(height: 20),
            
            // تاریخچه پاداش‌ها
            _buildRewardsHistory(),
            SizedBox(height: 20),
            
            // دعوت از دوستان
            _buildReferralSection(),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildStatusCard() {
    return Card(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.celebration, size: 40, color: Colors.orange),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('وضعیت پاداش شما', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                      SizedBox(height: 4),
                      Text('🎉 ۹ ماه رایگان باقی مانده',
                        style: TextStyle(fontSize: 24, color: Colors.green.shade800)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('۲,۵۰۰', 'امتیاز کل'),
                _buildStatItem('۱۲', 'ماه رایگان کسب شده'),
                _buildStatItem('۳', 'دوست معرفی شده'),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(value, style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue.shade800,
        )),
        SizedBox(height: 4),
        Text(label, style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade600,
        )),
      ],
    );
  }
  
  static Widget _buildActiveRewards() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🎯 پاداش‌های فعال شما', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: 16),
            _buildRewardItem('۶ ماه رایگان عضویت', 'تا ۱۴۰۴/۱۰/۱۵', Colors.green),
            _buildRewardItem('۳ ماه رایگان معرفی', 'تا ۱۴۰۴/۰۸/۲۰', Colors.blue),
            _buildRewardItem('۵۰,۰۰۰ تومان تخفیف تبلیغات', 'تا ۱۴۰۴/۰۹/۱۰', Colors.orange),
            _buildRewardItem('پشتیبانی ویژه سطح طلایی', 'همیشگی', Colors.purple),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildRewardItem(String title, String expiry, Color color) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.card_giftcard, color: color),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('انقضا: $expiry'),
      trailing: Chip(
        label: Text('فعال'),
        backgroundColor: Colors.green.shade50,
        labelStyle: TextStyle(color: Colors.green),
      ),
    );
  }
  
  static Widget _buildWaysToEarn() {
    final ways = [
      {'icon': Icons.group_add, 'title': 'معرفی دوستان', 'points': '۳ ماه رایگان'},
      {'icon': Icons.share, 'title': 'اشتراک در استوری', 'points': '۱ ماه رایگان'},
      {'icon': Icons.star, 'title': 'امتیاز ۵ ستاره', 'points': '۱۵ روز رایگان'},
      {'icon': Icons.comment, 'title': 'نظر مفید', 'points': '۱۰ روز رایگان'},
      {'icon': Icons.shopping_cart, 'title': 'اولین خرید', 'points': '۱ ماه رایگان'},
      {'icon': Icons.store, 'title': 'اولین فروش', 'points': '۲ ماه رایگان'},
    ];
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('💎 روش‌های کسب پاداش', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
              ),
              itemCount: ways.length,
              itemBuilder: (context, index) {
                final way = ways[index];
                return _buildWayToEarnCard(way);
              },
            ),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildWayToEarnCard(Map<String, dynamic> way) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(way['icon'], size: 24, color: Colors.blue),
            SizedBox(height: 8),
            Text(way['title'], 
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(way['points'],
              style: TextStyle(fontSize: 11, color: Colors.green.shade700),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildRewardsHistory() {
    final history = [
      {'date': '۱۴۰۴/۰۷/۱۵', 'action': 'عضویت اولیه', 'reward': '۶ ماه رایگان'},
      {'date': '۱۴۰۴/۰۷/۲۰', 'action': 'معرفی دوست', 'reward': '۳ ماه رایگان'},
      {'date': '۱۴۰۴/۰۸/۰۵', 'action': 'اشتراک استوری', 'reward': '۱ ماه رایگان'},
      {'date': '۱۴۰۴/۰۸/۱۰', 'action': 'امتیاز ۵ ستاره', 'reward': '۱۵ روز رایگان'},
    ];
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('📊 تاریخچه پاداش‌ها', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('مشاهده همه'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ...history.map((item) => _buildHistoryItem(item)).toList(),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildHistoryItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.history, size: 20, color: Colors.blue),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['action'], style: TextStyle(fontWeight: FontWeight.bold)),
                Text(item['date'], style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Chip(
            label: Text(item['reward']),
            backgroundColor: Colors.green.shade50,
            labelStyle: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
  
  static Widget _buildReferralSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(Icons.group_add, size: 50, color: Colors.blue),
            SizedBox(height: 16),
            Text('دوستانت را دعوت کن', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: 8),
            Text('به ازای هر دوستی که دعوت کنی، هر دو ۳ ماه رایگان دریافت می‌کنید',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(height: 20),
            
            // کد معرف
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text('کد معرف شما:', style: TextStyle(color: Colors.grey.shade600)),
                  SizedBox(height: 8),
                  Text('SMART-FREE-6MONTHS', style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  )),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            // دکمه‌های اشتراک‌گذاری
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.content_copy),
                    label: Text('کپی لینک'),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.share),
                    label: Text('اشتراک‌گذاری'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  // ایجاد لینک دعوت
  static String generateReferralLink(String userId, String referralCode) {
    return 'https://market.ir/invite?ref=$referralCode&user=$userId';
  }
  
  // محاسبه پاداش دعوت
  static Map<String, dynamic> calculateReferralReward(int referralCount) {
    final months = 3 * referralCount;
    return {
      'referral_count': referralCount,
      'free_months_earned': months,
      'message': '🎉 شما $months ماه رایگان از طریق معرفی دوستان کسب کردید!',
      'next_milestone': {
        'target': referralCount + 5,
        'reward': '۱۵ ماه رایگان + هدیه ویژه',
      },
    };
  }
}
