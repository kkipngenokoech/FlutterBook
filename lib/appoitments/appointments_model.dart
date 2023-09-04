class AppointmentModel {
  int id;
  String title;
  String description;
  String appointmentDate;
  String appointmentTime;

  AppointmentModel({
    required this.id,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.description,
    required this.title
  });
}
