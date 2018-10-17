//
//  SinglePlayerTableViewController.m
//  Hangman
//
//  Created by Atlink on 9/27/18.
//  Copyright © 2018 UHCL. All rights reserved.
//

#import "SinglePlayerTableViewController.h"
#import "GuessWordDML.h"
#import "GameViewController.h"
#import "MyCustomCell.h"

@interface SinglePlayerTableViewController ()

@end

@implementation SinglePlayerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _dataArray = [[NSMutableArray alloc] initWithObjects:@"Easy", @"Medium", @"Difficult", nil];
    _dataModeArray = [[NSMutableArray alloc] initWithObjects:@"Tap here to pick an Easy Word from the DB", @"Tap here to pick a Medium Word from the DB", @"Tap here to pick a Difficult Word from the DB", nil];
    
    [self loadWordsIntoDatabase];

}

- (IBAction)menuBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadWordsIntoDatabase
{
    if ([GuessWordDML fetchWordFromCategory:@"Easy"] == nil)
    {
        NSString *easyPath = [[NSBundle mainBundle] pathForResource:@"Easy" ofType:@"plist"];
        NSMutableArray *easyArray = [[NSMutableArray alloc] initWithContentsOfFile:easyPath];
        for (int i=0; i<easyArray.count; i++)
        {
            NSString* curWord = (NSString *)[easyArray objectAtIndex:i];
            [GuessWordDML addWordWithWord:curWord category:@"Easy"];
        }
        NSString *mediumPath = [[NSBundle mainBundle] pathForResource:@"Medium" ofType:@"plist"];
        NSMutableArray *mediumArray = [[NSMutableArray alloc] initWithContentsOfFile:mediumPath];
        
        for (int i=0; i<mediumArray.count; i++)
        {
            NSString* curWord = (NSString *)[mediumArray objectAtIndex:i];
            [GuessWordDML addWordWithWord:curWord category:@"Medium"];
        }
        NSString *difficultPath = [[NSBundle mainBundle] pathForResource:@"Hard" ofType:@"plist"];
        NSMutableArray *difficultArray = [[NSMutableArray alloc] initWithContentsOfFile:difficultPath];
        for (int i=0; i<difficultArray.count; i++)
        {
            NSString* curWord = (NSString *)[difficultArray objectAtIndex:i];
            [GuessWordDML addWordWithWord:curWord category:@"Difficult"];
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCustomCell" forIndexPath:indexPath];
    // cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    cell.modeLbl.text = [_dataArray objectAtIndex:indexPath.row];
    cell.modeDescLbl.text = [_dataModeArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* selectedCategory = [_dataArray objectAtIndex:indexPath.row];
    _guessWord = [GuessWordDML fetchWordFromCategory:selectedCategory ];
    [GuessWordDML deleteWord:_guessWord];
    [self performSegueWithIdentifier:@"SinglePlayer2GameVC" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue is to GameVC
    if ([[segue identifier] isEqualToString:@"SinglePlayer2GameVC"])
    {
        // Get reference to GameVC
        GameViewController *gameVC = [segue destinationViewController];
        
        // Pass guess word to GameVC
        gameVC.guessWord = _guessWord;
    }
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
