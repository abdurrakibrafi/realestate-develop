// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/common/profileScreens/incomePages/income_details_page.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final List<double> incomeData = [
    50.0,
    70.0,
    100.0,
    200.0,
    150.0,
    250.0,
  ];

  double totalIncome = 1200.0;

  final List<Map<String, String>> paymentRecords = [
    {
      'name': 'chichok',
      'property name': 'abc',
      'date': 'Mar 1, 2024',
      'total spent': '100',
    },
    {
      'name': 'chichok',
      'property name': 'abc',
      'date': 'Mar 1, 2024',
      'total spent': '100',
    },
    {
      'name': 'chichok',
      'property name': 'abc',
      'date': 'Mar 1, 2024',
      'total spent': '100',
    },
    {
      'name': 'chichok',
      'property name': 'abc',
      'date': 'Mar 1, 2024',
      'total spent': '100',
    },
    {
      'name': 'chichok',
      'property name': 'abc',
      'date': 'Mar 1, 2024',
      'total spent': '100',
    },
    {
      'name': 'chichok',
      'property name': 'abc',
      'date': 'Mar 1, 2024',
      'total spent': '100',
    },
    {
      'name': 'chichok',
      'property name': 'abc',
      'date': 'Mar 1, 2024',
      'total spent': '100',
    },
  ];
  List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
  String dropdownValue = 'Weekly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("Income".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: AppColor.primaryColor, width: 1),
                        ),
                        child: DropdownButton<String>(
                          focusColor: AppColor.whiteColor,

                          dropdownColor: AppColor.whiteColor,
                          value: dropdownValue,

                          icon: SizedBox
                              .shrink(), // Remove the default dropdown icon
                          elevation: 16,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          underline:
                              SizedBox(), // Removes the underline of the dropdown
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Daily',
                            'Weekly',
                            'Monthly',
                            'Yearly'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                  ),
                                  SizedBox(width: 8),
                                  commonText(value),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 255,
                    width: 255,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                color: Colors.lightGreen,
                                value: 25,
                                radius: 40,
                                badgePositionPercentageOffset: 1,
                                badgeWidget: Container(
                                  width: 100,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            "assets/icons/Union.png",
                                          )),

                                      //AppColor.whiteColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(child: commonText("1234")),
                                ),
                                title: '',
                              ),
                              PieChartSectionData(
                                color: const Color.fromARGB(221, 29, 29, 29),
                                value: 75,
                                radius: 40,
                                title: '',
                              ),
                            ],
                            startDegreeOffset: 270,
                            sectionsSpace: 0, // Space between sections
                            centerSpaceRadius:
                                60, // Inner radius for creating the donut shape
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            commonText("Total Income", isBold: true),
                            commonText('1200 K.D',
                                color: AppColor.primaryColor,
                                size: 18,
                                isBold: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      commonText("Transactions".tr, size: 18, isBold: true),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10))),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Center(
                                child: commonText('Tenant Name'.tr,
                                    isBold: true,
                                    color: Colors.white,
                                    size: 11),
                              )),
                              Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: commonText('Property ID'.tr,
                                        isBold: true,
                                        color: Colors.white,
                                        size: 11),
                                  )),
                              Expanded(
                                  child: Center(
                                      child: commonText('Date'.tr,
                                          isBold: true,
                                          color: Colors.white,
                                          size: 11))),
                              Expanded(
                                  child: Center(
                                child: commonText('Earned'.tr,
                                    isBold: true,
                                    color: Colors.white,
                                    size: 11),
                              )),
                            ],
                          ),
                        ),
                        Column(
                          children: List.generate(
                            paymentRecords.length,
                            (index) {
                              final record = paymentRecords[index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const IncomeDetailsPage()),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 20, 10, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Center(
                                            child: commonText(record['name']!,
                                                size: 11),
                                          )),
                                          Expanded(
                                              flex: 2,
                                              child: Center(
                                                child: commonText(
                                                    record['property name']!,
                                                    size: 11),
                                              )),
                                          Expanded(
                                              child: Center(
                                                  child: commonText(
                                                      record['date']!,
                                                      size: 11))),
                                          Expanded(
                                              child: Center(
                                            child: commonText(
                                                record['total spent']!,
                                                size: 11),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (index != paymentRecords.length - 1)
                                    const Divider(
                                      color: Colors.grey,
                                      height: 0.1,
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget commonButton(String title,
      {Color color = AppColor.primaryColor,
      double width = double.infinity,
      VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: color,
        ),
        child: Center(
          child: commonText(title, size: 12, color: Colors.white),
        ),
      ),
    );
  }

  Widget graphChart() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final monthIndex = value.toInt();
                  if (monthIndex >= 0 && monthIndex < months.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        months[monthIndex],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) {
                return Colors.red;
              },
              tooltipMargin: -15,
              tooltipHorizontalOffset: 60,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((touchedSpot) {
                  return LineTooltipItem(
                    '\$${touchedSpot.y.toStringAsFixed(2)}',
                    TextStyle(color: Colors.white),
                  );
                }).toList();
              },
            ),
            getTouchLineEnd: (barData, spotIndex) {
              return 0;
            },
            getTouchLineStart: (barData, spotIndex) {
              return 0;
            },
            handleBuiltInTouches: true,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                incomeData.length,
                (index) => FlSpot(index.toDouble(), incomeData[index]),
              ),
              isCurved: true,

              color: Colors.red, // Set the line color to orange
              barWidth: 0, // Set the line width
              dotData: FlDotData(show: false), // Hide the dots
              belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      Colors.orange,
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
              // Hide the area below the line
            ),
          ],
        ),
      ),
    );
  }
}
