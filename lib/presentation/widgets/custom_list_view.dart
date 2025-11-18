import 'package:flutter/material.dart';

class CustomListView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item, int index) itemBuilder;
  final EdgeInsets padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final bool isLoading;
  final Widget? emptyWidget;
  final Widget? separatorBuilder;
  final VoidCallback? onRefresh;
  final ScrollController? controller;
  final bool showDividers;

  const CustomListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.padding = const EdgeInsets.all(16),
    this.shrinkWrap = false,
    this.physics,
    this.isLoading = false,
    this.emptyWidget,
    this.separatorBuilder,
    this.onRefresh,
    this.controller,
    this.showDividers = true,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildLoadingList();
    }

    if (items.isEmpty) {
      return emptyWidget ?? _buildEmptyState();
    }

    final listView = ListView.separated(
      controller: controller,
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: items.length,
      separatorBuilder: (context, index) {
        if (separatorBuilder != null) {
          return separatorBuilder!;
        }
        
        if (showDividers) {
          return Divider(
            height: 1,
            thickness: 0.5,
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF38383A)
                : const Color(0xFFE5E5EA),
          );
        }
        
        return const SizedBox(height: 8);
      },
      itemBuilder: (context, index) {
        return _ListItemWrapper(
          child: itemBuilder(items[index], index),
        );
      },
    );

    if (onRefresh != null) {
      return RefreshIndicator(
        onRefresh: () async {
          onRefresh!();
        },
        color: const Color(0xFF007AFF),
        child: listView,
      );
    }

    return listView;
  }

  Widget _buildLoadingList() {
    return ListView.separated(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return _ListItemWrapper(
          child: _SkeletonListItem(),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.list_alt_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No hay elementos para mostrar',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            if (onRefresh != null) ...[
              const SizedBox(height: 16),
              TextButton(
                onPressed: onRefresh,
                child: const Text(
                  'Reintentar',
                  style: TextStyle(
                    color: Color(0xFF007AFF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ListItemWrapper extends StatelessWidget {
  final Widget child;

  const _ListItemWrapper({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class _SkeletonListItem extends StatefulWidget {
  @override
  State<_SkeletonListItem> createState() => _SkeletonListItemState();
}

class _SkeletonListItemState extends State<_SkeletonListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: isDark 
                ? Colors.grey[800]!.withOpacity(_animation.value)
                : Colors.grey[300]!.withOpacity(_animation.value),
            borderRadius: BorderRadius.circular(8),
          ),
        );
      },
    );
  }
}