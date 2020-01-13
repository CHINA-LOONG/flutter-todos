import 'package:flutter/material.dart';

import 'package:todo/config/provider_config.dart';
import 'package:todo/app.dart';

void main() => runApp(ProviderConfig.getInstance().getGlobal(TodoApp()));



