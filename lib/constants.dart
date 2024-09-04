import 'package:flutter/material.dart';

// Colors
const kPrimaryColor = Color(0xFF0A0E21);
const kAccentColor = Color(0xFFEB1555);
const kLightTextColor = Color(0xFF8D8E98);
const kDarkTextColor = Color(0xFFFFFFFF);
const kBackgroundColor = Color(0xFF0A0E21);

// Text Styles
const kHeadingTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: kDarkTextColor,
);

const kSubheadingTextStyle = TextStyle(
  fontSize: 20.0,
  color: kLightTextColor,
);

const kButtonTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: kDarkTextColor,
);

// API URLs
const String kWeatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';
const String kApiKey = 'YOUR_API_KEY_HERE';

// Padding and Margins
const double kDefaultPadding = 16.0;
const double kDefaultMargin = 16.0;

// Asset Paths
const String kLogoPath = 'assets/images/logo.png';

// Other Constants
const String kAppName = 'Weather App';
const double kIconSize = 40.0;
