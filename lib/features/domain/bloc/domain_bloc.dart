import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail_app/features/domain/bloc/domain_event.dart';
import 'package:temp_mail_app/features/domain/bloc/domain_state.dart';
import 'package:temp_mail_app/features/domain/model/domain_model.dart';
import 'package:temp_mail_app/services/network_caller.dart';
import 'package:temp_mail_app/services/network_response.dart';
import 'package:temp_mail_app/utility/urls.dart';

class DomainBloc extends Bloc<DomainEvent,DomainState>{

  DomainModel domainModel = DomainModel();

  DomainBloc():super(DomainInitState()){
    on<GetDomainData>((event, emit) async{
       emit(DomainLoadingState());
       NetworkResponse response = await NetworkCaller.getRequest(Urls.domainUrl);

       if(response.isSuccess){
         domainModel = DomainModel.fromJson(response.body);
         emit(DomainDataLoadedState(domainModel));
       }else{
         emit(DomainErrorState(errorMessage: 'Domain can\'t fetch'));
       }
    });
  }
}