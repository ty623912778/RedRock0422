//
//  TYTableViewController.m
//  0418
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TYTableViewController.h"
#import "TYContact.h"
#import "TYContactGroup.h"
#define kContactToolbarHeight 44
#define kSearchbarHeight 44



@interface TYTableViewController ()<UIAlertViewDelegate,UISearchBarDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_contacts;
    UISearchBar *_searchBar;
    NSMutableArray *_searchContacts;
    UIToolbar *_toolbar;
    BOOL _isInsert;
    BOOL _isSearching;
    NSIndexPath *_selectedIndexPath;
}

@end

@implementation TYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];//原来是少了这句数据出不来 T T
    
    [self addSearchBar];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.contentInset = UIEdgeInsetsMake(kContactToolbarHeight, 0, 0, 0);
    [self.view addSubview:_tableView];
    
    [self addToolbar];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
}

- (void)initData{
    _contacts = [[NSMutableArray alloc]init];
    
    TYContact *contact1 = [TYContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18500131234"];
    
    TYContact *contact2 = [TYContact initWithFirstName:@"Cui" andLastName:@"Tim" andPhoneNumber:@"18500131237"];
   
    TYContactGroup *group1 = [TYContactGroup initWithName:@"C" andDetail:@"With names beginning with C" andContacts:[NSMutableArray arrayWithObjects:contact1,contact2, nil]];
   
    [_contacts addObject:group1];
    
    
    
    TYContact *contact3 = [TYContact initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
    
    TYContact *contact4 = [TYContact initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
    
    TYContact *contact5 = [TYContact initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18500131240"];
    
    
    TYContactGroup *group2 = [TYContactGroup initWithName:@"L" andDetail:@"With names beginning with L" andContacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5, nil]];
    
    [_contacts addObject:group2];
    
    TYContact *contact6 = [TYContact initWithFirstName:@"Sun" andLastName:@"Kaoru" andPhoneNumber:@"18500131235"];
    
    TYContact *contact7 = [TYContact initWithFirstName:@"Sun" andLastName:@"Rosa" andPhoneNumber:@"18500131236"];
    
    
    TYContactGroup *group3 = [TYContactGroup initWithName:@"S" andDetail:@"With names beginning with S" andContacts:[NSMutableArray arrayWithObjects:contact6,contact7, nil]];
    
    [_contacts addObject:group3];
    
    
    TYContact *contact8 = [TYContact initWithFirstName:@"Wang" andLastName:@"Stephone" andPhoneNumber:@"18500131241"];
    
    TYContact *contact9 = [TYContact initWithFirstName:@"Wang" andLastName:@"Lucy" andPhoneNumber:@"18500131242"];
    
    
    TYContact *contact10 = [TYContact initWithFirstName:@"Wang" andLastName:@"Lily" andPhoneNumber:@"18500131243"];
    
    TYContact *contact11 = [TYContact initWithFirstName:@"Wang" andLastName:@"Emily" andPhoneNumber:@"18500131244"];
    
    
    TYContact *contact12 = [TYContact initWithFirstName:@"Wang" andLastName:@"Andy" andPhoneNumber:@"18500131245"];

    TYContactGroup *group4 = [TYContactGroup initWithName:@"W" andDetail:@"With names beginning with W" andContacts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
    
    [_contacts addObject:group4];
    
    TYContact *contact13=[TYContact initWithFirstName:@"Zhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
    TYContact *contact14=[TYContact initWithFirstName:@"Zhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
    TYContact *contact15=[TYContact initWithFirstName:@"Zhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
    TYContactGroup *group5=[TYContactGroup initWithName:@"Z" andDetail:@"With names beginning with Z" andContacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
    [_contacts addObject:group5];
    
}

- (void)addToolbar
{
    CGRect frame = self.view.frame;
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, kContactToolbarHeight)];
    [self.view addSubview:_toolbar];
    UIBarButtonItem *removeButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(remove)];
    UIBarButtonItem *flexibleButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    NSArray *buttonArray = [NSArray arrayWithObjects:removeButton,flexibleButton,addButton, nil];
    _toolbar.items = buttonArray;
}

- (void)remove{
    _isInsert = false;
    [_tableView setEditing:!_tableView animated:true];
}

- (void)add{
    _isInsert = true;
    [_tableView setEditing:!_tableView.isEditing animated:true];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"计算分组数");
    if (_isSearching) {
        return 1;
    }
    
    return _contacts.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"计算每组组（%li）行数",(long)section);
    
    if (_isSearching) {
        return _searchContacts.count;
    }
    
    TYContactGroup *group1 = _contacts[section];
    return group1.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TYContact *contact = nil;
    if (_isSearching) {
        return _searchContacts[indexPath.row];
    }else{
        TYContactGroup *group = _contacts[indexPath.section];
        contact = group.contacts[indexPath.row];
    }
    
    NSLog(@"生成单元格（组:%li,行%li）",(long)indexPath.section,(long)indexPath.row);
    //TYContactGroup *group = _contacts[indexPath.section];
    //TYContact *contact = group.contacts[indexPath.row];
    
    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey1";
    static NSString *cellIdentifierForFirstRow = @"UITableViewCellIdentifierKeyWithSwitch";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    if (indexPath.row == 0  ) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierForFirstRow];
    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    if (!cell) {
        if (indexPath.row == 0) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierForFirstRow];
            UISwitch *sw = [[UISwitch alloc]init];
            [sw addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = sw;
        }else{
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
        }
    }
    
    if (indexPath.row == 0) {
        ((UISwitch *)cell.accessoryView).tag = indexPath.section;
    }
    
    cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text  = contact.phoneNumber;
    
    NSLog(@"cell:%@",cell);
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSLog(@"生成组（组%li）名称",(long)section);
    TYContactGroup *group = _contacts[section];
    return group.name;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    _isSearching = NO;
    _searchBar.text = @"";
    [self.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(nonnull NSString *)searchText
{
    if ([_searchBar.text isEqual:@""]) {
        _isSearching = NO;
        [self.tableView reloadData];
        return;
    }
    [self searchDataWithKeyWord:_searchBar.text];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self searchDataWithKeyWord:_searchBar.text];
    [_searchBar resignFirstResponder];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSLog(@"生成尾部（组%li）详情",(long)section);
    TYContactGroup *group = _contacts[section];
    return group.detail;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSLog(@"生成组索引");
    NSMutableArray *indexs = [[NSMutableArray alloc] init];
    for (TYContactGroup *group in _contacts) {
        [indexs addObject:group.name];
    }
    return indexs;
}

- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section ==0) {
        return 50;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedIndexPath = indexPath;
    TYContactGroup *group = _contacts[indexPath.section];
    TYContact *contact = group.contacts[indexPath.row];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"System Info" message:[contact getName] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle=UIAlertViewStylePlainTextInput; //设置窗口内容样式
    UITextField *textField= [alert textFieldAtIndex:0]; //取得文本框
    textField.text=contact.phoneNumber; //设置文本框内容
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        UITextField *textField = [alertView textFieldAtIndex:0];
        TYContactGroup *group = _contacts[_selectedIndexPath.section];
        TYContact *contact = group.contacts[_selectedIndexPath.row];
        contact.phoneNumber = textField.text;
        NSArray *indexPaths = @[_selectedIndexPath];
        [_tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
    }
}



- (void)switchValueChange:(UISwitch *)sw{
    NSLog(@"section:%li,switch:%i",(long)sw.tag,sw.on);
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TYContactGroup *group = _contacts[indexPath.section];
    TYContact *contact = group.contacts[indexPath.row];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [group.contacts removeObject:contact];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        
        if (group.contacts.count == 0) {
            [_contacts removeObject:group];
            [tableView reloadData];
        }
    }else if (editingStyle ==UITableViewCellEditingStyleInsert)
    {
        TYContact *newContact = [[TYContact alloc] init];
        newContact.firstName = @"first";
        newContact.lastName = @"last";
        newContact.phoneNumber = @"12345678901";
        [group.contacts insertObject:newContact atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }
}

- (void)tableview:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    TYContactGroup *sourceGroup = _contacts[sourceIndexPath.section];
    TYContact *sourceContact = sourceGroup.contacts[sourceIndexPath.row];
    TYContactGroup *destinationGroup = _contacts[destinationIndexPath.section];
    [sourceGroup.contacts removeObject:sourceContact];
    [destinationGroup.contacts insertObject:sourceContact atIndex:destinationIndexPath.row];
    if (sourceGroup.contacts.count ==0) {
        [_contacts removeObject:sourceGroup];
        [tableView reloadData];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_isInsert) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)searchDataWithKeyWord:(NSString *)keyWord
{
    _isSearching = YES;
    _searchContacts = [NSMutableArray array];
    [_contacts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TYContactGroup *group = obj;
        [group.contacts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            TYContact *contact = obj;
            if ([contact.firstName.uppercaseString containsString:keyWord.uppercaseString] ||[contact.lastName.uppercaseString containsString:keyWord.uppercaseString.uppercaseString ]||[contact.phoneNumber containsString:keyWord]) {
                [_searchContacts addObject:contact];
            }
        }];
    }];
    
    [self.tableView reloadData];
}

- (void)addSearchBar{
    CGRect searchBarRect = CGRectMake(0, 0, self.view.frame.size.width, kSearchbarHeight);
    _searchBar = [[UISearchBar alloc] initWithFrame:searchBarRect];
    
    _searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    
    _searchBar.placeholder = @"Please input key word...";
    
    _searchBar.showsCancelButton = YES;
    
    _searchBar.delegate = self;
    self.tableView.tableHeaderView = _searchBar;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [_searchBar resignFirstResponder];
    return indexPath;
}
@end