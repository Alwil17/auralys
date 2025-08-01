class SleepTimeItem {
  final String title;
  final String subtitle;
  
  SleepTimeItem({
    required this.title, 
    required this.subtitle,
  });
}

// Sleep quality data
List<SleepTimeItem> sleepTimeItems = [
  SleepTimeItem(title: 'Excellent', subtitle: '8-9 HOURS'),
  SleepTimeItem(title: 'Good', subtitle: '7-8 HOURS'),
  SleepTimeItem(title: 'Fair', subtitle: '6-7 HOURS'),
  SleepTimeItem(title: 'Poor', subtitle: '4-6 HOURS'),
  SleepTimeItem(title: 'Very Poor', subtitle: '< 4 HOURS'),
];
