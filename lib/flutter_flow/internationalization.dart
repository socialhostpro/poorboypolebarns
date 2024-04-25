import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'id', 'ms'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? idText = '',
    String? msText = '',
  }) =>
      [enText, idText, msText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // home
  {
    'miurzim4': {
      'en':
          'Your trusted source for high-quality pole barn construction. Our experienced team is dedicated to providing you with exceptional service and expert craftsmanship.',
      'id': '',
      'ms': '',
    },
    '2rcmk5ir': {
      'en': 'Your trusted source for high-quality pole barn construction. ',
      'id': '',
      'ms': '',
    },
    'wzpi3ooj': {
      'en': '(352) 575-3293',
      'id': '',
      'ms': '',
    },
    'tsx3m50m': {
      'en': 'We proudly serve the entirety of the State of Florida.',
      'id': '',
      'ms': '',
    },
    'p6h1mbrg': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    'cqeulq06': {
      'en': 'Only the best matertials',
      'id': '',
      'ms': '',
    },
    'mbse88xl': {
      'en':
          'At Poorboy’s Pole Barn, we use only the highest quality materials and techniques to ensure that your pole barn is built to last. Our team will work closely with you to design a custom pole barn that meets your specific requirements, preferences, and budget.\n\nWhether you need a new barn for your farm, a storage building for your business, or a garage for your home, Poorboy’s Pole Barn has you covered. Contact us today to learn more about our pole barn construction services and to request a quote for your project.',
      'id': '',
      'ms': '',
    },
    '7apnt2ma': {
      'en': 'Only the best matertials',
      'id': '',
      'ms': '',
    },
    'r3b0s085': {
      'en':
          'At Poorboy’s Pole Barn, we use only the highest quality materials and techniques to ensure that your pole barn is built to last. Our team will work closely with you to design a custom pole barn that meets your specific requirements, preferences, and budget.\n\nWhether you need a new barn for your farm, a storage building for your business, or a garage for your home, Poorboy’s Pole Barn has you covered. Contact us today to learn more about our pole barn construction services and to request a quote for your project.',
      'id': '',
      'ms': '',
    },
    '83f8s78o': {
      'en': 'Why choose us?',
      'id': '',
      'ms': '',
    },
    'mxltp8id': {
      'en':
          'We specialize in pole barn construction for a wide range of applications, including agricultural, commercial, and residential projects. Our pole barns are designed to be durable, functional, and affordable, providing you with a cost-effective solution for your building needs.\nAt Poorboy’s Pole Barn, we use only the highest quality materials and techniques to ensure that your pole barn is built to last. Our team will work closely with you to design a custom pole barn that meets your specific requirements, preferences, and budget.\n',
      'id': '',
      'ms': '',
    },
    'z0d4n4jh': {
      'en':
          'We specialize in pole barn construction for a wide range of applications, including agricultural, commercial, and residential projects. Our pole barns are designed to be durable, functional, and affordable, providing you with a cost-effective solution for your building needs.\nAt Poorboy’s Pole Barn, we use only the highest quality materials and techniques to ensure that your pole barn is built to last. Our team will work closely with you to design a custom pole barn that meets your specific requirements, preferences, and budget.\n',
      'id': '',
      'ms': '',
    },
    'q9dnk2iy': {
      'en': 'Why choose us?',
      'id': '',
      'ms': '',
    },
    'a5t5fh8p': {
      'en':
          'We specialize in pole barn construction for a wide range of applications, including agricultural, commercial, and residential projects. Our pole barns are designed to be durable, functional, and affordable, providing you with a cost-effective solution for your building needs.\n',
      'id': '',
      'ms': '',
    },
    'fdj1zhxp': {
      'en': '(352) 575-3293',
      'id': '',
      'ms': '',
    },
    'b1vcaf7o': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    'k9ags8bu': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    'fg96a684': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    's10lgkgg': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    'v1e4mgv9': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    'l67a7lrn': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    '9atj8g60': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    '3ko3w4gq': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    'l3ps6cvb': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    'glpvq7ox': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    'rtjfmyyv': {
      'en': 'Contact Us',
      'id': '',
      'ms': '',
    },
    '3kyizf06': {
      'en': 'Login / Sign-up',
      'id': '',
      'ms': '',
    },
    'ryju2gqf': {
      'en': 'Terms of Service',
      'id': '',
      'ms': '',
    },
    'jhux49qr': {
      'en': 'Privacy Policy',
      'id': '',
      'ms': '',
    },
    '7wp3idd5': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // gallery
  {
    'znvbpugi': {
      'en': 'Poorboys Pole Barn, Truss Pole Barn Photo Gallery ',
      'id': '',
      'ms': '',
    },
    '3z3pvsx0': {
      'en': 'Poorboys Pole Barn, Truss Pole Barn Photo Gallery ',
      'id': '',
      'ms': '',
    },
    'naskolj2': {
      'en': 'Why choose us?',
      'id': '',
      'ms': '',
    },
    'qd7tnypr': {
      'en':
          'We specialize in pole barn construction for a wide range of applications, including agricultural, commercial, and residential projects. Our pole barns are designed to be durable, functional, and affordable, providing you with a cost-effective solution for your building needs.\nAt Poorboy’s Pole Barn, we use only the highest quality materials and techniques to ensure that your pole barn is built to last. Our team will work closely with you to design a custom pole barn that meets your specific requirements, preferences, and budget.\n',
      'id': '',
      'ms': '',
    },
    's018h5ky': {
      'en':
          'We specialize in pole barn construction for a wide range of applications, including agricultural, commercial, and residential projects. Our pole barns are designed to be durable, functional, and affordable, providing you with a cost-effective solution for your building needs.\nAt Poorboy’s Pole Barn, we use only the highest quality materials and techniques to ensure that your pole barn is built to last. Our team will work closely with you to design a custom pole barn that meets your specific requirements, preferences, and budget.\n',
      'id': '',
      'ms': '',
    },
    '2y962xfo': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    'dzjp7w0v': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    '1k9vq9w3': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    'ixzikjp4': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    'gvzcpfup': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    'waox84rx': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    '6ir8vbvx': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    'g5r5qp0a': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    '3l01xjkt': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    'y5z8ywl4': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    'l9j553ye': {
      'en': 'Contact Us',
      'id': '',
      'ms': '',
    },
    'oml2vn6l': {
      'en': 'Login / Sign-up',
      'id': '',
      'ms': '',
    },
    'lhe42ypo': {
      'en': 'Terms of Service',
      'id': '',
      'ms': '',
    },
    'xe27mnpa': {
      'en': 'Privacy Policy',
      'id': '',
      'ms': '',
    },
    'ck423jwe': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // aboutUs
  {
    '7uw0p1mj': {
      'en': 'About Poorboy\'s Pole Barns',
      'id': '',
      'ms': '',
    },
    'k9x4fxgd': {
      'en': 'Poorboys Pole Barn, Truss Pole Barn Photo Gallery ',
      'id': '',
      'ms': '',
    },
    'm8rd1gre': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    'txzsm63t': {
      'en':
          'At Poorboy’s Pole Barn, we believe that every customer deserves a reliable and affordable building solution. That’s why we specialize in pole barn construction, offering a cost-effective alternative to traditional construction methods. Our pole barns are designed to be durable, functional, and customizable, meeting your specific needs and preferences.\n\nOur team of experienced professionals has the expertise and skill to handle any pole barn project, whether it’s for agricultural, commercial, or residential use. We use only the highest quality materials and techniques to ensure that your pole barn is built to last.\n\nAt Poorboy’s Pole Barn, we understand that every project is unique, and we take pride in our ability to provide custom solutions to meet your specific requirements. Our team will work closely with you to design a pole barn that meets your needs, preferences, and budget.\n\nWe are committed to giving back to the community that has supported us over the years. We sponsor local organizations and participate in various charitable events that make a positive impact on our community.\n\nThank you for considering Poorboy’s Pole Barn for your building needs. We look forward to working with you and providing you with the highest quality pole barn construction and exceptional customer service. ',
      'id': '',
      'ms': '',
    },
    'bprj71vk': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    'y6ick532': {
      'en':
          'At Poorboy’s Pole Barn, we believe that every customer deserves a reliable and affordable building solution. That’s why we specialize in pole barn construction, offering a cost-effective alternative to traditional construction methods. Our pole barns are designed to be durable, functional, and customizable, meeting your specific needs and preferences.\n\nOur team of experienced professionals has the expertise and skill to handle any pole barn project, whether it’s for agricultural, commercial, or residential use. We use only the highest quality materials and techniques to ensure that your pole barn is built to last.\n\nAt Poorboy’s Pole Barn, we understand that every project is unique, and we take pride in our ability to provide custom solutions to meet your specific requirements. Our team will work closely with you to design a pole barn that meets your needs, preferences, and budget.\n\nWe are committed to giving back to the community that has supported us over the years. We sponsor local organizations and participate in various charitable events that make a positive impact on our community.\n\nThank you for considering Poorboy’s Pole Barn for your building needs. We look forward to working with you and providing you with the highest quality pole barn construction and exceptional customer service. ',
      'id': '',
      'ms': '',
    },
    'f4ezr3eu': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    '3mgwevvj': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    'b8cl3ii6': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    'n1l7ep60': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    '85u5fit4': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    'sd6nqv2g': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    'c9rcj1hs': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    'jnlmxtqy': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    'tnfjo41w': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    'zzop4xd8': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    'c7jvg489': {
      'en': 'Contact Us',
      'id': '',
      'ms': '',
    },
    'ln8cgjac': {
      'en': 'Login / Sign-up',
      'id': '',
      'ms': '',
    },
    '869o172d': {
      'en': 'Terms of Service',
      'id': '',
      'ms': '',
    },
    'djr9lme0': {
      'en': 'Privacy Policy',
      'id': '',
      'ms': '',
    },
    '77uxdaqj': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // barns
  {
    'nam6mgy3': {
      'en': 'We proudly serve the entirety of the State of Florida.',
      'id': '',
      'ms': '',
    },
    'of7wcypt': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    '9ohj2r33': {
      'en': 'Commercial/Residential ',
      'id': '',
      'ms': '',
    },
    '3jt633zs': {
      'en':
          'At Poorboy\'s Pole Barn, we specialize in high-quality pole barn construction for a wide range of applications. Whether you need a new barn for your farm, a storage building for your business, or a garage for your home, we have you covered. Our pole barns are designed to be durable, functional, and customizable, providing you with a cost-effective solution for your building needs.',
      'id': '',
      'ms': '',
    },
    'dv7avnt6': {
      'en': 'Commercial/Residential ',
      'id': '',
      'ms': '',
    },
    '3ltvj4de': {
      'en':
          'At Poorboy\'s Pole Barn, we specialize in high-quality pole barn construction for a wide range of applications. Whether you need a new barn for your farm, a storage building for your business, or a garage for your home, we have you covered. Our pole barns are designed to be durable, functional, and customizable, providing you with a cost-effective solution for your building needs.',
      'id': '',
      'ms': '',
    },
    'tritllej': {
      'en':
          'Our pole barns are easy to assemble and come with everything you need to get started. We offer a variety of sizes and colors to choose from, and our expert team is always available to provide guidance and support. We use only the highest quality materials and techniques to ensure that your pole barn is built to last.\n\nOur pole barns are available in a variety of sizes, from small storage buildings to large agricultural structures. We can also customize your pole barn to meet your specific needs and preferences, with a range of options available for roofing, siding, windows, and doors.\n\nAt Poorboy\'s Pole Barn, we understand that every project is unique, and we take pride in our ability to provide custom solutions to meet your specific requirements. Our team will work closely with you to design a pole barn that meets your needs, preferences, and budget.\n\nContact us today to learn more about our pole barn construction services and to request a quote for your project. We look forward to working with you to provide you with the highest quality pole barn construction and exceptional customer service.',
      'id': '',
      'ms': '',
    },
    '7inp37q3': {
      'en':
          'Our pole barns are easy to assemble and come with everything you need to get started. We offer a variety of sizes and colors to choose from, and our expert team is always available to provide guidance and support. We use only the highest quality materials and techniques to ensure that your pole barn is built to last.\n\nOur pole barns are available in a variety of sizes, from small storage buildings to large agricultural structures. We can also customize your pole barn to meet your specific needs and preferences, with a range of options available for roofing, siding, windows, and doors.\n\nAt Poorboy\'s Pole Barn, we understand that every project is unique, and we take pride in our ability to provide custom solutions to meet your specific requirements. Our team will work closely with you to design a pole barn that meets your needs, preferences, and budget.\n\nContact us today to learn more about our pole barn construction services and to request a quote for your project. We look forward to working with you to provide you with the highest quality pole barn construction and exceptional customer service.',
      'id': '',
      'ms': '',
    },
    'd6i4ijzh': {
      'en':
          'Our pole barns are easy to assemble and come with everything you need to get started. We offer a variety of sizes and colors to choose from, and our expert team is always available to provide guidance and support. We use only the highest quality materials and techniques to ensure that your pole barn is built to last.\n\nOur pole barns are available in a variety of sizes, from small storage buildings to large agricultural structures. We can also customize your pole barn to meet your specific needs and preferences, with a range of options available for roofing, siding, windows, and doors.\n\nAt Poorboy\'s Pole Barn, we understand that every project is unique, and we take pride in our ability to provide custom solutions to meet your specific requirements. Our team will work closely with you to design a pole barn that meets your needs, preferences, and budget.\n\nContact us today to learn more about our pole barn construction services and to request a quote for your project. We look forward to working with you to provide you with the highest quality pole barn construction and exceptional customer service.',
      'id': '',
      'ms': '',
    },
    'y755n6j0': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    '72mkhnav': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    'm4igxa9d': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    'gwosr46s': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    'mfn2tog3': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    '1e3opa3g': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    'yhr38oiv': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    '1mquhbli': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    'xfscou3m': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    'mr4ujq9w': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    'ovx1jinq': {
      'en': 'Contact Us',
      'id': '',
      'ms': '',
    },
    '0nj63n11': {
      'en': 'Login / Sign-up',
      'id': '',
      'ms': '',
    },
    'rf3pe8ot': {
      'en': 'Terms of Service',
      'id': '',
      'ms': '',
    },
    '7v6926lz': {
      'en': 'Privacy Policy',
      'id': '',
      'ms': '',
    },
    'r3nnm8ej': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // getStarted
  {
    'x36vjv4n': {
      'en': 'Contact Info',
      'id': '',
      'ms': '',
    },
    'ahmk3d5n': {
      'en': 'Your Name',
      'id': '',
      'ms': '',
    },
    'mlpeiq17': {
      'en': 'Phone',
      'id': '',
      'ms': '',
    },
    'n71i8i3y': {
      'en': 'Email',
      'id': '',
      'ms': '',
    },
    'ryozc60r': {
      'en': 'What type of construction',
      'id': '',
      'ms': '',
    },
    'b1bt2bn8': {
      'en': 'Residential',
      'id': '',
      'ms': '',
    },
    's8z37e8p': {
      'en': 'Commercial',
      'id': '',
      'ms': '',
    },
    '2zykjjp7': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    '0cuj6pun': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'onzy1diz': {
      'en': 'Is this permitted?',
      'id': '',
      'ms': '',
    },
    'hry2fqgm': {
      'en': 'Permitted',
      'id': '',
      'ms': '',
    },
    'x9xkz2qz': {
      'en': 'Not Permitted',
      'id': '',
      'ms': '',
    },
    'y2wbleuk': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'myndfmnv': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'v8gwztrh': {
      'en': 'Barn Size',
      'id': '',
      'ms': '',
    },
    'dsn2qn5v': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'p0dfu3d0': {
      'en': 'BARN SIZE 36 x 56',
      'id': '',
      'ms': '',
    },
    'tqv1xsr3': {
      'en': 'Describe your location',
      'id': '',
      'ms': '',
    },
    '0n2ymc1g': {
      'en': 'Location Address',
      'id': '',
      'ms': '',
    },
    'fyba5gts': {
      'en': 'Street Address',
      'id': '',
      'ms': '',
    },
    'ix4u8osg': {
      'en': 'City',
      'id': '',
      'ms': '',
    },
    'laloylzr': {
      'en': 'Zip Code',
      'id': '',
      'ms': '',
    },
    'of9abnfr': {
      'en': 'SUBMIT',
      'id': '',
      'ms': '',
    },
    'r5mvw9zx': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // terms
  {
    'n0doueyx': {
      'en': 'Terms of Service',
      'id': '',
      'ms': '',
    },
    'it49mjg2': {
      'en':
          'Terms of Service for Poorboy\'s Pole Barns\n\n1. Introduction\n\nWelcome to Poorboy\'s Pole Barns. By engaging our services, you agree to be bound by the following terms and conditions (the \"Terms of Service\"). These terms are designed to ensure a clear understanding of our mutual responsibilities.\n\n2. Services Provided\n\nPoorboy\'s Pole Barns specializes in the construction of high-quality pole barns, offering design, construction, and consultation services. Our services include but are not limited to planning, obtaining necessary permits, construction, and inspections.\n\n3. Payment Terms\n\n3.1 Estimates: All service estimates are provided based on the initial assessment and may be subject to change based on actual requirements or unforeseen circumstances.\n3.2 Invoicing: Clients will be invoiced upon completion of services. Payment is due within 30 days of invoice receipt.\n3.3 Late Payment: Late payments may incur additional charges.\n4. Warranty and Liability\n\n4.1 Warranty: Poorboy\'s Pole Barns warrants its construction work to be free from defects in material and workmanship for a period of [X years] from the date of completion.\n4.2 Limitation of Liability: Poorboy\'s Pole Barns shall not be liable for any indirect, special, or consequential damages arising out of or in connection with our services.\n5. Cancellation and Refunds\n\n5.1 Cancellation by Client: Clients may cancel services with [X days\'] notice. If work has already commenced, the client will be responsible for any costs incurred up to the point of cancellation.\n5.2 Cancellation by Poorboy\'s Pole Barns: We reserve the right to cancel any service due to unforeseen circumstances or inability to obtain necessary permits. In such cases, a full refund will be issued for any payments made.\n6. Dispute Resolution\n\nAny disputes arising under or in connection with these Terms of Service shall be attempted to be resolved through negotiation between the parties. If resolution cannot be achieved, disputes shall be settled by arbitration in accordance with the rules of [Specify Arbitration Body], and the decision of the arbitrator(s) shall be final and binding.\n\n7. Amendments\n\nPoorboy\'s Pole Barns reserves the right to amend these Terms of Service at any time. All amendments will be posted on our official website, and by continuing to use our services, you accept those amendments.\n\n8. Governing Law\n\nThese Terms of Service shall be governed by and construed in accordance with the laws of Florida.\n\n',
      'id': '',
      'ms': '',
    },
    't1xtrfrs': {
      'en':
          'Terms of Service for Poorboy\'s Pole Barns\n\n1. Introduction\n\nWelcome to Poorboy\'s Pole Barns. By engaging our services, you agree to be bound by the following terms and conditions (the \"Terms of Service\"). These terms are designed to ensure a clear understanding of our mutual responsibilities.\n\n2. Services Provided\n\nPoorboy\'s Pole Barns specializes in the construction of high-quality pole barns, offering design, construction, and consultation services. Our services include but are not limited to planning, obtaining necessary permits, construction, and inspections.\n\n3. Payment Terms\n\n3.1 Estimates: All service estimates are provided based on the initial assessment and may be subject to change based on actual requirements or unforeseen circumstances.\n3.2 Invoicing: Clients will be invoiced upon completion of services. Payment is due within 30 days of invoice receipt.\n3.3 Late Payment: Late payments may incur additional charges.\n4. Warranty and Liability\n\n4.1 Warranty: Poorboy\'s Pole Barns warrants its construction work to be free from defects in material and workmanship for a period of [X years] from the date of completion.\n4.2 Limitation of Liability: Poorboy\'s Pole Barns shall not be liable for any indirect, special, or consequential damages arising out of or in connection with our services.\n5. Cancellation and Refunds\n\n5.1 Cancellation by Client: Clients may cancel services with [X days\'] notice. If work has already commenced, the client will be responsible for any costs incurred up to the point of cancellation.\n5.2 Cancellation by Poorboy\'s Pole Barns: We reserve the right to cancel any service due to unforeseen circumstances or inability to obtain necessary permits. In such cases, a full refund will be issued for any payments made.\n6. Dispute Resolution\n\nAny disputes arising under or in connection with these Terms of Service shall be attempted to be resolved through negotiation between the parties. If resolution cannot be achieved, disputes shall be settled by arbitration in accordance with the rules of [Specify Arbitration Body], and the decision of the arbitrator(s) shall be final and binding.\n\n7. Amendments\n\nPoorboy\'s Pole Barns reserves the right to amend these Terms of Service at any time. All amendments will be posted on our official website, and by continuing to use our services, you accept those amendments.\n\n8. Governing Law\n\nThese Terms of Service shall be governed by and construed in accordance with the laws of Florida.\n\n',
      'id': '',
      'ms': '',
    },
    'eda1zan0': {
      'en':
          'Terms of Service for Poorboy\'s Pole Barns\n\n1. Introduction\n\nWelcome to Poorboy\'s Pole Barns. By engaging our services, you agree to be bound by the following terms and conditions (the \"Terms of Service\"). These terms are designed to ensure a clear understanding of our mutual responsibilities.\n\n2. Services Provided\n\nPoorboy\'s Pole Barns specializes in the construction of high-quality pole barns, offering design, construction, and consultation services. Our services include but are not limited to planning, obtaining necessary permits, construction, and inspections.\n\n3. Payment Terms\n\n3.1 Estimates: All service estimates are provided based on the initial assessment and may be subject to change based on actual requirements or unforeseen circumstances.\n3.2 Invoicing: Clients will be invoiced upon completion of services. Payment is due within 30 days of invoice receipt.\n3.3 Late Payment: Late payments may incur additional charges.\n4. Warranty and Liability\n\n4.1 Warranty: Poorboy\'s Pole Barns warrants its construction work to be free from defects in material and workmanship for a period of [X years] from the date of completion.\n4.2 Limitation of Liability: Poorboy\'s Pole Barns shall not be liable for any indirect, special, or consequential damages arising out of or in connection with our services.\n5. Cancellation and Refunds\n\n5.1 Cancellation by Client: Clients may cancel services with [X days\'] notice. If work has already commenced, the client will be responsible for any costs incurred up to the point of cancellation.\n5.2 Cancellation by Poorboy\'s Pole Barns: We reserve the right to cancel any service due to unforeseen circumstances or inability to obtain necessary permits. In such cases, a full refund will be issued for any payments made.\n6. Dispute Resolution\n\nAny disputes arising under or in connection with these Terms of Service shall be attempted to be resolved through negotiation between the parties. If resolution cannot be achieved, disputes shall be settled by arbitration in accordance with the rules of [Specify Arbitration Body], and the decision of the arbitrator(s) shall be final and binding.\n\n7. Amendments\n\nPoorboy\'s Pole Barns reserves the right to amend these Terms of Service at any time. All amendments will be posted on our official website, and by continuing to use our services, you accept those amendments.\n\n8. Governing Law\n\nThese Terms of Service shall be governed by and construed in accordance with the laws of Florida.\n\n',
      'id': '',
      'ms': '',
    },
    'zcw10c6e': {
      'en': 'We proudly serve the entirety of the State of Florida.',
      'id': '',
      'ms': '',
    },
    'qtrdf72n': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    'p0fnyk4s': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    'm4ptc9bj': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    '954ep3t1': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    '6grl401o': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    '6xx648b1': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    '8t4yrexw': {
      'en': 'Contact Us',
      'id': '',
      'ms': '',
    },
    '7b3b6un9': {
      'en': 'Login / Sign-up',
      'id': '',
      'ms': '',
    },
    'mn384xif': {
      'en': 'Terms of Service',
      'id': '',
      'ms': '',
    },
    'awgox2g1': {
      'en': 'Privacy Policy',
      'id': '',
      'ms': '',
    },
    '89jferu7': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // privacy
  {
    '0leyzkr2': {
      'en':
          'Privacy Policy for Poorboy\'s Pole Barns\n\nEffective Date: 3/01/24\n\nWelcome to Poorboy\'s Pole Barns. Protecting your privacy is of great importance to us. This Privacy Policy outlines our practices regarding the collection, use, and safeguarding of your personal information when you use our services.\n\n1. Information We Collect\n\n1.1 Personal Information: We may collect personal information that you provide to us, such as your name, address, email address, and phone number, when you inquire about our services, sign a contract, or interact with our customer service.\n1.2 Project Information: Information related to the construction projects we undertake for you, including plans, permits, and specifications.\n1.3 Payment Information: We collect payment and billing information when you engage our services. We do not store credit card numbers; payment transactions are processed by our secure payment processor.\n2. How We Use Your Information\n\n2.1 To Provide Services: Your information is used to fulfill our contractual obligations, including construction, billing, and customer support.\n2.2 Communication: We may use your information to communicate with you about your project, services, updates, and promotional offers, if you\'ve opted in to receive such communications.\n2.3 Legal Compliance: We may disclose your information if required by law or if we believe it is necessary to protect our rights, property, or safety.\n3. Information Sharing and Disclosure\n\n3.1 Third Parties: We may share your information with third-party service providers who perform services on our behalf, such as contractors and payment processors. These third parties are prohibited from using your information for any purpose other than to provide these services.\n3.2 Legal Requirements: We may disclose your information if required by law, such as in response to a court order or a subpoena.\n4. Data Security\n\nWe implement reasonable security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. However, no internet-based site can be 100% secure, and we cannot guarantee the absolute security of your information.\n\n5. Your Rights\n\nYou have the right to request access to the personal information we hold about you, to request corrections, or to request that we delete your personal information. You can contact us at [Contact Information] to make such requests.\n\n6. Changes to This Privacy Policy\n\nPoorboy\'s Pole Barns reserves the right to update or change this Privacy Policy at any time. We will post the updated policy on our website, and it will be effective immediately upon posting.',
      'id': '',
      'ms': '',
    },
    'bpja0n51': {
      'en':
          'Privacy Policy for Poorboy\'s Pole Barns\n\nEffective Date: 3/01/24\n\nWelcome to Poorboy\'s Pole Barns. Protecting your privacy is of great importance to us. This Privacy Policy outlines our practices regarding the collection, use, and safeguarding of your personal information when you use our services.\n\n1. Information We Collect\n\n1.1 Personal Information: We may collect personal information that you provide to us, such as your name, address, email address, and phone number, when you inquire about our services, sign a contract, or interact with our customer service.\n1.2 Project Information: Information related to the construction projects we undertake for you, including plans, permits, and specifications.\n1.3 Payment Information: We collect payment and billing information when you engage our services. We do not store credit card numbers; payment transactions are processed by our secure payment processor.\n2. How We Use Your Information\n\n2.1 To Provide Services: Your information is used to fulfill our contractual obligations, including construction, billing, and customer support.\n2.2 Communication: We may use your information to communicate with you about your project, services, updates, and promotional offers, if you\'ve opted in to receive such communications.\n2.3 Legal Compliance: We may disclose your information if required by law or if we believe it is necessary to protect our rights, property, or safety.\n3. Information Sharing and Disclosure\n\n3.1 Third Parties: We may share your information with third-party service providers who perform services on our behalf, such as contractors and payment processors. These third parties are prohibited from using your information for any purpose other than to provide these services.\n3.2 Legal Requirements: We may disclose your information if required by law, such as in response to a court order or a subpoena.\n4. Data Security\n\nWe implement reasonable security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. However, no internet-based site can be 100% secure, and we cannot guarantee the absolute security of your information.\n\n5. Your Rights\n\nYou have the right to request access to the personal information we hold about you, to request corrections, or to request that we delete your personal information. You can contact us at [Contact Information] to make such requests.\n\n6. Changes to This Privacy Policy\n\nPoorboy\'s Pole Barns reserves the right to update or change this Privacy Policy at any time. We will post the updated policy on our website, and it will be effective immediately upon posting.',
      'id': '',
      'ms': '',
    },
    'jfnnvjrm': {
      'en':
          'Privacy Policy for Poorboy\'s Pole Barns\n\nEffective Date: 3/01/24\n\nWelcome to Poorboy\'s Pole Barns. Protecting your privacy is of great importance to us. This Privacy Policy outlines our practices regarding the collection, use, and safeguarding of your personal information when you use our services.\n\n1. Information We Collect\n\n1.1 Personal Information: We may collect personal information that you provide to us, such as your name, address, email address, and phone number, when you inquire about our services, sign a contract, or interact with our customer service.\n1.2 Project Information: Information related to the construction projects we undertake for you, including plans, permits, and specifications.\n1.3 Payment Information: We collect payment and billing information when you engage our services. We do not store credit card numbers; payment transactions are processed by our secure payment processor.\n2. How We Use Your Information\n\n2.1 To Provide Services: Your information is used to fulfill our contractual obligations, including construction, billing, and customer support.\n2.2 Communication: We may use your information to communicate with you about your project, services, updates, and promotional offers, if you\'ve opted in to receive such communications.\n2.3 Legal Compliance: We may disclose your information if required by law or if we believe it is necessary to protect our rights, property, or safety.\n3. Information Sharing and Disclosure\n\n3.1 Third Parties: We may share your information with third-party service providers who perform services on our behalf, such as contractors and payment processors. These third parties are prohibited from using your information for any purpose other than to provide these services.\n3.2 Legal Requirements: We may disclose your information if required by law, such as in response to a court order or a subpoena.\n4. Data Security\n\nWe implement reasonable security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. However, no internet-based site can be 100% secure, and we cannot guarantee the absolute security of your information.\n\n5. Your Rights\n\nYou have the right to request access to the personal information we hold about you, to request corrections, or to request that we delete your personal information. You can contact us at [Contact Information] to make such requests.\n\n6. Changes to This Privacy Policy\n\nPoorboy\'s Pole Barns reserves the right to update or change this Privacy Policy at any time. We will post the updated policy on our website, and it will be effective immediately upon posting.',
      'id': '',
      'ms': '',
    },
    'qxdk1t57': {
      'en': 'We proudly serve the entirety of the State of Florida.',
      'id': '',
      'ms': '',
    },
    '0yv9r6ju': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    'q1sbzegu': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    '5l4k5c0e': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    'udgmzlrz': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    'zfhjjatn': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    'c1m97w2e': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
    'i5uxyu33': {
      'en': 'Contact Us',
      'id': '',
      'ms': '',
    },
    'itzzye8n': {
      'en': 'Login / Sign-up',
      'id': '',
      'ms': '',
    },
    'qg2zm5de': {
      'en': 'Terms of Service',
      'id': '',
      'ms': '',
    },
    '4xd3hox9': {
      'en': 'Privacy Policy',
      'id': '',
      'ms': '',
    },
    'nlq1f9v5': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // Login-Signup
  {
    'c5um2i6j': {
      'en': 'Sign In',
      'id': '',
      'ms': '',
    },
    'haj9hyai': {
      'en': 'Let\'s get started by filling out the form below.',
      'id': '',
      'ms': '',
    },
    '3ghjtta8': {
      'en': 'Email',
      'id': '',
      'ms': '',
    },
    'gd3eecod': {
      'en': 'Password',
      'id': '',
      'ms': '',
    },
    'rhk2z0d8': {
      'en': 'Sign In',
      'id': '',
      'ms': '',
    },
    'khobw7lf': {
      'en': 'Forgot Password',
      'id': '',
      'ms': '',
    },
    'uah1jmui': {
      'en': 'Back to Home',
      'id': '',
      'ms': '',
    },
    '1gc09ial': {
      'en': 'Or sign up with',
      'id': '',
      'ms': '',
    },
    'ukol9x26': {
      'en': 'Continue with Google',
      'id': '',
      'ms': '',
    },
    '91lqfk7t': {
      'en': 'Continue with Apple',
      'id': '',
      'ms': '',
    },
    'eo7ptlg8': {
      'en': 'Sign Up',
      'id': '',
      'ms': '',
    },
    'ojt7obko': {
      'en': 'Sign up is not allowed at this time.',
      'id': '',
      'ms': '',
    },
    'jv5bhj5n': {
      'en': 'Email',
      'id': '',
      'ms': '',
    },
    'a2335rh3': {
      'en': 'Password',
      'id': '',
      'ms': '',
    },
    '012qumfx': {
      'en': 'Confirm Password',
      'id': '',
      'ms': '',
    },
    '3e6gnsg6': {
      'en': 'Create Account',
      'id': '',
      'ms': '',
    },
    '3vn8652a': {
      'en': 'Or sign up with',
      'id': '',
      'ms': '',
    },
    'ajvgl5mt': {
      'en': 'Continue with Google',
      'id': '',
      'ms': '',
    },
    'kw8ytuu4': {
      'en': 'Continue with Apple',
      'id': '',
      'ms': '',
    },
    'lpbhrcgx': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // Settings
  {
    '92ckhfzg': {
      'en': 'Website Settings',
      'id': '',
      'ms': '',
    },
    '3i4ugcg6': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    'jyzx7fcz': {
      'en': 'page',
      'id': '',
      'ms': '',
    },
    '9rtvkerk': {
      'en': 'photo/text',
      'id': '',
      'ms': '',
    },
    'n4lwc4b7': {
      'en': 'location',
      'id': '',
      'ms': '',
    },
    '6zxskgti': {
      'en': 'actions',
      'id': '',
      'ms': '',
    },
    'fdle75ld': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    'e41mll2u': {
      'en': 'About',
      'id': '',
      'ms': '',
    },
    '5ov0xpvw': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // Dashboard
  {
    'p5dpqj14': {
      'en': 'Page One',
      'id': '',
      'ms': '',
    },
    'u81vdjad': {
      'en': 'Below is where you can place your content.',
      'id': '',
      'ms': '',
    },
    '05z71ly4': {
      'en': 'Developer Note (delete this)',
      'id': '',
      'ms': '',
    },
    'dv8zzk59': {
      'en':
          'You can adjust the navigation items in the left navigation by editing the component. The selected state is triggered by the \"selectedNav\" parameter in the sideNav component. ',
      'id': '',
      'ms': '',
    },
    '1nzsyajp': {
      'en': 'Desktop Template',
      'id': '',
      'ms': '',
    },
    'p46gcql9': {
      'en':
          'You will first need to increase the screen size to tablet or desktop.',
      'id': '',
      'ms': '',
    },
    'p0a4w44x': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // Quotes
  {
    'rlsjr4qi': {
      'en': 'Page Two',
      'id': '',
      'ms': '',
    },
    'xxauhijh': {
      'en': 'Below is where you can place your content.',
      'id': '',
      'ms': '',
    },
    'v143pbd8': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // GallerySettings
  {
    'vih32zq4': {
      'en': 'Website Gallery',
      'id': '',
      'ms': '',
    },
    'w95xyeyv': {
      'en': 'photo',
      'id': '',
      'ms': '',
    },
    '4gy28qt1': {
      'en': 'action',
      'id': '',
      'ms': '',
    },
    '234846p8': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // Contacts
  {
    '75c0b7wq': {
      'en': 'Contacts',
      'id': '',
      'ms': '',
    },
    'ok6cbi1d': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // addWebSiteContent
  {
    'q9jryvuf': {
      'en': 'Text Content  here...',
      'id': '',
      'ms': '',
    },
    'dgmghz72': {
      'en': 'Upload Image Content',
      'id': '',
      'ms': '',
    },
    '4bo3kz0f': {
      'en': 'Explain Location',
      'id': '',
      'ms': '',
    },
    'vwqubqm0': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    '04j9o6x8': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    'xlllly62': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    'cltyilf0': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    'ey02mmom': {
      'en': 'Please select page...',
      'id': '',
      'ms': '',
    },
    '5twpw9xs': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'kzp1xcpa': {
      'en': 'Submit',
      'id': '',
      'ms': '',
    },
    'h7g4lr0h': {
      'en': 'Add Content',
      'id': '',
      'ms': '',
    },
    'p10v5vth': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // editWebSiteContent
  {
    '6og68jum': {
      'en': 'Text Content  here...',
      'id': '',
      'ms': '',
    },
    'efmk1oix': {
      'en': 'Explain Location',
      'id': '',
      'ms': '',
    },
    '6k104l73': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    '36knroe5': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    'ahodydkz': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    '7eg5q0qn': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    'forp5dvr': {
      'en': 'Please select page...',
      'id': '',
      'ms': '',
    },
    'b07b4jeo': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    '8tshehw3': {
      'en': 'Submit',
      'id': '',
      'ms': '',
    },
    '6anuuz0m': {
      'en': 'Add Content',
      'id': '',
      'ms': '',
    },
    'u7rblr8i': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // addWebSiteGallery
  {
    '6jaimb59': {
      'en': 'Upload Image Content',
      'id': '',
      'ms': '',
    },
    '10vyf9ey': {
      'en': 'Submit',
      'id': '',
      'ms': '',
    },
    'cd5lgllm': {
      'en': 'Add Photo in Gallery',
      'id': '',
      'ms': '',
    },
    'prenx5gg': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // getStartedForm
  {
    'g7zz7s91': {
      'en': 'Contact Us',
      'id': '',
      'ms': '',
    },
    'wf05n9yh': {
      'en': '352-575-3293',
      'id': '',
      'ms': '',
    },
    'gte9f51n': {
      'en': 'Name',
      'id': '',
      'ms': '',
    },
    'th0zustj': {
      'en': 'Phone',
      'id': '',
      'ms': '',
    },
    'uxnb9lu9': {
      'en': 'Email',
      'id': '',
      'ms': '',
    },
    'b3ukq7r2': {
      'en': 'Residential',
      'id': '',
      'ms': '',
    },
    '3smtw849': {
      'en': 'Commercial',
      'id': '',
      'ms': '',
    },
    '8jnc5p3y': {
      'en': 'Install Type',
      'id': '',
      'ms': '',
    },
    '0m0gfjsy': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'i1ck6n72': {
      'en': 'How can we help you?',
      'id': '',
      'ms': '',
    },
    'j16m6jtb': {
      'en': 'SUBMIT',
      'id': '',
      'ms': '',
    },
  },
  // footer
  {
    'sl32mbt7': {
      'en': 'Barns',
      'id': '',
      'ms': '',
    },
    'acsqforl': {
      'en': 'About Us',
      'id': '',
      'ms': '',
    },
    'rfjjgphs': {
      'en': 'Pictures',
      'id': '',
      'ms': '',
    },
    '91csy8s8': {
      'en': 'Free Quote',
      'id': '',
      'ms': '',
    },
    'b9omoqaf': {
      'en': 'Contact Us',
      'id': '',
      'ms': '',
    },
    'edkdideg': {
      'en': 'Privacy Policy',
      'id': '',
      'ms': '',
    },
    'vs9a9lax': {
      'en': 'Terms of Service',
      'id': '',
      'ms': '',
    },
  },
  // why
  {
    'gfqrhf9p': {
      'en': 'We proudly serve the entirety of the State of Florida.',
      'id': '',
      'ms': '',
    },
    'wx5bqsey': {
      'en': 'Get Started Free Quote',
      'id': '',
      'ms': '',
    },
  },
  // sideNav
  {
    'a12ggecm': {
      'en': 'Navigation',
      'id': '',
      'ms': '',
    },
    'tt71meef': {
      'en': 'Dashboard',
      'id': '',
      'ms': '',
    },
    'a34knja3': {
      'en': 'Contacts',
      'id': '',
      'ms': '',
    },
    'sfrj2q8w': {
      'en': 'Quotes',
      'id': '',
      'ms': '',
    },
    'y4eh2tb3': {
      'en': 'Settings',
      'id': '',
      'ms': '',
    },
    '145dikzq': {
      'en': 'Website Settings',
      'id': '',
      'ms': '',
    },
    'grf2zc6x': {
      'en': 'Add / Edit Gallery',
      'id': '',
      'ms': '',
    },
    '1bahozel': {
      'en': 'Logout',
      'id': '',
      'ms': '',
    },
  },
  // Miscellaneous
  {
    '65e2tfs2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ddazihx4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'db03cpjj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fdb9078p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '80ouzj9q': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '6rzhptp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ce8c4ty0': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'kcvqa08x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dqrzd6sq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dpqtohyf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'v01vf71s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'gcv6def1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'um9es99m': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'o4enbz4j': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8z4tvfh7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2ybzla8x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'd1wdf5i1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2py80kgi': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'p6lsrh2a': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ne8cclp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
  },
].reduce((a, b) => a..addAll(b));
