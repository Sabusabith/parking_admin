import 'package:get/get.dart';

class BookingController extends GetxController {
  RxList<bool> isApprovedList = <bool>[].obs;

  // Initialize the approval list based on the number of bookings
  void initializeApprovalList(int itemCount) {
    isApprovedList.value = List<bool>.filled(itemCount, false);
  }

  // Approve or unapprove the specific index
  void toggleApproval(int index) {
    isApprovedList[index] = !isApprovedList[index];
    print(index);

  }
}
