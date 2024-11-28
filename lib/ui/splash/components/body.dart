import 'package:flutter/material.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/ui/splash/components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  // untuk view pager ada di cataloge screen
  PageController _pageController = PageController();

  // ini dasar ambil data dari API
  // karena pake format key value
  List<Map<String, String>> splashData = [ 
    {
      "text": "Find luxury fragrances from iconic and \nexclusive brands, find your signature.",
      "image": "assets/images/img_onboarding_1.png"
    },
    {
      "text": "Experience refined perfumes, from timeless \nclassics to unique blends.",
      "image": "assets/images/img_onboarding_2.png"
    },
    {
      "text": "Shop with ease and get premium perfumes \ndelivered to your door.",
      "image": "assets/images/img_onboarding_3.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3, //memenuhi 3 ruang yg kosong
              child: SizedBox(
                  width: double.infinity, // agar tengah mengikuti titik kordinat
                  child: PageView.builder( // pageview untuk handle swipe activity
                    // ngecontroll untuk ganti page
                    controller: _pageController = PageController(),
                    onPageChanged: (value) {
                      //awal state method untuk statefulWidget behavior
                      setState(() {
                        currentPage = value;
                      });
                    },
                      itemCount: splashData.length, // memberikan batasan swipe. length utk devinisiin panjang array
                      // item builder utk jumbatan, adapter antar data/pembuat data
                      itemBuilder: (context, index) => SplashContent(
                          text: splashData[index]["text"]!, // !  untuk menghilangkan null safety
                          image: splashData[index]["image"]!
                          )
                        )
                      ),
                   ),
            // flexible dan responsive dan memanfaatkan roang kosong yg ada
            Expanded(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,// biar ke tengah
                children: List.generate( // buat ngehasilin dot dgn panjang splash data
                  splashData.length,
                (index) => _dotsIndicator(index: index)) // mulai dari 0 dan buat method exraction
              )
            ),
            Padding(
              padding: const EdgeInsets.all(10.0), // padding 10
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton( // btn yg paling cocok dan bisa styling dari awal
                  style: ElevatedButton.styleFrom( // buat ngasih style nya, makannya di panggil 2x
                    backgroundColor: primaryColor, 
                  ),
                  onPressed: () {
                    //ketika current page di klik maka akan ke pindah screen
                    if (currentPage == splashData.length - 1) { // -1 karena index 0
                      Navigator.pushReplacementNamed( // code untuk pindah halaman
                        // represent dari currentPage
                        context, '/login');
                    } else {
                      // ini  untuk swipe ke slide berikutnya
                      _pageController.animateToPage( // kalo belum sampai akhir bakal nambah ke halaman berikutnya pakai animateToPage
                        currentPage + 1,
                        duration: animationDuration,
                        curve: Curves.ease);
                    }
                  }, 
                  // ini untuk  text button
                  child: Text(
                    currentPage == splashData.length - 1 ? "Start" : "Next",
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // code untuk logic dots indikator/ yg bulet bulet.
  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index ? primaryColor : secondaryColor, // kalau curentPage maka warna primaryColor
      ),
      width: currentPage == index ? 20 : 10, // kalau di currentPage width nya 20, kalau tidak 10
      height: 10, duration: animationDuration,
    );
  }
}