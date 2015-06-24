# WKTabBarRoundItemDemo
####中间Item为圆形的TabBar：用最小的改变来实现将TabBar的中间的item改为圆形。无代理方法，用法和原来一样，只是稍加几行代码。demo里用的是storyboard。
####用法为：在自定义的TabBarController的viewDidload里加以下代码
>  WKTabBar *tabBar = [[WKTabBar alloc] init];

>  tabBar.image = [UIImage imageNamed:@"图片名"];

>  tabBar.itemCount = 5;//可以设置为3

>  tabBar.controller = self;

>  [self setValue:tabBar forKeyPath:@"tabBar"];
