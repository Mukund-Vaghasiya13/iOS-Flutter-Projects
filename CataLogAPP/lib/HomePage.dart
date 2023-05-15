import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productsapps/Catalog.dart';
//https://assets1.lottiefiles.com/packages/lf20_2TUV98WaqI.json
// LoginPage
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderPart(),
            BodyPart(),
          ],
        ),
      ),
    );
  }
}

//header
class HeaderPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
          Image.network(
            "https://static.vecteezy.com/system/resources/previews/005/879/539/original/cloud-computing-modern-flat-concept-for-web-banner-design-man-enters-password-and-login-to-access-cloud-storage-for-uploading-and-processing-files-illustration-with-isolated-people-scene-free-vector.jpg",
            height: 200,
            width: 500,
            fit: BoxFit.fill),
        const SizedBox(
          height: 30,
        ),
         Text(
          "Wellcome",
          style: Theme.of(context).textTheme.labelLarge,
        )
      ],
    );
  }
}

// Body

class BodyPart extends StatefulWidget {
  const BodyPart({super.key});

  @override
  State<BodyPart> createState() => _BodyPartState();
}

class _BodyPartState extends State<BodyPart> {
  var FormKey = GlobalKey<FormState>();
  var secure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: FormKey,
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) {
              if(value!.isEmpty)
              {
                return "Enter Username";
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(CupertinoIcons.person_fill,color: Theme.of(context).iconTheme.color,),
              hintText: "Enter Username",
              labelText: "Username",
               hintStyle: Theme.of(context).textTheme.titleMedium,
              labelStyle: Theme.of(context).textTheme.titleMedium,
               border: OutlineInputBorder(
                borderSide: const BorderSide(width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2,color: Color.fromARGB(255, 79, 164, 123)),
                borderRadius: BorderRadius.circular(10)
              )
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            validator: (value) {
              if(value!.isEmpty){
                return "Enter password";
              }
              else if(value.length != 6){
                return "Password Must Cointain 6 character";
              }
              else{
                return null;
              }
            },
            obscureText: secure,
            style: Theme.of(context).textTheme.titleMedium,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon:  Icon(CupertinoIcons.eye_fill,color: Theme.of(context).iconTheme.color),
                onPressed: () {
                  setState(() {
                    secure = false;
                  });
                },
              ),
              hintText: "Enter Password",
              labelText: "Password",
              hintStyle: Theme.of(context).textTheme.titleMedium,
              labelStyle: Theme.of(context).textTheme.titleMedium,
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2,color: Color.fromARGB(255, 79, 164, 123)),
                borderRadius: BorderRadius.circular(10)
              )
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 100,
              child: ElevatedButton(
                onPressed: () {
                  if(FormKey.currentState!.validate())
                  {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>CataLogScreen()));
                  }
                },
                child: Text("Login",style: Theme.of(context).textTheme.titleMedium,),
              )
            )
        ],
      ),
    ));
  }
}
