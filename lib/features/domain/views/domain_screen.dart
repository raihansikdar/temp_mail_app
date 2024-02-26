import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail_app/common_widgets/body_header.dart';
import 'package:temp_mail_app/common_widgets/custom_appbar.dart';
import 'package:temp_mail_app/constants/app_colors.dart';
import 'package:temp_mail_app/constants/custom_size_extension.dart';
import 'package:temp_mail_app/features/auth/login/views/login_screen.dart';
import 'package:temp_mail_app/features/domain/bloc/domain_bloc.dart';
import 'package:temp_mail_app/features/domain/bloc/domain_event.dart';
import 'package:temp_mail_app/features/domain/bloc/domain_state.dart';

class DomainScreen extends StatelessWidget {
  const DomainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DomainBloc>().add(GetDomainData());
    });
    return Scaffold(
      backgroundColor: AppColors.bodyColors,
      appBar: const CustomAppBar(leading: false, action: false,),
      body:  BlocBuilder<DomainBloc,DomainState>(
        builder: (context,_domainState) {
          if(_domainState is DomainLoadingState){
            return const Center(child: CircularProgressIndicator());
          }else if(_domainState is DomainDataLoadedState){
            return Column(
              children: [
                const BodyHeader(
                  headerText: 'Available Domain',
                ),
                SizedBox(height: 16.rSp,),
                Padding(
                  padding:  EdgeInsets.all(16.rSp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen(domainName: _domainState.domainModel.hydraMember?.first.domain ?? '')));
                          },
                          child: const Text('Tap to create account or login',style: TextStyle(color: AppColors.appBarColors,fontWeight: FontWeight.bold),)),
                      SizedBox(height: 16.rSp,),
                     Container(
                       height: 50.rSp,
                       width: double.infinity,
                       decoration: BoxDecoration(
                         color: AppColors.appBarTextColor,
                         borderRadius: BorderRadius.circular(16.rSp),
                       ),
                       child:Row(
                         children: [
                           Padding(
                             padding: EdgeInsets.symmetric(vertical: 8.rSp,horizontal: 16.rSp),
                             child: const Icon(Icons.email),
                           ),
                            Padding(
                              padding: EdgeInsets.all(8.rSp),
                              child: Text(_domainState.domainModel.hydraMember?.first.domain ?? '',style: TextStyle(fontSize: 22.rSp),),
                            ),
                         ],
                       )
                     )
                    ],
                  ),
                ),
              ],
            );
          }else if( _domainState is DomainErrorState){
            return Center(child: Text(_domainState.errorMessage));
          }else{
            return const SizedBox();
          }

        }
      ),
    );
  }
}


