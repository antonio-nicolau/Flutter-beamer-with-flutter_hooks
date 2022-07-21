import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useVideoController() {
  return use(const _UseVideoControllerHook());
}

class _UseVideoControllerHook extends Hook<void> {
  const _UseVideoControllerHook();

  @override
  _UseVideoControllerHookState createState() => _UseVideoControllerHookState();
}

class _UseVideoControllerHookState extends HookState<void, _UseVideoControllerHook> {
  @override
  void initHook() {
    log('calling-> initstate');
  }

  @override
  void dispose() {
    log('calling-> dispose');
  }

  @override
  Widget? build(BuildContext context) => null;
}
