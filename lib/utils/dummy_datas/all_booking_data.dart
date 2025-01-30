class AllbookingModel {
  AllbookingModel(
      {required this.charging,
      required this.image,
      required this.date,
      required this.week,
      required this.vehiclename,
      required this.slot,
      required this.time});
  String time;
  String charging;
  String slot;
  String vehiclename;
  String week;
  String date;
  String image;
}

List<AllbookingModel> bookingdatas = [
  AllbookingModel(
      charging: "yes",
      image: "assets/images/car.png",
      date: "30",
      week: "Wed",
      vehiclename: "BMW",
      slot: "P-17",
      time: "1 Day  2h 30m 30s"),
       AllbookingModel(
      charging: "yes",
      image: "assets/images/scooty.png",
      date: "31",
      week: "Aug",
      vehiclename: "Activa",
      slot: "P-14",
      time: "1 Day  2h 30m 30s"),
      AllbookingModel(
      charging: "yes",
      image: "assets/images/car.png",
      date: "31",
      week: "Wed",
      vehiclename: "BMW",
      slot: "P-17",
      time: "1 Day  2h 30m 30s"),

];
