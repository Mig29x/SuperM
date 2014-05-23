//
//  ViewController.m
//  Supermercado
//
//  Created by Francisco on 5/16/14.
//  Copyright (c) 2014 Francisco Oliva. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    
    NSDictionary *productDetails;
    NSArray *justProductNames;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Productos a Comprar";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
 (NSInteger)section{
    return productDetails.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)
 indexPath{
    
    // create cell
    //UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefaultreuseIdentifier:@"cell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    // fill cell
    cell.textLabel.text = justProductNames[indexPath.row];
    cell.detailTextLabel.text = productDetails[justProductNames[indexPath.row]];
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"products"
                                         withExtension:@"plist"];
    
    // load the plist into the dictionary
    productDetails = [NSDictionary dictionaryWithContentsOfURL:url];
    // create an array with just the keys
    justProductNames = productDetails.allKeys;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
