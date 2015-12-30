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
@property(nonatomic,strong)UILabel *lable;


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
        make.left.top.equalTo(self).offset(10);
        make.width.height.equalTo(@40);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    self.descLabel = label;
    [self addSubview:label];
    [label sizeToFit];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:14];

    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(imageView).offset(10);
        make.top.equalTo(imageView);
        
    }];
    
    
}

-(void)setDrugModel:(DrugListModel *)drugModel{
    _drugModel = drugModel;
    self.descLabel.text = drugModel.factory;
    self.imgView.image = [UIImage imageNamed:@"Animation-10"];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
