// سیستم سطح‌بندی کاربران با رنگ‌های مشخص

import 'package:flutter/material.dart';

class UserLevelSystem {
  // سطوح کاربری با رنگ‌های مشخص
  static final List<UserLevel> _userLevels = [
    UserLevel(
      id: 1,
      name: 'تازه‌وارد',
      color: Colors.grey,
      minPoints: 0,
      maxPoints: 100,
      icon: Icons.person_outline,
      benefits: ['دسترسی پایه', 'پشتیبانی ایمیل'],
    ),
    UserLevel(
      id: 2,
      name: 'فعال',
      color: Colors.blue,
      minPoints: 100,
      maxPoints: 500,
      icon: Icons.person,
      benefits: ['پشتیبانی تلفنی', '۵ آگهی رایگان'],
    ),
    UserLevel(
      id: 3,
      name: 'نقره‌ای',
      color: Colors.blueGrey,
      minPoints: 500,
      maxPoints: 2000,
      icon: Icons.verified,
      benefits: ['۱۰ آگهی رایگان', 'نمایش ویژه'],
    ),
    UserLevel(
      id: 4,
      name: 'طلایی',
      color: Colors.amber,
      minPoints: 2000,
      maxPoints: 5000,
      icon: Icons.star,
      benefits: ['۲۰ آگهی رایگان', 'پشتیبانی VIP'],
    ),
    UserLevel(
      id: 5,
      name: 'پلاتینیوم',
      color: Colors.teal,
      minPoints: 5000,
      maxPoints: 10000,
      icon: Icons.diamond,
      benefits: ['آگهی نامحدود', 'مشاوره اختصاصی'],
    ),
    UserLevel(
      id: 6,
      name: 'الماس',
      color: Colors.purple,
      minPoints: 10000,
      maxPoints: 999999,
      icon: Icons.workspace_premium,
      benefits: ['همه خدمات رایگان', 'نمایش اولویت دار'],
    ),
  ];
  
  // فاکتورهای کسب امتیاز
  static Map<String, int> getScoreFactors() {
    return {
      'referral_count': 100, // هر معرفی
      'customer_satisfaction': 50, // هر رضایت مثبت
      'successful_sales': 200, // هر فروش موفق
      'product_count': 10, // هر محصول اضافه شده
      'active_days': 5, // هر روز فعال
      'reviews_written': 20, // هر نظر نوشته شده
      'social_shares': 30, // هر اشتراک‌گذاری
      'profile_completeness': 100, // تکمیل پروفایل
      'response_time': 15, // پاسخ سریع به پیام
      'order_completion': 150, // تکمیل سفارش
    };
  }
  
  // محاسبه سطح کاربر
  static UserLevel calculateUserLevel(int totalScore) {
    for (var level in _userLevels) {
      if (totalScore >= level.minPoints && totalScore < level.maxPoints) {
        return level;
      }
    }
    return _userLevels.last; // اگر بیشتر از همه بود، الماس
  }
  
