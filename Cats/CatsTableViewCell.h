//
//  CatsTableViewCell.h
//  Cats
//
//  Created by Kamal Maged on 2019-01-24.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoData.h"
NS_ASSUME_NONNULL_BEGIN

@interface CatsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) PhotoData * catPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *catImage;
@end

NS_ASSUME_NONNULL_END
