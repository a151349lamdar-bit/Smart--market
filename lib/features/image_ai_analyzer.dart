// تحلیل عکس با هوش مصنوعی - تشخیص دسته‌بندی خودکار

import 'package:flutter/material.dart';

class ImageAIAnalyzer {
  // تحلیل عکس و تشخیص دسته‌بندی
  static Future<Map<String, dynamic>> analyzeImage(String imagePath) async {
    // شبیه‌سازی تحلیل AI
    await Future.delayed(Duration(seconds: 2));
    
    // نتایج شبیه‌سازی شده
    return {
      'success': true,
      'image_path': imagePath,
      'detected_objects': [
        {'name': 'گوشی موبایل', 'confidence': 92},
        {'name': 'مانیتور', 'confidence': 87},
        {'name': 'لپ‌تاپ', 'confidence': 76},
      ],
      'suggested_categories': [
        {'name': 'الکترونیک', 'confidence': 95, 'reason': 'تشخیص وسایل الکترونیکی'},
        {'name': 'موبایل و تبلت', 'confidence': 90, 'reason': 'تشخیص گوشی موبایل'},
        {'name': 'کامپیوتر و لپ‌تاپ', 'confidence': 85, 'reason': 'تشخیص لپ‌تاپ'},
      ],
      'extracted_features': [
        'وسایل الکترونیکی',
        'رنگ مشکی',
        'وضعیت نو',
        'برند احتمالی: سامسونگ یا اپل',
      ],
      'price_suggestion': {
        'range': '۵,۰۰۰,۰۰۰ - ۸,۰۰۰,۰۰۰ تومان',
        'confidence': 78,
        'reason': 'بر اساس محصولات مشابه در بازار',
      },
      'title_suggestion': 'گوشی موبایل و لپ‌تاپ در وضعیت عالی',
      'description_suggestion': 'وسایل الکترونیکی با کیفیت، رنگ مشکی، وضعیت نو',
      'tags_suggestion': ['الکترونیک', 'موبایل', 'لپ‌تاپ', 'نو', 'با کیفیت'],
      'ai_confidence': 88,
    };
  }
  
