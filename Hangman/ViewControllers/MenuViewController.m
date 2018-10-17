//
//  MenuViewController.m
//  Hangman
//
//  Created by Atlink on 9/13/18.
//  Copyright © 2018 UHCL. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UIButton *singlePlayerBtn;
@property (weak, nonatomic) IBOutlet UIButton *doublePlayerBtn;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSinglePlayerView:(id)sender {
    [self performSegueWithIdentifier:@"Menu2SinglePlayer" sender:self];
}

- (IBAction)showDoublePlayerView:(id)sender {
    [self performSegueWithIdentifier:@"menu2doubleplayer" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
