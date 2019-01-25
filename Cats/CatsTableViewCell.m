//
//  CatsTableViewCell.m
//  Cats
//
//  Created by Kamal Maged on 2019-01-24.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

#import "CatsTableViewCell.h"

@implementation CatsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self addObserver:self forKeyPath:@"self.catPhoto.catImage" options:(NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew) context:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"self.catPhoto.catImage"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"self.catPhoto.catImage"]) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.catImage.image = self.catPhoto.catImage;;
        }];
    }
}

- (void)setCatPhoto:(PhotoData *)catPhoto {
    _catPhoto = catPhoto;
    self.title.text = catPhoto.title;
    self.title.textColor = [UIColor yellowColor];
    self.catImage.image = catPhoto.catImage;
}
@end
