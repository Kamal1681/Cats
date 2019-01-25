//
//  PhotoData.m
//  Cats
//
//  Created by Kamal Maged on 2019-01-24.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

#import "PhotoData.h"

@implementation PhotoData

+ (PhotoData *)fromJsonDictionary:(NSMutableDictionary *)dictionary {
    NSLog (@"%@", dictionary);
    PhotoData *photoData = [[PhotoData alloc] init];
    photoData.identification = [dictionary[@"id"]integerValue];
    photoData.owner = dictionary[@"owner"];
    photoData.secret = dictionary[@"secret"];
    photoData.server = [dictionary[@"server"]integerValue];
    photoData.title = dictionary[@"title"];
    photoData.farm = [dictionary[@"farm"]integerValue];

    NSString * imageAddress = [[[[[[[[@"https://farm" stringByAppendingString:[NSString stringWithFormat:@"%li", (long)photoData.farm]]stringByAppendingString:@".staticflickr.com/"]stringByAppendingString:[NSString stringWithFormat:@"%li", (long)photoData.server]]stringByAppendingString:@"/"]stringByAppendingString:[NSString stringWithFormat:@"%li", (long)photoData.identification]]stringByAppendingString:@"_"]stringByAppendingString:photoData.secret]stringByAppendingString:@".jpg"];

   
    NSURL *imageUrl = [NSURL URLWithString:imageAddress];
    photoData.photoURL = imageUrl;
    //   Blocks processing on the thread this runs on (VERY SLOW)
    //  NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    //  rep.image = [UIImage imageWithData:imageData];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:imageUrl];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            UIImage *image = [UIImage imageWithData:data];
            photoData.catImage = image;
        }];
    }];
    [task resume];

    return photoData;
}
@end
