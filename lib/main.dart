import 'package:flutter/material.dart';

// 🔹 نقطة البداية للتطبيق
void main() {
  runApp(const MyApp());
}

// 🔹 تطبيق رئيسي يقوم بتحميل صفحة لوحة التحكم
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

// 🔹 صفحة لوحة التحكم
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:  Color.fromARGB(255, 181, 184, 195),
        appBar: AppBar(
          backgroundColor:  Color.fromARGB(255, 84, 118, 228),
          elevation: 0,
          title: const Text(
            "لوحة التحكم",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Cairo',
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(12),
              child: Icon(Icons.notifications, color: Colors.white),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              // البطاقات العليا
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF4F46E5)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _statCard("الحملات النشطة", "1"),
                    _statCard("إجمالي المستفيدين", "3"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // إجراءات سريعة
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "إجراءات سريعة",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _quickAction(
                          color: Colors.green,
                          icon: Icons.inventory_2,
                          label: "إدارة المساعدات",
                        ),
                        _quickAction(
                          color: Colors.purple,
                          icon: Icons.card_giftcard,
                          label: "إنشاء حملة",
                        ),
                        _quickAction(
                          color: Colors.blue,
                          icon: Icons.group_add,
                          label: "إضافة مستفيد",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // الإحصائيات السريعة
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "الإحصائيات السريعة",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          _statRow("المستفيدون النشطون", "4"),
                          const Divider(),
                          _statRow("عدد الحملات الحالية", "2"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // شريط التنقل السفلي
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue[700],
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: "المستفيدين"),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: "الحملات"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "الإشعارات"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: "التقارير"),
          ],
        ),
      ),
    );
  }

  // بطاقات الإحصائيات
  static Widget _statCard(String title, String value) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Cairo',
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
    );
  }

  // أزرار الإجراءات السريعة
  static Widget _quickAction({
    required Color color,
    required IconData icon,
    required String label,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }

  // صف الإحصائيات
  static Widget _statRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'Cairo',
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }
}
