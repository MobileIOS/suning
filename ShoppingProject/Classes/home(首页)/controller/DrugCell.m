//
//  DrugCell.m
//  ShoppingProject
//
//  Created by maoqian on 15/12/30.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "DrugCell.h"
#import "DrugListModel.h"
@interface DrugCell ()

@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UILabel *descLabel;
@property(nonatomic,strong)UILabel *mlable;


@end

@implementation DrugCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}


-(void)setup{
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [self addSubview:imageView];
    self.imgView = imageView;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.equalTo(self).offset(10);
        make.width.height.equalTo(@40);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    self.descLabel = label;
    [self addSubview:label];
    [label sizeToFit];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:14];

    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(10);
        make.top.equalTo(imageView.mas_top);
        
    }];
    
    UILabel *mlabel = [[UILabel alloc]init];
    self.mlable = mlabel;
    [self addSubview:mlabel];
    [mlabel sizeToFit];
    mlabel.textAlignment = NSTextAlignmentLeft;
    mlabel.font = [UIFont systemFontOfSize:12];
    

    
    [mlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.descLabel.mas_leading);
        make.top.equalTo(self.descLabel.mas_bottom).offset(10);
        
    }];
    
    
}

-(void)setDrugModel:(DrugListModel *)drugModel{
    _drugModel = drugModel;
    
    self.descLabel.text = drugModel.factory;
    if (!self.descLabel.text) {
        self.descLabel.text = @"暂无数据";
    }
    self.imgView.image = [UIImage imageNamed:@"Animation-10"];
    self.mlable.text = drugModel.pizhun;
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

-(CGFloat)getCellHeight{
    return 100;
    
}

@end
