//
//  PhotoData.h
//  Cats
//
//  Created by Kamal Maged on 2019-01-24.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface PhotoData : NSObject
@property (nonatomic) NSInteger identification;
@property (nonatomic) NSString * owner;
@property (nonatomic) NSString * secret;
@property (nonatomic) NSInteger server;
@property (nonatomic) NSString * title;
@property (nonatomic) NSInteger farm;
@property (nonatomic) UIImage * catImage;
@property (strong, nonatomic) NSURL * photoURL;

+ (PhotoData *)fromJsonDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
