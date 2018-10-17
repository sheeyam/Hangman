//
//  DoublePlayerViewController.m
//  Hangman
//
//  Created by Atlink on 9/13/18.
//  Copyright © 2018 UHCL. All rights reserved.
//

#import "DoublePlayerViewController.h"
#import "GameViewController.h"

@interface DoublePlayerViewController ()
@property (weak, nonatomic) IBOutlet UIButton *menuBtn;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UITextField *guessWordTextField;

@end

@implementation DoublePlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    [_guessWordTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToMenu:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)goToGame:(id)sender {
    [self performSegueWithIdentifier:@"doubleplayer2game" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue is to GameVC
    if ([[segue identifier] isEqualToString:@"doubleplayer2game"])
    {
        // Get reference to GameVC
        GameViewController *gameVC = [segue destinationViewController];
        
        // Pass guess word to GameVC
        gameVC.guessWord = _guessWordTextField.text;
    }
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
