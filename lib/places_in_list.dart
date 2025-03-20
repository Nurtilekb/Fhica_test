import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListPlaces extends StatefulWidget {
  const ListPlaces({super.key});

  @override
  State<ListPlaces> createState() => _ListPlacesState();
}

class _ListPlacesState extends State<ListPlaces> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h, // Ограничиваем высоту списка
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildCategory('Hotels', [
              Mesto(
                nazvanke: 'Flowerwood Munich',
                descrip: 'Kardonel-Straue 1, 80333 Munich',
              ),
            ]),
            _buildCategory('Sightseeing', [
              Mesto(
                nazvanke: 'Marienplatz',
                descrip: 'Marienplatz, 80331 Munich',
              ),
              Mesto(
                nazvanke: 'Flowerwood Munich',
                descrip: 'Kardonel-Straue 1, 80333 Munich',
              ),
            ]),
            _buildCategory('Coffee houses', [
              Mesto(nazvanke: 'Shark', descrip: 'Shark Place, 80331 Munich'),
              Mesto(
                nazvanke: 'Tower',
                descrip: 'Kardonel-Straue 1, 80333 Munich',
              ),
              Mesto(nazvanke: 'Lower', descrip: 'Lover Palace 1, 80638 Munich'),
              Mesto(
                nazvanke: 'Labrado',
                descrip: 'Labrado Palace, 80331 Munich',
              ),
              Mesto(nazvanke: 'Inch', descrip: 'Inch Palace 1, 80638 Munich'),
            ]),
            _buildCategory('Museums', [
              Mesto(
                nazvanke: 'German Museum',
                descrip: 'German Museum, 80331 Munich',
              ),
              Mesto(
                nazvanke: 'Bavarian National Museum',
                descrip: 'Bavarian National Museum, 80331 Munich',
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String title, List<Mesto> places) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'interTight',
            ),
          ),
          SizedBox(height: 10.h), // Отступ перед списком мест
          ...places, // Вставляем список мест
        ],
      ),
    );
  }
}

class Mesto extends StatelessWidget {
  const Mesto({super.key, required this.nazvanke, required this.descrip});
  final String nazvanke;
  final String descrip;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffE9E9E9),
        borderRadius: BorderRadius.circular(10.r),
      ),
      margin: EdgeInsets.symmetric(vertical: 5.h), // Меньший отступ
      padding: EdgeInsets.all(10.r),
      width: 280.w, // Фиксированная ширина для элементов
      child: Row(
        children: [
          Image.asset(
            'assets/images/labrado.png',
            width: 50.w,
            height: 50.h,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nazvanke,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  descrip,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
