import 'package:flutter/material.dart';
import 'package:myflutterdemo/ui/pages/wxl/model/menu_model.dart';

/// 菜单cell
class MenuQuickItem extends StatefulWidget {
  final List _items;
  MenuQuickItem(this._items);
  @override
  State<MenuQuickItem> createState() => _MenuQuickItemState(_items);
}

class _MenuQuickItemState extends State<MenuQuickItem> {
  // 数据
  final List _items;
  // 每页的个数
  final int _countPerPage = 10;
  // 总页数
  int _pageCount = 0;
  // 当前页码
  int _currentPage = 0;
  // 总item
  final List<Widget> _children = [];
  // 控制器
  PageController? _controller;

  _MenuQuickItemState(this._items);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化数据
    _controller = PageController(initialPage: 5000);
    _pageCount = (_items.length / _countPerPage).ceil();
    // 创建所有的item
    for (MenuModel item in _items) {
      _children.add(_buldItemwidget(item));
    }
  }

  @override
  void dispose() {
    //释放资源
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_pageViewWidget(), _buildCursorWidget()],
    );
  }

  // 翻页 无限滚动
  Widget _pageViewWidget() {
    List<Widget> pageList = [];
    int index = 0;
    int realIndex;
    for (int i = 0; i < _pageCount; i++) {
      realIndex = index + _countPerPage > _children.length
          ? _children.length
          : index + _countPerPage;
      List<Widget> l = _children.sublist(index, realIndex);
      index = realIndex;
      pageList.add(_buildGridWidget(l));
    }
    return Container(
      height: 170,
      color: Colors.white,
      child: PageView.builder(
          controller: _controller,
          itemCount: 10000,
          onPageChanged: (page) {
            _currentPage = page % (pageList.length);
            setState(() {});
          },
          itemBuilder: (ctx, row) {
            return pageList[row % (pageList.length)];
          }),
    );
  }

  // 单个item
  Widget _buldItemwidget(MenuModel item) {
    return Column(
      children: [
        Image.network(item.unSelectIcon!, width: 42),
        const SizedBox(height: 6),
        Text(item.name!, style: const TextStyle(fontWeight: FontWeight.w500))
      ],
    );
  }

  // 单个网格
  Widget _buildGridWidget(List<Widget> rows) {
    return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        crossAxisCount: 5,
        children: rows,
        // 上下间距
        mainAxisSpacing: 10,
        // 左右间距
        crossAxisSpacing: 0,
        childAspectRatio: 1.0);
  }

  // 页码
  Widget _buildCursorWidget() {
    List<Widget> list = [];
    for (int i = 0; i < _pageCount; i++) {
      list.add(_buildPoint(_currentPage == i));
    }
    return Container(
      color: Colors.white,
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          Row(children: list, mainAxisSize: MainAxisSize.min),
          Container(height: 20, color: Colors.white)
        ],
      ),
    );
  }

  // 单个点
  Widget _buildPoint(bool focus) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        width: focus ? 14 : 6,
        height: 6,
        decoration: BoxDecoration(
            color: focus ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(3))),
      ),
    );
  }
}
