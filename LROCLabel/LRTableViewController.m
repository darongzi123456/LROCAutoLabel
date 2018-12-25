//
//  LRTableViewController.m
//  LROCLabel
//
//  Created by dalizi on 2018/12/24.
//  Copyright © 2018年 dalizi. All rights reserved.
//

#import "LRTableViewController.h"
#import "LRTableModel.h"
#import "LRTableViewCell.h"

@interface LRTableViewController ()
@property (nonatomic,strong) NSMutableArray *cellInfoArray;
@end

@implementation LRTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTableView];
    [self configTableData];
}

- (void)configTableView {
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 120;
    [self.tableView registerClass:[LRTableViewCell class] forCellReuseIdentifier:[LRTableViewCell cellIdentifier]];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
}

- (void)configTableData {
    self.cellInfoArray = ({
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
        array;
    });
    LRTableModel *model = [LRTableModel new];
    model.title = @"在没风的地方找太阳 \n 在你冷的地方做暖阳 \n 人事纷纷 \n 你总太天真 \n 往后的余生 \n 我只要你 \n 往后余生 \n 风雪是你 \n 平淡是你 \n 清贫也是你 \n 荣华是你 \n 心底温柔是你 \n 目光所致也是你 \n 想带你去看晴空万里 \n 想大声告诉你我为你着迷 \n 往事匆匆 \n 你总会被感动 \n 往后的余生 \n 我只要你 \n 往后余生 \n 冬雪是你 \n 春花是你 \n 夏雨也是你 \n 秋黄是你 \n 四季冷暖是你 \n 目光所致 \n 也是你 \n 往后余生 \n 风雪是你 \n 平淡是你 \n 清贫也是你 \n 荣华是你 \n 心底温柔是你 \n 目光所致 \n 也是你 \n 目光所致 \n 也是你";
    model.buttonType = LRTableViewButtonTypeNone;
    [self.cellInfoArray addObject:model];
    
    model = [LRTableModel new];
    model.title = @"我有一个梦像雨后彩虹 \n 用所有泪水换来笑容 \n 还有一种爱穿越了人海 \n 拾起那颗迷失的尘埃 \n 你的呼吸越靠越近 \n 将我抱紧 \n 我睁开双眼想你在身边 \n 无所谓永远还是瞬间 \n 静闭上了眼你却又浮现 \n 带我远离寂寞的边缘 \n 忘了是非没有伤悲 \n 无怨无悔 \n 我拥抱着爱当从梦中醒来 \n 你执着地等待却不曾离开 \n 舍不得分开在每一次醒来 \n 不用再徘徊你就是我最美的期待 \n 我睁开双眼想你在身边 \n 无所谓永远还是瞬间 \n 静闭上了眼你却又浮现 \n 带我远离寂寞的边缘 \n 忘了是非没有伤悲 \n 无怨无悔 \n 我拥抱着爱当从梦中醒来 \n 你执着地等待却不曾离开 \n 舍不得分开在每一次醒来 \n 不用再徘徊你就是我最美的期待 \n 我拥抱着爱当从梦中醒来 \n 你执着地等待却不曾离开 \n 舍不得分开在每一次醒来 \n 不用再徘徊你就是我最美的期待";
    model.buttonType = LRTableViewButtonTypeNone;
    [self.cellInfoArray addObject:model];
    
    model = [LRTableModel new];
    model.title = @"我说道：“爸爸，你走吧。”他望车外看了看，说：“我买几个橘子去。你就在此地，不要走动。”我看那边月台的栅栏外有几个卖东西的等着顾客。走到那边月台，须穿过铁道，须跳下去又爬上去。父亲是一个胖子，走过去自然要费事些。我本来要去的，他不肯，只好让他去。我看见他戴着黑布小帽，穿着黑布大马褂12，深青布棉袍，蹒跚13地走到铁道边，慢慢探身下去，尚不大难。可是他穿过铁道，要爬上那边月台，就不容易了。他用两手攀着上面，两脚再向上缩；他肥胖的身子向左微倾，显出努力的样子。这时我看见他的背影，我的泪很快地流下来了。我赶紧拭干了泪。怕他看见，也怕别人看见。我再向外看时，他已抱了朱红的橘子往回走了。过铁道时，他先将橘子散放在地上，自己慢慢爬下，再抱起橘子走。到这边时，我赶紧去搀他。他和我走到车上，将橘子一股脑儿放在我的皮大衣上。于是扑扑衣上的泥土，心里很轻松似的。过一会儿说：“我走了，到那边来信！”我望着他走出去。他走了几步，回过头看见我，说：“进去吧，里边没人。”等他的背影混入来来往往的人里，再找不着了，我便进来坐下，我的眼泪又来了";
    model.buttonType = LRTableViewButtonTypeNone;
    [self.cellInfoArray addObject:model];
    
    model = [LRTableModel new];
    model.title = @"深蓝的天空中挂着一轮金黄的圆月，下面是海边的沙地，都种着一望无际的碧绿的西瓜。其间有一个十一二岁的少年，项带银圈，手捏一柄钢叉，向一匹猹尽力地刺去。那猹却将身一扭，反从他的胯下逃走了。 这少年便是闰土。我认识他时，也不过十多岁，离现在将有三十年了；那时我的父亲还在世，家景也好，我正是一个少爷。那一年，我家是一件大祭祀的值年。这祭祀，说是三十多年才能轮到一回，所以很郑重。正（zhēng）月里供像，供品很多，祭器很讲究，拜的人也很多，祭器也很要防偷去。我家只有一个忙月（我们这里给人做工的分三种：整年给一定人家做工的叫长工；按日给人做工的叫短工；自己也种地，只在过年过节以及收租时候来给一定的人家做工的称忙月），忙不过来，他便对父亲说，可以叫他的儿子闰土来管祭器的。";
    model.buttonType = LRTableViewButtonTypeNone;
    [self.cellInfoArray addObject:model];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LRTableViewCell cellIdentifier] forIndexPath:indexPath];
    if (self.cellInfoArray != nil &&
        [self.cellInfoArray isKindOfClass:[NSArray class]] &&
        self.cellInfoArray.count > indexPath.row) {
        LRTableModel *model = [self.cellInfoArray objectAtIndex:indexPath.row];
        [cell reloadCell:model];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellInfoArray != nil &&
        [self.cellInfoArray isKindOfClass:[NSArray class]] &&
        self.cellInfoArray.count > indexPath.row) {
        LRTableModel *model = [self.cellInfoArray objectAtIndex:indexPath.row];
        if (model.buttonType == LRTableViewButtonTypeButtonExpand) {
            model.buttonType = LRTableViewButtonTypeButtonCollapse;
        } else if (model.buttonType == LRTableViewButtonTypeButtonCollapse) {
            model.buttonType = LRTableViewButtonTypeButtonExpand;
        }
        [self.cellInfoArray replaceObjectAtIndex:indexPath.row withObject:model];
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    NSLog(@"LRTableViewController dealloc");
}

@end
