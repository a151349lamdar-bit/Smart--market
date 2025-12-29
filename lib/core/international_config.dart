// راه‌حل‌های بین‌المللی و دور زدن تحریم

class InternationalConfig {
  // سرورهای جایگزین خارج از تحریم
  static const List<String> backupServers = [
    'https://api-eu.market.com',
    'https://api-asia.market.com',
    'https://api-middleeast.market.com',
  ];
  
  // درگاه‌های پرداخت جایگزین
  static const List<String> paymentGateways = [
    'zarinpal',      // ایران
    'nowpayments',   // بین‌المللی (کریپتو)
    'stripemit',     // استرایپ میتو
    'payping',       // پی‌پینگ
  ];
  
  // CDN‌های جهانی برای تصاویر
  static const List<String> globalCDNs = [
    'https://cdn.cloudflare.com',
    'https://storage.googleapis.com',
    'https://cdn.jsdelivr.net',
  ];
  
  // ارزهای پذیرفته شده
  static const List<String> acceptedCurrencies = [
    'IRR',  // ریال ایران
    'IRT',  // تومان
    'USD',  // دلار
    'EUR',  // یورو
    'USDT', // تتر
  ];
  
  // دریافت بهترین سرور بر اساس موقعیت کاربر
  static String getBestServer(String userCountry) {
    final Map<String, String> countryServers = {
      'IR': 'https://api.market.ir',
      'TR': 'https://api-eu.market.com',
      'AE': 'https://api-middleeast.market.com',
      'default': 'https://api-asia.market.com',
    };
    
    return countryServers[userCountry] ?? countryServers['default']!;
  }
  
  // چک کردن تحریم بودن کشور
  static bool isCountrySanctioned(String countryCode) {
    const List<String> sanctionedCountries = ['US', 'IL'];
    return sanctionedCountries.contains(countryCode);
  }
}
