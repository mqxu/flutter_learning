import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetWidgetState();
}

class _FormWidgetWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color _color = Colors.red;
  final _colors = [Colors.red, Colors.orange, Colors.blue, Colors.green];
  final _info = ['红色', '橙色', '蓝色', '绿色'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form & FormField'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '表单组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可以接收其下的FormField组件的变化回调，通过onWillPop拦截页面返回，通过FormState可对表单字段进行保存或校验。',
                  style: descStyle,
                ),
              ),
              const Text(
                '表单字段组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '一个表单字段，需要在Form组件中使用，内含泛型T的字段作为状态变量，对根据字段的更新和验证会触发相应的回调。'
                  '其子类有字符串类型的TextFormField和下拉选择的DropdownButtonFormField',
                  style: descStyle,
                ),
              ),
              Form(
                // 返回回调
                onWillPop: () => _willPop(context),
                key: _formKey,
                // 表单变化回调
                onChanged: () {
                  print('Form---onChanged');
                },
                // 子组件
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        style: const TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                        ),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'username',
                        ),
                        validator: _validateUsername,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Builder(builder: (context) {
                      return SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _onSubmit,
                          child: const Text('提交'),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '表单下拉框',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '底层依赖DropdownButton实现，基本属性类似，但是拥有 FormField，可以回调onSaved、validator方法。',
                  style: descStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 100,
                    height: 50,
                    color: _color,
                  ),
                  SizedBox(
                    width: 80,
                    child: DropdownButtonFormField<Color>(
                      // 当前值
                      value: _color,
                      // 下拉框中的内容
                      items: _buildItems(),
                      // 影深
                      elevation: 1,
                      // 提示组件
                      hint: const Text(
                        '选择颜色',
                        style: TextStyle(fontSize: 12),
                      ),
                      // 是否密排
                      isDense: false,
                      // 图标
                      icon: Icon(
                        Icons.expand_more,
                        color: _color,
                      ),
                      iconSize: 20,
                      // 选择项改变事件回调
                      onChanged: (v) => setState(() => _color = v!),
                      // 表单保存回调
                      onSaved: (v) => print('onSaved'),
                      // 表单验证回调
                      validator: (v) => 'success',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String? _validateUsername(value) {
    if (value.isEmpty) {
      return '用户名不能为空';
    }
    return null;
  }

  _onSubmit() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      Navigator.of(context).pop();
    }
  }

  Future<bool> _willPop(context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            title: const Text('提示'),
            content: const Text('你确定要离开此页吗?'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('确定'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('取消'),
              ),
            ],
          ),
        ) ??
        false;
  }

  List<DropdownMenuItem<Color>> _buildItems() => _colors
      .map((e) => DropdownMenuItem<Color>(
          value: e,
          child: Text(
            _info[_colors.indexOf(e)],
            style: TextStyle(color: e),
          )))
      .toList();
}
