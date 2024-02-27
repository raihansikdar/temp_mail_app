import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail_app/features/home/bloc/message_event.dart';
import 'package:temp_mail_app/features/home/bloc/message_state.dart';
import 'package:temp_mail_app/features/home/model/message_model.dart';
import 'package:temp_mail_app/services/network_caller.dart';
import 'package:temp_mail_app/services/network_response.dart';
import 'package:temp_mail_app/utility/urls.dart';

class MessageBloc extends Bloc<MessageEvent,MessageState>{

  MessageModel messageModel = MessageModel();

  MessageBloc():super(MessageInitState()){
    on<GetMessageData>((event, emit) async{
      emit(MessageLoadingState());

      NetworkResponse response = await NetworkCaller.getRequest(Urls.messageUrl);

      if(response.isSuccess){
        messageModel = MessageModel.fromJson(response.body);
        emit(MessageDataLoadedState(messageModel));
      }else{
        emit(MessageErrorState(errorMessage: 'Data can\'t fetch!'));
      }
    });
  }
}