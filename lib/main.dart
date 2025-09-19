// lib/main.dart
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// 這是我們今天主要的工作區域
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            child: const Column(
              // 這個內部的 Column，我們希望文字靠左對齊
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '本月總支出',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                Text(
                  'NT\$ 12,345',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                      Icon(
                        Icons.edit,
                        size: 300,
                        color: Colors.deepPurple,
                      ), // 建議調整 size 為 40，避免過大
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
        ],
      ),
    );
  }
}
