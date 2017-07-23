//
//  MainTableViewController.m
//  AnimationDemo
//
//  Created by 邓志坚 on 2017/7/14.
//  Copyright © 2017年 dzj. All rights reserved.
//

#import "MainTableViewController.h"

#import "ZJViewAnimationController.h"
#import "ZJPositionViewController.h"
#import "ZJOpacityViewController.h"
#import "ZJScaleViewController.h"




@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"AnimationDemo";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"123");
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                ZJViewAnimationController *position = [[ZJViewAnimationController alloc]init];
                [self.navigationController pushViewController:position animated:YES];
            }
            default:
                break;
        }
        
    }else if (indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
            {
                ZJPositionViewController *position = [[ZJPositionViewController alloc]init];
                [self.navigationController pushViewController:position animated:YES];

            }
                break;
            case 1:
            {
                ZJOpacityViewController *opacity = [[ZJOpacityViewController alloc]init];
                [self.navigationController pushViewController:opacity animated:YES];
                
            }
                break;
            case 2:
            {
                ZJScaleViewController *scale = [[ZJScaleViewController alloc]init];
                [self.navigationController pushViewController:scale animated:YES];
                
            }
                
                break;
            case 3:
                
                break;
            case 4:
                
                break;
            case 5:
                
                break;
            case 6:
                
                break;
                
            default:
                break;
        }
    }
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
