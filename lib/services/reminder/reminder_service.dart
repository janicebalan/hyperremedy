import '../../models/reminder.dart';

abstract class ReminderService {
  Future<List<Reminder>> getRemindersById(dynamic id);
  Future<void> removeReminders(Reminder reminders);
  Future<Reminder> addReminders(Reminder reminders);
}
