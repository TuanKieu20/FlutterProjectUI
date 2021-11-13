class ArmChairModel {
  final String rowSeats;
  final int seats;
  final List<int> freeSeats;

  ArmChairModel({
    required this.rowSeats,
    required this.seats,
    required this.freeSeats,
  });

  static List<ArmChairModel> listChairs = [
    ArmChairModel(rowSeats: 'A', seats: 5, freeSeats: [1, 3, 5]),
    ArmChairModel(rowSeats: 'B', seats: 7, freeSeats: [3, 5, 6]),
    ArmChairModel(rowSeats: 'C', seats: 8, freeSeats: [1, 4, 6, 7]),
    ArmChairModel(rowSeats: 'D', seats: 7, freeSeats: [6, 1, 7]),
    ArmChairModel(rowSeats: 'E', seats: 8, freeSeats: [2, 6, 8]),
    ArmChairModel(rowSeats: 'F', seats: 5, freeSeats: [3]),
  ];
}
