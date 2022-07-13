import 'package:flutter/material.dart';
import 'package:tech_test/utils/colors.dart';

const endpoint = 'https://api.dashboard.eatroot.io/api';
String kBearerToken = '';
String kUserName = '';

const kDivider = Divider(
  thickness: 2,
  height: 30,
  indent: 30,
  endIndent: 30,
);

const kLoadingIndicatorPink = CircularProgressIndicator(
  color: kColorPrimaryPink,
);
