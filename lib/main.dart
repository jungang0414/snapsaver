// lib/main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 假資料的結構
class Transaction {
  final String title;
  final String category;
  final double amount;
  final DateTime date;

  Transaction({
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 關閉右上角的 Debug 標籤
      debugShowCheckedModeBanner: false,
      title: 'SnapSaver',
      // 就是它！App 的風格都由這裡定義
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,

        textTheme: GoogleFonts.notoSansTcTextTheme(Theme.of(context).textTheme),
      ),
      // 移除 'const' 關鍵字
      home: HomePage(),
    );
  }
}

// 這是我們今天主要的工作區域
class HomePage extends StatelessWidget {
  // 移除 'const' 關鍵字
  HomePage({super.key});

  // 建立一個假資料列表
  final List<Transaction> transactions = [
    Transaction(
      title: '7-Eleven 便利商店',
      category: '餐飲',
      amount: 85,
      date: DateTime(2024, 6, 1),
    ),
    Transaction(
      title: '全聯福利中心',
      category: '購物',
      amount: 750,
      date: DateTime(2024, 6, 2),
    ),
    Transaction(
      title: '週末電影票',
      category: '娛樂',
      amount: 540,
      date: DateTime(2024, 6, 3),
    ),
    Transaction(
      title: '捷運月票',
      category: '交通',
      amount: 1280,
      date: DateTime(2024, 6, 4),
    ),
    Transaction(
      title: '電信費',
      category: '生活繳費',
      amount: 499,
      date: DateTime(2024, 6, 5),
    ),
    Transaction(
      title: '捷運月票',
      category: '交通',
      amount: 1280,
      date: DateTime(2024, 7, 4),
    ),
    Transaction(
      title: '捷運月票',
      category: '交通',
      amount: 1280,
      date: DateTime(2024, 8, 4),
    ),
    Transaction(
      title: '捷運月票',
      category: '交通',
      amount: 1280,
      date: DateTime(2024, 9, 4),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('省錢拍拍 (SnapSaver)'),
        backgroundColor: Colors.deepPurple.shade200, // 給 AppBar 一點顏色
      ),
      body: Column(
        // Column 的主軸是垂直的，我們希望內容從頂部開始
        mainAxisAlignment: MainAxisAlignment.start,
        // Column 的交錯軸是水平的，我們希望內容撐滿寬度
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // children 屬性接收一個 Widget 列表
          // 1. 頂部總覽區塊
          Container(
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            // 【重要觀念修正】: 因為下方的 Text Widget 使用了 Theme.of(context)，
            // 它是一個執行時的值，所以這裡的 Column 不能是 const。
            child: Column(
              // 這個內部的 Column，我們希望文字靠左對齊
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '本月總支出',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                Text(
                  'NT\$ 12,345',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.teal.shade700,
                  ),
                ),
              ],
            ),
          ),

          // 2. 中間功能按鈕區塊
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  // 第一個按鈕
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: Colors.deepPurple,
                      ),
                      Text('掃描發票'),
                    ],
                  ),
                ),
                Expanded(
                  // 第二個按鈕
                  child: Column(
                    children: [
                      Icon(Icons.edit, size: 40, color: Colors.deepPurple),
                      Text('手動記帳'),
                    ],
                  ),
                ),
                Expanded(
                  // 第三個按鈕
                  child: Column(
                    children: [
                      Icon(Icons.history, size: 40, color: Colors.deepPurple),
                      Text('查看紀錄'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 分隔線
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(),
          ),

          // 使用 Expanded 包裹 ListView.builder
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = transactions[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 6.0,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.receipt_long,
                      color: Colors.deepPurple,
                    ),
                    title: Text(transaction.title),
                    subtitle: Text(transaction.category),
                    trailing: Text(
                      'NT\$ ${transaction.amount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
