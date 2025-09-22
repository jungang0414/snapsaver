// lib/add_transaction_page.dart (完整範例)
import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});
  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  // 1. 建立 GlobalKey
  final _formKey = GlobalKey<FormState>();

  // 2. 建立各個欄位的 Controller
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // 3. 觸發驗證
    if (_formKey.currentState!.validate()) {
      // 如果驗證通過
      final title = _titleController.text;
      final amount = double.tryParse(_amountController.text) ?? 0.0;

      print('品項: $title, 金額: $amount');
      // 在這裡，我們未來會將資料傳回主頁面

      // 驗證通過後，返回上一頁
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('新增一筆消費')),
      body: Form(
        // 4. 用 Form 包裹
        key: _formKey, // 5. 綁定 Key
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // 6. 將 TextField 改為 TextFormField
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: '品項名稱'),
              // 7. 加入驗證邏輯
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '請輸入品項名稱';
                }
                return null; // 回傳 null 代表驗證通過
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: '金額'),
              keyboardType: TextInputType.number, // 設定鍵盤為數字鍵盤
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '請輸入金額';
                }
                if (double.tryParse(value) == null) {
                  return '請輸入有效的數字';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submitForm, // 8. 綁定提交函式
              child: const Text('儲存'),
            ),
          ],
        ),
      ),
    );
  }
}
