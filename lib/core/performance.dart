// بهینه‌سازی سرعت و عملکرد

class PerformanceOptimizer {
  // کش تصاویر
  static const Duration imageCacheDuration = Duration(hours: 24);
  
  // کش داده‌های API
  static const Duration apiCacheDuration = Duration(minutes: 5);
  
  // اندازه کش حافظه
  static const int maxMemoryCacheSizeMB = 100;
  
  // تکنیک‌های بهینه‌سازی
  static Map<String, dynamic> getOptimizationRules() {
    return {
      'lazy_loading': true,
      'image_compression': true,
      'webp_format': true,
      'code_splitting': true,
      'tree_shaking': true,
      'minify_js': true,
      'minify_css': true,
      'http2': true,
      'gzip_compression': true,
      'cdn_for_static': true,
    };
  }
  
  // تنظیمات CDN
  static Map<String, String> getCDNConfig() {
    return {
      'images': 'https://cdn.market.ir/images',
      'fonts': 'https://cdn.market.ir/fonts',
      'scripts': 'https://cdn.market.ir/js',
      'styles': 'https://cdn.market.ir/css',
    };
  }
  
  // حداقل‌سازی درخواست‌های شبکه
  static Map<String, dynamic> getNetworkOptimization() {
    return {
      'batch_requests': true,
      'request_deduplication': true,
      'prefetching': true,
      'connection_pooling': true,
      'keep_alive': true,
    };
  }
  
  // اندازه‌گیری Performance
  static Map<String, dynamic> getPerformanceMetrics() {
    return {
      'target_load_time': 2000, // 2 ثانیه
      'target_fps': 60, // 60 فریم بر ثانیه
      'max_image_size_kb': 200,
      'max_js_size_kb': 100,
      'max_css_size_kb': 50,
    };
  }
  
  // تکنیک‌های لودینگ سریع
  static List<String> getFastLoadingTechniques() {
    return [
      'Server Side Rendering (SSR)',
      'Static Site Generation (SSG)',
      'Incremental Static Regeneration (ISR)',
      'Lazy Loading Images',
      'Critical CSS Inlining',
      'JavaScript Deferring',
      'Font Display Swap',
      'Resource Hints (preconnect, preload)',
    ];
  }
  
  // مانیتورینگ Performance
  static Map<String, dynamic> getMonitoringConfig() {
    return {
      'real_user_monitoring': true,
      'synthetic_monitoring': true,
      'error_tracking': true,
      'performance_budget': true,
      'core_web_vitals': true,
    };
  }
}
