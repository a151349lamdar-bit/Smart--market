// امنیت، حریم خصوصی و GDPR

class SecurityManager {
  // رمزنگاری
  static const String encryptionAlgorithm = 'AES-256-GCM';
  static const int keyLength = 256;
  static const int ivLength = 12;
  
  // تنظیمات حریم خصوصی
  static Map<String, dynamic> getPrivacyConfig() {
    return {
      'data_encryption': true,
      'end_to_end_encryption': true,
      'data_minimization': true,
      'purpose_limitation': true,
      'storage_limitation': true,
      'right_to_be_forgotten': true,
      'data_portability': true,
      'privacy_by_design': true,
      'privacy_by_default': true,
    };
  }
  
  // مطابقت با قوانین
  static Map<String, bool> getCompliance() {
    return {
      'gdpr': true,          // اتحادیه اروپا
      'ccpa': true,          // کالیفرنیا
      'pipeda': true,        // کانادا
      'lgpd': true,          // برزیل
      'pdpa': true,          // تایلند
      'local_laws': true,    // قوانین محلی ایران
    };
  }
  
  // محافظت در برابر حملات
  static Map<String, dynamic> getAttackProtection() {
    return {
      'sql_injection': true,
      'xss': true,
      'csrf': true,
      'ddos': true,
      'brute_force': true,
      'man_in_the_middle': true,
      'session_hijacking': true,
      'clickjacking': true,
    };
  }
  
  // سیاست‌های ذخیره‌سازی داده
  static Map<String, dynamic> getDataStoragePolicies() {
    return {
      'user_data_retention_days': 365,
      'log_retention_days': 90,
      'backup_retention_days': 730,
      'encryption_at_rest': true,
      'encryption_in_transit': true,
      'secure_deletion': true,
      'data_localization': true, // ذخیره داده در کشور کاربر
    };
  }
  
  // احراز هویت و دسترسی
  static Map<String, dynamic> getAuthConfig() {
    return {
      'multi_factor_auth': true,
      'biometric_auth': true,
      'password_policy': {
        'min_length': 8,
        'require_uppercase': true,
        'require_lowercase': true,
        'require_numbers': true,
        'require_symbols': true,
        'max_age_days': 90,
        'prevent_reuse': 5,
      },
      'session_management': {
        'session_timeout_minutes': 30,
        'max_sessions_per_user': 5,
        'session_rotation': true,
      },
      'rate_limiting': {
        'login_attempts': 5,
        'password_reset_attempts': 3,
        'api_requests_per_minute': 60,
      },
    };
  }
  
  // مانیتورینگ و لاگینگ
  static Map<String, dynamic> getMonitoringConfig() {
    return {
      'security_logs': true,
      'audit_trail': true,
      'real_time_alerts': true,
      'incident_response': true,
      'vulnerability_scanning': true,
      'penetration_testing': true,
      'security_updates': true,
    };
  }
  
  // Third-party风险管理
  static Map<String, dynamic> getThirdPartyRiskManagement() {
    return {
      'vendor_assessment': true,
      'data_processing_agreements': true,
      'api_security_reviews': true,
      'dependency_vulnerability_scanning': true,
    };
  }
  
  // فیلترینگ و محدودیت‌های جغرافیایی
  static Map<String, dynamic> getGeographicRestrictions() {
    return {
      'allowed_countries': [
        'IR', // ایران
        'TR', // ترکیه
        'AE', // امارات
        'IQ', // عراق
        'AF', // افغانستان
        'AZ', // آذربایجان
        'TM', // ترکمنستان
        'PK', // پاکستان
      ],
      'blocked_countries': [
        'US', // آمریکا
        'IL', // اسرائیل
      ],
      'regional_servers': true,
      'data_sovereignty': true,
    };
  }
  
  // تنظیمات فایروال و شبکه
  static Map<String, dynamic> getNetworkSecurity() {
    return {
      'web_application_firewall': true,
      'ddos_protection': true,
      'ssl_tls': {
        'min_version': 'TLS 1.2',
        'preferred_version': 'TLS 1.3',
        'perfect_forward_secrecy': true,
        'hsts': true,
      },
      'headers_security': {
        'content_security_policy': true,
        'x_frame_options': true,
        'x_content_type_options': true,
        'referrer_policy': true,
        'permissions_policy': true,
      },
    };
  }
  
  // پاسخ به حوادث امنیتی
  static Map<String, dynamic> getIncidentResponsePlan() {
    return {
      'response_team': true,
      'communication_plan': true,
      'containment_strategy': true,
      'eradication_procedures': true,
      'recovery_plan': true,
      'lessons_learned': true,
      'regulatory_reporting': true,
    };
  }
  
  // آموزش امنیتی
  static Map<String, dynamic> getSecurityTraining() {
    return {
      'developer_training': true,
      'employee_awareness': true,
      'phishing_simulations': true,
      'security_champions': true,
    };
  }
  
  // Utility Methods
  static bool isCountryAllowed(String countryCode) {
    const List<String> allowedCountries = [
      'IR', 'TR', 'AE', 'IQ', 'AF', 'AZ', 'TM', 'PK',
    ];
    return allowedCountries.contains(countryCode);
  }
  
  static bool isPasswordStrong(String password) {
    if (password.length < 8) return false;
    
    final hasUpper = RegExp(r'[A-Z]').hasMatch(password);
    final hasLower = RegExp(r'[a-z]').hasMatch(password);
    final hasDigit = RegExp(r'\d').hasMatch(password);
    final hasSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
    
    return hasUpper && hasLower && hasDigit && hasSpecial;
  }
  
  static Map<String, dynamic> getSecurityHeaders() {
    return {
      'X-Content-Type-Options': 'nosniff',
      'X-Frame-Options': 'DENY',
      'X-XSS-Protection': '1; mode=block',
      'Referrer-Policy': 'strict-origin-when-cross-origin',
      'Permissions-Policy': 'geolocation=(), microphone=(), camera=()',
      'Content-Security-Policy': "default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline';",
    };
  }
}
