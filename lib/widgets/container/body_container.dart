import 'package:flutter/material.dart';

enum FlyBodyStatus {
  loading,
  completed,
  err,
}

/// 基础body组件封装
/// [hasErr] 是否发生错误
/// [body] 展示的内容
/// [errWidget] 发生错误时的内容
/// [onTapErr] 发生错误后,点击错误组件的回调
class FlyBodyContainer extends StatelessWidget {
  final bool hasErr;
  final Widget body;
  final Widget? errWidget;
  final Function() onTapErr;

  const FlyBodyContainer({
    super.key,
    required this.body,
    required this.hasErr,
    this.errWidget,
    required this.onTapErr,
  });

  @override
  Widget build(BuildContext context) {
    return hasErr ? _buildErrWidget() : body;
  }

  Widget _buildErrWidget() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: InkWell(
          onTap: onTapErr,
          splashColor: Colors.transparent,
          child: errWidget ??
              const Center(
                child: Text('╮（╯▽╰）╭ 发生错误了,请稍后点击重试'),
              ),
        ),
      ),
    );
  }
}
