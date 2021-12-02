import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart' show AsyncMemoizer;

main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue),
      home: Scaffold(
          body: IndexedStack(
            index: 0,
            children: [
              HomePage(),
              HomePage(),
              HomePage(),
              HomePage(),
              HomePage()
            ],
          ),
          bottomNavigationBar: Container(
              child: BottomNavigationBar(
                  currentIndex: 0,
                  selectedFontSize: 14,
                  unselectedFontSize: 14,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                        label: '首页', icon: Icon(Icons.home)),
                    BottomNavigationBarItem(
                        label: '邱齐林', icon: Icon(Icons.print)),
                    BottomNavigationBarItem(
                        label:' ',
                        icon: Container(
                          width: 20,
                          height: 20,
                          child: OverflowBox(
                            maxHeight: 80,
                            maxWidth: 80,
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    child: Center(child: Image.asset('assets/images/home_menu_bg.png'))
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/images/home_menu_juheye.png',width: 50,height: 50,),
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                    BottomNavigationBarItem(
                        label: '王小腊', icon: Icon(Icons.people)),
                    BottomNavigationBarItem(label: '我的', icon: Icon(Icons.mail))
                  ],
                  onTap: (index) {
                    print(index);
                  }))),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///定义异步寄存器
  final AsyncMemoizer _memoization = AsyncMemoizer<String>();

  ///模拟耗时的网络请求
  Future<String> loadingDataFunction() async {
    ///模拟
    await Future.delayed(Duration(milliseconds: 4000));
    return Future.value("加载成功");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("异步加载数据"),
        ),
        body: ListView(
          children: [
            // FutureBuilder<String>(
            //   //future：这个参数需要一个Future 对象，类似于 网络请求、IO
            //   future: _memoization.runOnce(loadingDataFunction),
            //
            //   ///这里的数据格式与上述FutureBuilder设置的泛型格式一至
            //   initialData: "初始化的数据",
            //
            //   ///构建显示的 Widget  会根据加载的状态来多次回调些方法
            //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            //     print('000');
            //     //加载状态判断
            //     switch (snapshot.connectionState) {
            //
            //     ///可理解为初始加载显示的 Widget 异步加载开始时的回调
            //       case ConnectionState.none:
            //         print('111');
            //         return Text('Result: ${snapshot.data}');
            //
            //     ///异步加载中的回调
            //       case ConnectionState.active:
            //       case ConnectionState.waiting:
            //         print('222');
            //         return Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [CircularProgressIndicator()],
            //         );
            //
            //     ///异步加载完成的回调
            //       case ConnectionState.done:
            //         print('333');
            //         //判断是否加载失败
            //         if (snapshot.hasError) {
            //           return Text('Error: ${snapshot.error}');
            //         } else {
            //           ///通过 [snapshot.data]来获取异步加载的数据
            //           return Text('Result: ${snapshot.data}');
            //         }
            //     }
            //     return null;
            //   },
            // ),
            Container(height: 300, color: Colors.red),
            Container(height: 300, color: Colors.orange),
            Container(height: 300, color: Colors.indigo),
            Container(height: 300, color: Colors.deepPurple),
            Container(height: 300, color: Colors.yellow),
            Container(height: 300, color: Colors.blue),
            Container(height: 300, color: Colors.grey),
            Container(height: 300, color: Colors.deepOrangeAccent)
          ],
        ));
  }
}