  // Widget نمایش سطح کاربر
  static Widget buildUserLevelCard(BuildContext context, int userScore) {
    final level = calculateUserLevel(userScore);
    final nextLevel = _getNextLevel(level);
    final progress = _calculateProgress(userScore, level);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // سطح فعلی
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: level.color.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: level.color, width: 2),
                  ),
                  child: Icon(level.icon, size: 30, color: level.color),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('سطح فعلی شما:', style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      )),
                      Text(level.name, style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: level.color,
                      )),
                      Text('امتیاز: $userScore', style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      )),
                    ],
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 20),
            
            // نوار پیشرفت
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('پیشرفت به سطح بعدی:', style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                    Text('${(progress * 100).toStringAsFixed(1)}%'),
                  ],
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade200,
                  color: level.color,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(5),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('سطح ${level.name}'),
                    Text('${nextLevel?.name ?? 'بالاترین سطح'}'),
                  ],
                ),
              ],
            ),
            
            SizedBox(height: 20),
            
            // مزایای سطح
            Text('✨ مزایای سطح ${level.name}:', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: 8),
            ...level.benefits.map((benefit) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, size: 16, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(child: Text(benefit)),
                ],
              ),
            )).toList(),
            
            SizedBox(height: 20),
            
            // دکمه مشاهده همه سطوح
            OutlinedButton(
              onPressed: () {
                _showAllLevelsDialog(context);
              },
              child: Text('مشاهده همه سطوح'),
            ),
          ],
        ),
      ),
    );
  }
  
  // Widget نمایش همه سطوح
  static Widget buildAllLevelsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemCount: _userLevels.length,
      itemBuilder: (context, index) {
        final level = _userLevels[index];
        return _buildLevelCard(level);
      },
    );
  }
  
  static Widget _buildLevelCard(UserLevel level) {
    return Card(
      color: level.color.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // آیکون و رنگ سطح
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: level.color.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(color: level.color, width: 2),
              ),
              child: Icon(level.icon, size: 30, color: level.color),
            ),
            
            SizedBox(height: 12),
            
            // نام سطح
            Text(level.name, style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: level.color,
            )),
            
            SizedBox(height: 8),
            
            // محدوده امتیاز
            Text('${level.minPoints} - ${level.maxPoints == 999999 ? '∞' : level.maxPoints}',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            
            SizedBox(height: 12),
            
            // برخی مزایا
            ...level.benefits.take(2).map((benefit) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text('• $benefit',
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
  
  // محاسبه آمار کاربر برای سطح‌بندی
  static Map<String, dynamic> calculateUserStats(String userId) {
    return {
      'user_id': userId,
      'referral_count': 8,
      'customer_satisfaction_rate': 95, // درصد
      'successful_sales': 42,
      'total_products': 15,
      'active_days': 120,
      'reviews_written': 25,
      'social_shares': 18,
      'profile_completeness': 85, // درصد
      'avg_response_time_minutes': 15,
      'orders_completed': 56,
      'total_score': 2450,
      'current_level': calculateUserLevel(2450).name,
      'next_level_score_needed': 5000 - 2450,
    };
  }
  
  // Widget نمایش آمار کاربر
  static Widget buildUserStatsWidget(Map<String, dynamic> stats) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📊 آمار سطح‌بندی شما', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            
            SizedBox(height: 16),
            
            // ردیف اول آمار
            Row(
              children: [
                _buildStatBox('👥', 'معرفی', '${stats['referral_count']} نفر'),
                _buildStatBox('⭐', 'رضایت', '${stats['customer_satisfaction_rate']}%'),
                _buildStatBox('💰', 'فروش', '${stats['successful_sales']} عدد'),
              ],
            ),
            
            SizedBox(height: 12),
            
            // ردیف دوم آمار
            Row(
              children: [
                _buildStatBox('📦', 'محصولات', '${stats['total_products']} عدد'),
                _buildStatBox('📅', 'روز فعال', '${stats['active_days']} روز'),
                _buildStatBox('💬', 'نظرات', '${stats['reviews_written']} عدد'),
              ],
            ),
            
            SizedBox(height: 16),
            
            // امتیاز کل
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade50, Colors.green.shade50],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('🏆 امتیاز کل:', style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                  Text('${stats['total_score']} امتیاز',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildStatBox(String emoji, String label, String value) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(emoji, style: TextStyle(fontSize: 20)),
            SizedBox(height: 4),
            Text(value, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )),
            Text(label, style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            )),
          ],
        ),
      ),
    );
  }
  
  // نمایش دیالوگ همه سطوح
  static void _showAllLevelsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('🎯 همه سطوح کاربری'),
          content: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: buildAllLevelsGrid(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('بستن'),
            ),
          ],
        );
      },
    );
  }
  
  // متدهای کمکی
  static UserLevel? _getNextLevel(UserLevel currentLevel) {
    final index = _userLevels.indexWhere((level) => level.id == currentLevel.id);
    if (index < _userLevels.length - 1) {
      return _userLevels[index + 1];
    }
    return null;
  }
  
  static double _calculateProgress(int score, UserLevel level) {
    final levelRange = level.maxPoints - level.minPoints;
    final progressInLevel = score - level.minPoints;
    return progressInLevel / levelRange;
  }
}

class UserLevel {
  final int id;
  final String name;
  final Color color;
  final int minPoints;
  final int maxPoints;
  final IconData icon;
  final List<String> benefits;
  
  UserLevel({
    required this.id,
    required this.name,
    required this.color,
    required this.minPoints,
    required this.maxPoints,
    required this.icon,
    required this.benefits,
  });
}
