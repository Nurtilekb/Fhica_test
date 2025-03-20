import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Finance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amount of travel in the trip',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black54,
                fontFamily: 'interTight',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$29850.00',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 490.h,
              // Ограничение высоты для горизонтального списка
              child: ListView(
                scrollDirection: Axis.horizontal, // Горизонтальный скролл
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildExpenseItem('Hotels', '\$4200.00'),
                      _buildExpenseItem('Coffee houses', '\$1400.00'),
                      _buildExpenseItem('Restaurants', '\$5420.00'),
                      _buildExpenseItem('Beaches', '\$4200.00'),
                      _buildExpenseItem('Cultural', '\$1400.00'),
                      _buildExpenseItem('Spa', '\$800.00'),
                      _buildExpenseItem('Sightseeing', '\$640.00'),
                    ],
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildExpenseItem('Bars', '\$800.00'),
                      _buildExpenseItem('Museums', '\$480.00'),
                      _buildExpenseItem('Natural areas', '\$640.00'),
                      _buildExpenseItem('Sports areas', '\$800.00'),
                      _buildExpenseItem('Parks', '\$800.00'),
                    ],
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildExpenseItem('Spa', '\$1000.00'),
                      _buildExpenseItem('Coffee', '\$780.00'),
                      _buildExpenseItem('Coffee', '\$240.00'),
                      _buildExpenseItem('Beaches', '\$1400.00'),
                      _buildExpenseItem('Parks', '\$80.00'),
                    ],
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildExpenseItem('museums', '\$400.00'),
                      _buildExpenseItem('restuarant', '\$280.00'),
                      _buildExpenseItem('Parks', '\$140.00'),
                      _buildExpenseItem('Areas', '\$830.00'),
                      _buildExpenseItem('Street food', '\$1200.00'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpenseItem(String title, String amount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'interTight',
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            amount,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
