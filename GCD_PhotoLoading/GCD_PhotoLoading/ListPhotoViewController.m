//
//  ListPhotoViewController.m
//  GCD_PhotoLoading
//
//  Created by Linh Nguyen on 6/3/15.
//  Copyright (c) 2015 Linh Nguyen. All rights reserved.
//

#import "ListPhotoViewController.h"
#define kDatasourceURLString @"http://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist"
@interface ListPhotoViewController ()

@end

@implementation ListPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //[self getPhotos];
    //_photosArray = [self getArrayFromDict:_photosDict];
    
    //NSLog(@"%@",_photosArray);
}
-(void)viewWillAppear:(BOOL)animated{
    //[self getPhotos];
    
//    _photosArray = [self getArrayFromDict:_photosDict];
    [self loadDataWithOperation];
    //[self loadDataFromServer];
    //[self loadDataWithCGD];
}


-(NSArray *)getArrayFromDict:(NSDictionary *)photosDict{
    NSMutableArray *photosArray = [[NSMutableArray alloc] init];
    NSArray *keys = [photosDict allKeys];
    for (NSString *key in keys) {
        NSString *value = [photosDict objectForKey:key];
        [photosArray addObject:value];
    }
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
//    dispatch_async(queue, ^void{
//        for (NSString *key in keys) {
//            NSString *value = [photosDict objectForKey:key];
//            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:value]];
//            UIImage *imageCell = [UIImage imageWithData:imageData];
//            if (imageCell) {
//                
//                [photosArray addObject:imageCell];
//            }
//        }
//        //[self.tableView reloadData];
//    });
    
    
    
    
    return photosArray;
}
-(NSArray *)getArrayImageFromDict:(NSDictionary *)photosDict{
    NSMutableArray *photosArray = [[NSMutableArray alloc] init];
    NSArray *keys = [photosDict allKeys];
    for (NSString *key in keys) {
        NSString *value = [photosDict objectForKey:key];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:value]];
        UIImage *imageCell = [UIImage imageWithData:imageData];
        if (imageCell) {
            
            [photosArray addObject:imageCell];
        }
    }
    
//        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
//        dispatch_async(queue, ^void{
//            for (NSString *key in keys) {
//                NSString *value = [photosDict objectForKey:key];
//                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:value]];
//                UIImage *imageCell = [UIImage imageWithData:imageData];
//                if (imageCell) {
//    
//                    [photosArray addObject:imageCell];
//                }
//            }
//            //[self.tableView reloadData];
//        });
//    
    
    
    
    return photosArray;

}
-(void)loadDataFromServer{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadDataWithOperation) object:nil];
    
    [queue addOperation:operation];
}
-(void)loadDataWithCGD{
    [self getPhotos];
    _photosArray = [[NSMutableArray alloc] init];
    NSArray *keys = [_photosDict allKeys];
    //dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_queue_t queue = dispatch_queue_create("dispatch", DISPATCH_QUEUE_PRIORITY_DEFAULT);
            dispatch_async(queue, ^void{
                for (NSString *key in keys) {
                    NSString *value = [_photosDict objectForKey:key];
                    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:value]];
                    UIImage *imageCell = [UIImage imageWithData:imageData];
                    
                    if (imageCell) {
                    dispatch_async(dispatch_get_main_queue(),^{
                        [_photosArray addObject:imageCell];
                        [self.tableView reloadData];
                        });
                    }
                    
                    //[self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
                                   
                }
                //[self.tableView reloadData];
            });

}
-(void)loadDataWithOperation{
    [self getPhotos];
    _photosArray = [[NSMutableArray alloc] init];
    
    NSArray *keys = [_photosDict allKeys];
    for (NSString *key in keys) {
        NSString *value = [_photosDict objectForKey:key];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:value]];
        UIImage *imageCell = [UIImage imageWithData:imageData];
        if (imageCell) {
            
            [_photosArray addObject:imageCell];
        }
        //[self.tableView reloadData];
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    }
    
    //[self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    
}
-(void)getPhotos{
    if(!_photosDict){
        NSURL *dataSourceUrl  = [NSURL URLWithString:kDatasourceURLString];
        _photosDict = [[NSDictionary alloc] initWithContentsOfURL:dataSourceUrl];
    }
    //return _photos;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _photosArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdenfifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdenfifier forIndexPath:indexPath];
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // Configure the cell...
//    if (_photos) {
//        
//    }
    //cell.tag = indexPath.row;
    if (_photosArray) {
        cell.imageView.image = [_photosArray objectAtIndex:indexPath.row];

//        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
//        dispatch_async(queue, ^void{
//            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:_photosArray[indexPath.row]]];
//            UIImage *imageCell = [UIImage imageWithData:imageData];
//            
//            if (imageCell) {
//                dispatch_async(dispatch_get_main_queue(),^{
//                    
//                    
//                    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
//                    if (imageView != nil) {
//                        imageView.image = imageCell;
//                    }
//                    
//                    
//                });
//            }
//        });
    }
   
    //cell.textLabel.text = @"Hello World";
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