  // Widget تحلیل عکس
  static Widget buildImageAnalysisWidget(BuildContext context, String imagePath) {
    return FutureBuilder<Map<String, dynamic>>(
      future: analyzeImage(imagePath),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingWidget();
        }
        
        if (snapshot.hasError || !snapshot.data!['success']) {
          return _buildErrorWidget();
        }
        
        final results = snapshot.data!;
        return _buildResultsWidget(results);
      },
    );
  }
  
  static Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('در حال تحلیل عکس با هوش مصنوعی...'),
          SizedBox(height: 8),
          Text('لطفا کمی صبر کنید',
            style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
  
  static Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 50, color: Colors.red),
          SizedBox(height: 16),
          Text('خطا در تحلیل عکس'),
          SizedBox(height: 8),
          Text('لطفا عکس واضح‌تری انتخاب کنید',
            style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
  
  static Widget _buildResultsWidget(Map<String, dynamic> results) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // هدر نتایج
          Row(
            children: [
              Icon(Icons.auto_awesome, color: Colors.blue),
              SizedBox(width: 8),
              Text('نتایج تحلیل هوش مصنوعی', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
              Spacer(),
              Chip(
                label: Text('${results['ai_confidence']}% اطمینان'),
                backgroundColor: Colors.green.shade50,
              ),
            ],
          ),
          
          SizedBox(height: 20),
          
          // اشیاء تشخیص داده شده
          Text('🔍 اشیاء تشخیص داده شده:', style: TextStyle(
            fontWeight: FontWeight.bold,
          )),
          SizedBox(height: 8),
          ..._buildDetectedObjects(results['detected_objects']),
          
          SizedBox(height: 20),
          
          // دسته‌بندی‌های پیشنهادی
          Text('📂 دسته‌بندی پیشنهادی:', style: TextStyle(
            fontWeight: FontWeight.bold,
          )),
          SizedBox(height: 8),
          ..._buildSuggestedCategories(results['suggested_categories']),
          
          SizedBox(height: 20),
          
          // ویژگی‌های استخراج شده
          Text('✨ ویژگی‌های استخراج شده:', style: TextStyle(
            fontWeight: FontWeight.bold,
          )),
          SizedBox(height: 8),
          ..._buildExtractedFeatures(results['extracted_features']),
          
          SizedBox(height: 20),
          
          // پیشنهاد قیمت
          _buildPriceSuggestion(results['price_suggestion']),
          
          SizedBox(height: 20),
          
          // پیشنهاد عنوان و توضیحات
          _buildTitleDescriptionSuggestions(results),
        ],
      ),
    );
  }
  
  static List<Widget> _buildDetectedObjects(List<dynamic> objects) {
    return objects.map((obj) {
      final confidence = obj['confidence'] as int;
      return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _getConfidenceColor(confidence).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.check, color: _getConfidenceColor(confidence)),
        ),
        title: Text(obj['name']),
        trailing: Chip(
          label: Text('${confidence}%'),
          backgroundColor: _getConfidenceColor(confidence).withOpacity(0.2),
        ),
      );
    }).toList();
  }
  
  static List<Widget> _buildSuggestedCategories(List<dynamic> categories) {
    return categories.map((cat) {
      final confidence = cat['confidence'] as int;
      return Card(
        color: confidence > 80 ? Colors.green.shade50 : Colors.blue.shade50,
        child: ListTile(
          leading: Icon(
            confidence > 80 ? Icons.recommend : Icons.lightbulb_outline,
            color: confidence > 80 ? Colors.green : Colors.blue,
          ),
          title: Text(cat['name'], style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(cat['reason']),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${confidence}%', style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _getConfidenceColor(confidence),
              )),
              if (confidence > 80)
                Text('پیشنهاد اول', style: TextStyle(fontSize: 10, color: Colors.green)),
            ],
          ),
          onTap: () {
            // انتخاب این دسته‌بندی
          },
        ),
      );
    }).toList();
  }
  
  static List<Widget> _buildExtractedFeatures(List<dynamic> features) {
    return features.map((feature) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.check_circle, size: 16, color: Colors.green),
            SizedBox(width: 8),
            Expanded(child: Text(feature)),
          ],
        ),
      );
    }).toList();
  }
  
  static Widget _buildPriceSuggestion(Map<String, dynamic> suggestion) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.attach_money, color: Colors.green),
                SizedBox(width: 8),
                Text('💎 پیشنهاد قیمت هوشمند', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
              ],
            ),
            SizedBox(height: 12),
            Text('محدوده قیمت پیشنهادی:', style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: 8),
            Text(suggestion['range'], style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade800,
            )),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: suggestion['confidence'] / 100,
              backgroundColor: Colors.grey.shade200,
              color: Colors.green,
              minHeight: 8,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${suggestion['confidence']}% اطمینان',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text(suggestion['reason'],
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  static Widget _buildTitleDescriptionSuggestions(Map<String, dynamic> results) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📝 پیشنهادات هوشمند', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: 16),
            
            // پیشنهاد عنوان
            TextField(
              controller: TextEditingController(text: results['title_suggestion']),
              decoration: InputDecoration(
                labelText: 'عنوان پیشنهادی',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {
                    // کپی عنوان
                  },
                ),
              ),
              maxLines: 2,
            ),
            
            SizedBox(height: 16),
            
            // پیشنهاد توضیحات
            TextField(
              controller: TextEditingController(text: results['description_suggestion']),
              decoration: InputDecoration(
                labelText: 'توضیحات پیشنهادی',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {
                    // کپی توضیحات
                  },
                ),
              ),
              maxLines: 4,
            ),
            
            SizedBox(height: 16),
            
            // پیشنهاد تگ‌ها
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (results['tags_suggestion'] as List).map((tag) {
                return InputChip(
                  label: Text(tag),
                  onSelected: (selected) {},
                );
              }).toList(),
            ),
            
            SizedBox(height: 16),
            
            // دکمه اعمال همه
            ElevatedButton.icon(
              onPressed: () {
                // اعمال همه پیشنهادات
              },
              icon: Icon(Icons.auto_awesome),
              label: Text('اعمال همه پیشنهادات هوشمند'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // رنگ بر اساس درصد اطمینان
  static Color _getConfidenceColor(int confidence) {
    if (confidence >= 90) return Colors.green;
    if (confidence >= 70) return Colors.blue;
    if (confidence >= 50) return Colors.orange;
    return Colors.red;
  }
  
  // صفحه کامل تحلیل عکس
  static Widget buildFullImageAnalysisScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تحلیل هوشمند عکس'),
      ),
      body: Column(
        children: [
          // ناحیه آپلود عکس
          Expanded(
            child: _buildImageUploadArea(context),
          ),
          
          // ناحیه نتایج
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('نتایج تحلیل', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                    SizedBox(height: 16),
                    Expanded(
                      child: buildImageAnalysisWidget(context, ''),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  static Widget _buildImageUploadArea(BuildContext context) {
    return DragTarget(
      builder: (context, candidateData, rejectedData) {
        return Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue.shade300,
              width: 2,
              style: BorderStyle.dashed,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cloud_upload, size: 60, color: Colors.blue),
                SizedBox(height: 20),
                Text('عکس محصول را اینجا رها کنید',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('یا', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // انتخاب از گالری
                      },
                      icon: Icon(Icons.photo_library),
                      label: Text('انتخاب از گالری'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        // گرفتن عکس جدید
                      },
                      icon: Icon(Icons.camera_alt),
                      label: Text('گرفتن عکس جدید'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text('فرمت‌های پشتیبانی شده: JPG, PNG, WebP',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        );
      },
    );
  }
}
