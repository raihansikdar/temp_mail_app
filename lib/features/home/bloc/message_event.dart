import 'package:equatable/equatable.dart';
abstract class MessageEvent extends Equatable{
  const MessageEvent();
}

class GetMessageData extends MessageEvent{

  @override
  List<Object?> get props => [];

}