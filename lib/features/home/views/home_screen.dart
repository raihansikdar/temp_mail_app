import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail_app/common_widgets/body_header.dart';
import 'package:temp_mail_app/common_widgets/custom_appbar.dart';
import 'package:temp_mail_app/constants/app_colors.dart';
import 'package:temp_mail_app/constants/custom_size_extension.dart';
import 'package:temp_mail_app/features/home/bloc/message_bloc.dart';
import 'package:temp_mail_app/features/home/bloc/message_event.dart';
import 'package:temp_mail_app/features/home/bloc/message_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MessageBloc>().add(GetMessageData());
    });
    return Scaffold(
      appBar: const CustomAppBar(leading: false, action: true,),
      body: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, _messageState) {
          if (_messageState is MessageLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (_messageState is MessageDataLoadedState) {
            return SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: ()async{
                  context.read<MessageBloc>().add(GetMessageData());
                },
                child: Column(
                  children: [
                    BodyHeader(
                      headerText: _messageState.messageModel.hydraMember?.isNotEmpty == true
                          ? _messageState.messageModel.hydraMember?.first.to?.first.address ?? 'null'
                          : '',

                    ),
                    Padding(
                      padding: EdgeInsets.all(16.rSp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16.rSp,),
                          Text('Message', style: TextStyle(fontSize: 24.rSp, fontWeight: FontWeight.w600, color: AppColors.appBarColors),),
                          ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: _messageState.messageModel.hydraMember?.length ?? 0,
                            itemBuilder: (context, index) {
                              var state = (_messageState.messageModel.hydraMember!.isNotEmpty)
                                  ? _messageState.messageModel.hydraMember![index]
                                  : null;




                              return Card(
                                child: Padding(
                                  padding: EdgeInsets.all(16.rSp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Form", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.appBarColors),),
                                      Text("${state?.from?.name ?? ''} <${state?.from?.address}>", style: const TextStyle(fontWeight: FontWeight.w400),),
                                      const Text("To", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.appBarColors),),
                                      Text("<${state?.to?[0].address ?? ''}>", style: const TextStyle(fontWeight: FontWeight.w400),),
                                      const Text("Time", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.appBarColors),),
                                      Text(state?.createdAt ?? '', style: const TextStyle(fontWeight: FontWeight.w400),),

                                      const Text("Subject", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.appBarColors),),
                                      Text(state?.subject ?? '', style: const TextStyle(fontWeight: FontWeight.w400),),
                                      const Text("Details", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.appBarColors),),
                                      Text(state?.intro ?? '', style: const TextStyle(fontWeight: FontWeight.w400),),

                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(height: 8.rSp,),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (_messageState is MessageErrorState) {
            return Center(child: Text(_messageState.errorMessage));
          } else {

            return Center(child: SizedBox(child: Text('New account no data have found'),));
          }
        },
      ),
    );
  }
}
