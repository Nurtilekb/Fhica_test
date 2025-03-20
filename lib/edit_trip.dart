import 'package:appp/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class EditTrip extends StatefulWidget {
  final int tripIndex;
  final Trip trip;

  const EditTrip({super.key, required this.tripIndex, required this.trip});

  @override
  State<EditTrip> createState() => _EditTripState();
}

class _EditTripState extends State<EditTrip> {
  late TextEditingController tripNameController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _tripNameError;

  List<String> contrys = [
    "Paris",
    "Munich",
    "London",
    "Oslo",
    "Helsinki",
    "Krakow",
  ];

  late List<bool> _checkboxValues;

  @override
  void initState() {
    super.initState();
    tripNameController = TextEditingController(text: widget.trip.name);
    _checkboxValues =
        contrys.map((city) => widget.trip.cities.contains(city)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Trip',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name trip',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'interTight',
                  ),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: tripNameController,
                  decoration: InputDecoration(
                    hintText: 'Write a name trip',
                    errorText: _tripNameError,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Select cities',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'interTight',
                  ),
                ),
                SizedBox(height: 10.h),
                Column(
                  children: List.generate(contrys.length, (i) {
                    return CheckboxListTile(
                      title: Transform.translate(
                        offset: Offset(-14.w, 0),
                        child: Text(contrys[i]),
                      ),
                      value: _checkboxValues[i],
                      onChanged: (bool? value) {
                        setState(() {
                          _checkboxValues[i] = value ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFF00a5df),
                      checkColor: Colors.white,
                    );
                  }),
                ),
                SizedBox(height: 85.h),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00a5df),
                    minimumSize: Size(343.w, 56.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                  ),
                  onPressed: () async {
                    if (tripNameController.text.isEmpty) {
                      setState(() {
                        _tripNameError = 'Please enter a trip name';
                      });
                      return;
                    }

                    var box = Hive.box<Trip>('trips');
                    List<String> selectedCities = [];
                    for (int i = 0; i < contrys.length; i++) {
                      if (_checkboxValues[i]) {
                        selectedCities.add(contrys[i]);
                      }
                    }

                    Trip updatedTrip = Trip(
                      name: tripNameController.text,
                      cities: selectedCities,
                    );

                    await box.putAt(widget.tripIndex, updatedTrip);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Color(0xFFEDFAFF),
                      fontSize: 16.sp,
                      fontFamily: "interTight",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
