import '../../app/dependencies.dart';
import '../../models/reminder.dart';
import '../rest.dart';
import 'reminder_service.dart';

class ReminderServiceRest implements ReminderService {
  RestService get rest => dependency();

  Future<List<Reminder>> getRemindersById(dynamic id) async {
    print('print id in service');
    print(id);
    final List listJson = await rest.get('reminders?medsId=$id');
    // print('print json in service');
    // print(listJson);
    return listJson.map((json) => Reminder.fromJson(json)).toList();
  }

  Future<void> removeReminders(Reminder reminders) async {
    await rest.delete('reminders/${reminders.id}');
  }

  Future<Reminder> addReminders(Reminder reminders) async {
    final json = await rest.post('reminders', data: reminders);
    return Reminder.fromJson(json);
  }
}
