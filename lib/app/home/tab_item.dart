import 'package:flutter/material.dart';

enum TabItem { jobs, entires, account }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});
  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.jobs: TabItemData(icon: Icons.work, title: "Jobs"),
    TabItem.entires: TabItemData(icon: Icons.view_headline, title: "Entires"),
    TabItem.account: TabItemData(icon: Icons.person, title: "Account"),
  };
}
