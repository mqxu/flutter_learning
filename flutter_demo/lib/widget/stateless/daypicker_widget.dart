import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class DayPickerWidget extends StatefulWidget {
  const DayPickerWidget({Key? key}) : super(key: key);

  @override
  State<DayPickerWidget> createState() => _DayPickerWidgetState();
}

class _DayPickerWidgetState extends State<DayPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DayPicker'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '日期选择器',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '日期选择组件，可指定当前日期、选中日期、展示月份等，接收日期选中事件。',
                  style: descStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _buildShowDatePicker();
                },
                child: const Text('选择日期'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildShowDatePicker() {
    showDatePicker(
        locale: const Locale('zh'),
        context: context,
        // 初始化选中日期
        initialDate: DateTime.now(),
        // 开始日期
        firstDate: DateTime(2022, 1),
        // 结束日期
        lastDate: DateTime(2023, 12),
        // 日历弹框样式
        initialEntryMode: DatePickerEntryMode.calendar,
        // 文字方向
        textDirection: TextDirection.ltr,
        // 当前日期
        currentDate: DateTime.now(),
        // 左上方提示
        helpText: "日历",
        // 取消按钮文案
        cancelText: "取消",
        // 确认按钮文案
        confirmText: "确认",
        // 格式错误提示
        errorFormatText: "errorFormatText",
        // 输入不在 first 与 last 之间日期提示
        errorInvalidText: "errorInvalidText",
        // 输入框上方提示
        fieldLabelText: "fieldLabelText",
        // 输入框为空时内部提示
        fieldHintText: "fieldHintText",
        // 日期选择模式，默认为天数选择
        initialDatePickerMode: DatePickerMode.day,
        // 是否为根导航器
        useRootNavigator: true,
        // 设置不可选日期，这里将 2022-7-15，2022-7-16，2022-7-17 三天设置不可选
        selectableDayPredicate: (dayTime) {
          if (dayTime == DateTime(2022, 7, 15) ||
              dayTime == DateTime(2022, 7, 16) ||
              dayTime == DateTime(2022, 7, 17)) {
            return false;
          }
          return true;
        });
  }
}
