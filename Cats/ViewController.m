//
//  ViewController.m
//  Cats
//
//  Created by Kamal Maged on 2019-01-24.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

#import "ViewController.h"
#import "CatsTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView * tableView;
@property (nonatomic) NSArray * cats;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
}
- (void) viewDidAppear:(BOOL)animated {
    
    NSURL * url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=8a882768e09280d6ef2ad3f5793392b1&tags=cat"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionTask * task = [[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *photos = json[@"photos"][@"photo"];
        NSMutableArray *catsPhotos = [NSMutableArray new];
        for (NSDictionary *catDict in photos) {
            PhotoData *photoData = [PhotoData fromJsonDictionary:catDict];
            [catsPhotos addObject:photoData];
        }
        self.cats = catsPhotos;
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
    }];
    [task resume];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cats.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CatsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"catPhoto" forIndexPath:indexPath];
    
    cell.catPhoto = self.cats[indexPath.row];
    
    return cell;
}
@end
