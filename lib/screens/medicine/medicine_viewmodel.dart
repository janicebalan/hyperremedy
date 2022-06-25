import 'package:hyperremedy/screens/medicine/notification/notification_api.dart';

import '../../app/dependencies.dart';
import '../../models/medicine.dart';
import '../../models/reminder.dart';
import '../../services/medicine/medicine_service.dart';
import '../../services/reminder/reminder_service.dart';
import '../viewmodel.dart';

class MedicineViewmodel extends Viewmodel {
  MedicineService get _service => dependency();

  Medicine _medicine;
  String _medicineName;
  String _freqIntake;
  String _totalPills;
  String _pillsLeft = '';
  String _pillsNotify = '';
  String _userID;
  String _dose;
  String _date;
  String _selectedValue = "Once a day";

  get medicine => _medicine;
  set medicine(value) => _medicine = value;

  get medicineName => _medicineName;
  set medicineName(value) => _medicineName = value;

  get freqIntake => _freqIntake;
  set freqIntake(value) => _freqIntake = value;

  get totalPills => _totalPills;
  set totalPills(value) => _totalPills = value;

  get pillsLeft => _pillsLeft;
  set pillsLeft(value) => _pillsLeft = value;

  get pillsNotify => _pillsNotify;
  set pillsNotify(value) => _pillsNotify = value;

  get userID => _userID;
  set userID(value) => _userID = value;

  get dose => _dose;
  set dose(value) => _dose = value;

  get date => _date;
  set date(value) {
    turnBusy();
    _date = value;
    turnIdle();
  }

  get selectedValue => _selectedValue;
  set selectedValue(value) {
    turnBusy();
    _selectedValue = value;
    turnIdle();
  }

  List<Medicine> medicinesListById;
  get medicinesList => medicinesListById;

  Medicine medicinesReminder;
  get medicinesRemind => medicinesReminder;

  MedicineViewmodel();
  MedicineViewmodel.overloadedContructorNamedArguemnts(dynamic id) {
    getMedicines(id);
  }
  MedicineViewmodel.overloadedContructorGetMedicine(dynamic id) {
    getMedicinesOne(id);
  }

  void getMedicinesOne(dynamic id) async {
    turnBusy();
    medicinesReminder = await _service.getMedicinesReminder(id);
    if (medicinesReminder.pillsLeft != "0") {
      int newValue = int.parse(medicinesReminder.pillsLeft) -
          int.parse(medicinesReminder.dose);
      medicinesReminder.pillsLeft = newValue.toString();
      if (medicinesReminder.pillsLeft == "0") {
        NotificationApi.cancelNotification(id: id.hashCode);
      }
    }

    updateMedicinesReminder(medicinesReminder);
    turnIdle();
  }

  void updateMedicinesReminder(Medicine medicine) async {
    turnBusy();
    final Medicine medicines = await _service.updateMedicines(medicine);
    medicinesReminder = medicines;
    turnIdle();
  }

  void getMedicines(dynamic id) async {
    turnBusy();
    medicinesListById = await _service.getMedicinesById(id);
    turnIdle();
  }

  void removeMedicines(Medicine medicines, int index) async {
    turnBusy();
    await _service.removeMedicines(medicines);
    medicinesListById.removeAt(index);
    turnIdle();
  }

  void addMedicines(Medicine medicines) async {
    turnBusy();
    final Medicine medicine = await _service.addMedicines(medicines);
    medicinesListById.insert(0, medicine);
    turnIdle();
  }

  void updateMedicines(int index, Medicine medicine) async {
    turnBusy();
    final Medicine medicines = await _service.updateMedicines(medicine);
    medicinesListById[index] = medicines;
    turnIdle();
  }

  //REMINDER

  ReminderService get _serviceReminder => dependency();
  Reminder _reminder;
  int _hour;
  int _minute;
  String _medsId;

  get reminder => _reminder;
  set reminder(value) => _reminder = value;

  get hour => _hour;
  set hour(value) {
    turnBusy();
    _hour = value;
    turnIdle();
  }

  get minute => _minute;
  set minute(value) {
    turnBusy();
    _minute = value;
    turnIdle();
  }

  get medsId => _medsId;
  set medsId(value) => _medsId = value;

  List<Reminder> remindersListById;
  get remindersList => remindersListById;
  set remindersList(value) {
    turnBusy();
    remindersListById = value;
    turnIdle();
  }

  MedicineViewmodel.overloadedContructorNamedArguments(dynamic id) {
    getReminders(id);
  }

  void getReminders(dynamic id) async {
    turnBusy();
    remindersListById = await _serviceReminder.getRemindersById(id);
    turnIdle();
  }

  void removeReminders(Reminder reminders, int index, String id) async {
    turnBusy();
    await _serviceReminder.removeReminders(reminders);
    remindersListById.removeAt(index);
    NotificationApi.cancelNotification(id: id.hashCode);
    turnIdle();
  }

  void addReminders(Reminder reminders) async {
    turnBusy();
    final Reminder reminder = await _serviceReminder.addReminders(reminders);
    remindersListById.add(reminders);
    NotificationApi.showScheduledNotification(
      id: reminder.id.hashCode,
      title: 'Take your medicine!',
      body: 'Click on this once you have taken your medicine',
      payload: '${reminder.medsId}',
      hour: reminder.hour,
      minute: reminder.minute,
    );
    turnIdle();
  }
}
