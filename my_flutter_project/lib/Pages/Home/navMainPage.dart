

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/appProvider.dart';
import '../../Class/Providers/homeProvider.dart';
import '../GenericWidget/appBarWidget.dart';
import 'advancedFeaturePage.dart';
import 'basicFeaturePage.dart';
import 'gridViewWidget.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/home/details/extra'),
          child: Text('Go to Extra Details'),
        ),
      ),
    );
  }
}

class ExtraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Extra Details')),
      body: Center(
        child: Text('Extra Details Content'),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}


