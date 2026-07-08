class CalendarModel {
  final String title;
  final String month;
  final int year;
  final List<String> weekdays;
  final int daysInMonth;
  final List<int> highlightedDays;

  const CalendarModel({
    required this.title,
    required this.month,
    required this.year,
    required this.weekdays,
    required this.daysInMonth,
    required this.highlightedDays,
  });
}
