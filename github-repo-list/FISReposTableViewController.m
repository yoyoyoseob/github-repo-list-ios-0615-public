//
//  FISReposTableViewController.m
//  
//
//  Created by Joe Burgess on 5/5/14.
//
//

#import "FISReposTableViewController.h"
#import "FISReposDataStore.h"

@interface FISReposTableViewController ()

@property (nonatomic, strong) NSArray *repositories;
@property (nonatomic, strong) FISReposDataStore *dataStore;

@end

@implementation FISReposTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.accessibilityIdentifier = @"Repo Table View";
    self.tableView.accessibilityLabel=@"Repo Table View";

    self.dataStore = [FISReposDataStore sharedDataStore];
    
    [self.dataStore parseAllReposWithCompletion:^(NSArray* reposArray) {
        self.repositories = reposArray;
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
    }];
    
    
//    [[FISReposDataStore sharedDataStore] fetchRepositoriesWithCompletion:^(BOOL success) {
//        //self.repositories = [NSArray arrayWithArray:[FISReposDataStore sharedDataStore].repositories];
//        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
//
//        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
//            [self.tableView reloadData];
//        }];
//    }];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [FISReposDataStore sharedDataStore].repositories.count;
//    return self.dataStore.repositories.count;
    return [self.repositories count];
    // Return the number of rows in the section.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    FISGithubRepository *repo = self.repositories[indexPath.row];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@", repo.fullName];
//    NSLog(@"Title: %@ row: %lu", repo.fullName, indexPath.row);
    
    cell.textLabel.text = repo.fullName;
    
    return cell;
}

@end
