import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '对话框',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '最简易的对话框面板，包含一个内容组件，可指定影深、背景色、形状等属性。',
                  style: descStyle,
                ),
              ),
              MaterialButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Colors.blue,
                onPressed: () {
                  showDialog(
                      context: context, builder: (ctx) => _buildDialog());
                },
                child: const Text(
                  'Dialog',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialog() => const Dialog(
        backgroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SizedBox(
          width: 50,
          child: DeleteDialog(),
        ),
      );
}

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildBar(context),
        _buildTitle(),
        _buildContent(),
        _buildFooter(context),
      ],
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Delete Document',
      style: titleStyle,
    );
  }

  Widget _buildContent() {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Text(
        '   If you push the conform button ,'
        ' You will lose this file. Are you sure to do that?',
        style: descStyle,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildFooter(context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 15.0, top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 100,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Color(0xff73D1EE)),
            child: const Text(
              'Yes',
              style: descStyle,
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.orangeAccent),
              child: const Text(
                'Cancel',
                style: descStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildBar(context) => Container(
        height: 30,
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(right: 10, top: 5),
        child: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.close,
            color: Color(0xff82CAE3),
          ),
        ),
      );
}
