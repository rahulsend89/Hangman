#import "animatioViewViewController.h"
#import "TBXML.h"
#import <QuartzCore/QuartzCore.h>
@implementation animatioViewViewController

@synthesize startView , gameView , helpView ,help ,startGame ,aboutUs , back ,back1 , back2 , about ,question,answer,answerLable,questionLable,scoreText,countQuestion,array1,holder_mc,feed,gameOvervar,flip;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	[self RunGame];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:)
												 name:UIDeviceOrientationDidChangeNotification object:nil];
}
- (void)orientationChanged:(NSNotification *)notification{
	[self performSelector:@selector(updateLandscapeView) withObject:nil afterDelay:0];
}
-(void)startGameDoit{
	b = YES;
	[self flip:gameView :startView];
}
-(void)helpDoit{
	b = YES;
	[self flip:helpView :startView];
}
-(void)aboutDoit{
	b = YES;
	[self flip:aboutUs :startView];
}
-(void)backToMain:(UIView *)currentView{
	b = NO;
	//NSLog(@"Current View : %@",currentView.superview);
	[self flip:startView :currentView.superview];
}
/*
 - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
 
 }*/
-(void)RunGame{
	chances = 0;
	[self loadUnknownXML];
	[self.view setBackgroundColor:[UIColor whiteColor]];
	scoreText = 0;
	countQuestion = 0;
	feed = 0;
	flip = TRUE;
	CGRect rect = CGRectMake(0.0, 0.0, 320.0, 460.0);
	startView  = [[UIView alloc] initWithFrame:rect];
	helpView  = [[UIView alloc] initWithFrame:rect];
	aboutUs  = [[UIView alloc] initWithFrame:rect];
	gameView  = [[UIView alloc] initWithFrame:rect];
	UIImageView *bg_img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"potrait_bg.jpg"]]; 
	
	holder_mc  = [[UIView alloc] initWithFrame:CGRectMake(0.0, 300.0, self.view.frame.size.width, 200.0)];
	feedHolder_mc = [[UIView alloc] initWithFrame:CGRectMake(173.0, 71.0, 120.0, 30.0)];
	self.view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	[self.view setAutoresizesSubviews:YES];
	
	holder_mc.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	[holder_mc setAutoresizesSubviews:YES];
	
	feedHolder_mc.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	[feedHolder_mc setAutoresizesSubviews:YES];
	
	startView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	[startView setAutoresizesSubviews:YES];
	
	holder_mc.backgroundColor = [UIColor clearColor];
	UIImageView *feed_image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"potrait_feed.png"]];
	feed_image.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	[feed_image setFrame:feedHolder_mc.frame];
	feedHolder_mc.backgroundColor = [UIColor clearColor];
	//startView.backgroundColor = [UIColor whiteColor];
	aboutUs.backgroundColor = [UIColor whiteColor];
	gameView.backgroundColor = [UIColor blackColor];
	gameView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	helpView.backgroundColor = [UIColor blueColor];
	UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x-100, 10.0, 200.0, 100.0)];
	lable.text = @"Welcome To Game";
	lable.font = [UIFont boldSystemFontOfSize:20];
	lable.textColor = [UIColor blackColor];
	lable.textAlignment = UITextAlignmentCenter;
	lable.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	UIImageView *ques_image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"potrait_qu.png"]];
	ques_image.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	[ques_image setFrame:CGRectMake(self.view.center.x-155, 100.0, 305.0, 100.0)];
	questionLable = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x-150, 100.0, 300.0, 100.0)];
	questionLable.text = @"Q : question Lable";
	questionLable.font = [UIFont systemFontOfSize:15];
	questionLable.textColor = [UIColor blackColor];
	questionLable.textAlignment = UITextAlignmentCenter;
	questionLable.lineBreakMode =  UILineBreakModeWordWrap;
	questionLable.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
	questionLable.numberOfLines = 6.0;
	questionLable.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	[questionLable setBackgroundColor:[UIColor clearColor]];
	
	UIImageView *ans_image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"potrait_ans.png"]];
	ans_image.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	[ans_image setFrame:CGRectMake(self.view.center.x-155, 220.0, 300.0, 50.0)];
	
	answerLable = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x-150, 220.0, 300.0, 50.0)];
	answerLable.text = @"ans : Answer Lable";
	answerLable.font = [UIFont systemFontOfSize:15];
	answerLable.textColor = [UIColor blackColor];
	answerLable.textAlignment = UITextAlignmentCenter;
	answerLable.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	answerLable.backgroundColor = [UIColor clearColor];
	
	[self checkStatus];
	
	score = [[UILabel alloc] initWithFrame:CGRectMake(1.0, 1.0, 100.0, 20.0)];
	score.text = [[NSString alloc] initWithFormat:@"Score : %d",scoreText];
	score.font = [UIFont boldSystemFontOfSize:15];
	score.textColor = [UIColor whiteColor];
	score.textAlignment = UITextAlignmentCenter;
	score.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	score.backgroundColor = [UIColor clearColor];
	
	//UIButton *back1 = [[UIButton alloc] init];
	SEL backTo1 = @selector(backToMain:);
	//[self performSelector:backTo1 withObject:back.superview];
	SEL backTo2 = @selector(backToMain:);
	SEL backTo3 = @selector(backToMain:);
	//[self performSelector:backTo2 withObject:back1.superview];
	//[backTo (UIView *):back.superview];
	//startGame = [self buttonWithTitle:@"StartGame" target:self selector:@selector(startGameDoit) frame:CGRectMake(self.view.center.x-50, 200.0, 100.0, 50.0) fontSize:12];
	startGame = [self buttonWithTitle:@"StartGame" target:self selector:@selector(startGameDoit) frame:CGRectMake(self.view.center.x-50, 200.0, 100.0, 50.0) :12];
	startGame.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	back = [self buttonWithTitle:@"back" target:self selector:backTo1 frame:CGRectMake(self.view.center.x+60, 0.0, 51.0, 23.0) : 12];
	back.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	back.backgroundColor = [UIColor clearColor];
	[back setBackgroundImage:[UIImage imageNamed:@"potrait_back_btn.png"] forState:UIControlStateNormal];
	back1 = [self buttonWithTitle:@"back" target:self selector:backTo2 frame:CGRectMake(self.view.center.x-50, 200.0, 100.0, 50.0) : 12];
	back1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	back2 = [self buttonWithTitle:@"back" target:self selector:backTo3 frame:CGRectMake(self.view.center.x-50, 200.0, 100.0, 50.0) :12];
	back1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	help = [self buttonWithTitle:@"Help" target:self selector:@selector(helpDoit) frame:CGRectMake(self.view.center.x-50, 270.0, 100.0, 50.0) : 12];
	help.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	about = [self buttonWithTitle:@"About" target:self selector:@selector(helpDoit) frame:CGRectMake(self.view.center.x-50, 340.0, 100.0, 50.0) : 12];
	about.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	helpView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	aboutUs.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	[helpView addSubview:back1];
	[aboutUs addSubview:back2];
	[gameView addSubview:bg_img];
	[gameView addSubview:holder_mc];
	[gameView addSubview:feedHolder_mc];
	[gameView addSubview:back];
	[gameView addSubview:score];
	[gameView addSubview:ques_image];
	[gameView addSubview:ans_image];
	[gameView addSubview:feed_image];
[gameView addSubview:questionLable];
	[gameView addSubview:answerLable];
	[startView addSubview:lable];
	[startView addSubview:startGame];
	[startView addSubview:help];
	[startView addSubview:about];
	[self makeButtons:holder_mc];
	[self makeFeed:feedHolder_mc];
	[lable release];
	[self.view addSubview:startView];
	
}
-(void)flip:(UIView *)flipView:(UIView *)removeView{
	if (flip) {
		flip = false;
		/*CATransition *animation = [CATransition animation]; 
		 [animation setDelegate:self];
		 [animation setDuration:1.0f];
		 [animation setTimingFunction:UIViewAnimationCurveEaseInOut];
		 [animation ]*/
		
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:2.0];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(flipstop)];
		if (b) {
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
		}else {
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
		}
		//[self.view removeFromSuperview];
		//NSLog(@"Remove View : %@",removeView);
		[removeView removeFromSuperview];
		[self.view addSubview:flipView];
		[UIView commitAnimations];
	}
}
-(void)flipstop{
	flip = TRUE;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (UIButton *)buttonWithTitle:(NSString *)title target:(id)target selector:(SEL)inSelector frame:(CGRect)frame :(int)fontSize{
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setFrame:frame];
	[button setTitle:title forState:UIControlStateNormal];
	button.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
	button.userInteractionEnabled = YES;
	button.titleLabel.textAlignment = UITextAlignmentCenter;
	button.titleLabel.lineBreakMode   = UILineBreakModeTailTruncation;
	button.titleLabel.shadowOffset    = CGSizeMake (1.0, 0.0);
	button.titleLabel.textColor = [UIColor blackColor];
	button.showsTouchWhenHighlighted = YES;
	button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin;
	[button addTarget:self action:inSelector forControlEvents:UIControlEventTouchUpInside];
    //[button autorelease];
    return button;
}
-(void)makeFeed:(UIView *)addToView{
	int counter = 0;
	float xpos = 0.0;
	for (int i = 0; i<6; i++) {
		counter ++;
		UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(xpos, 5.0, 20.0, 20.0)];
		text.text = @"X";
		//text.backgroundColor = [UIColor blueColor];
		text.textAlignment = UITextAlignmentCenter;
		text.textColor = [UIColor whiteColor];
		text.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.0];
		text.font = [UIFont boldSystemFontOfSize:20.0];
		text.alpha = 0.2;
		text.transform = CGAffineTransformMakeScale(0.5, 0.5);
		text.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin|
		UIViewAutoresizingFlexibleTopMargin|
		UIViewAutoresizingFlexibleHeight|
		UIViewAutoresizingFlexibleBottomMargin;
		
		[addToView addSubview:text];
		xpos=counter*20.0;
	}
}
-(void)makeButtons:(UIView *)addToView{
	float width = 38.0;
	float height = 38.0;
	NSMutableArray *array = [[NSMutableArray alloc] init];
	for (int count = 65; count<92; count++) {
		[array addObject:[[NSString alloc] initWithFormat:@"%c",count]];
	}
	[self setArray1:array];
	int counter = 0;
	BOOL counterb = TRUE;
	float xpos = 15.0;
	float ypos = 0.0;
	for (int count=0; count<26; count++) {
		SEL fun = @selector(startGameDoit:);
		UIButton *button = [self buttonWithTitle:[array objectAtIndex:count] target:self selector:fun frame:CGRectMake(xpos,ypos, width, height) : 20];
		[button setTag:count];
		[button setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:0.0f]];
		[button setBackgroundImage:[UIImage imageNamed:@"potrait_alph_btn.png"] forState:UIControlStateNormal];
		[addToView addSubview:button];
		if (counter>5 && counterb) {
			//counterb
			counter = 0;
			ypos += height+1.0;
			xpos = 15.0;
		}else {
			if(counter>19){
				xpos += 20.0;
			}else {
				xpos += width+1.0;
				counter++;
			}
		}
	}
}

-(void)startGameDoit:(id)sender{
	NSLog(@"Count %d",[sender tag]);
	[sender setEnabled:FALSE];
	/*	NSArray *array = window.subviews;
	 int arrayLen = [array count];
	 for (int i=0; i<arrayLen; i++) {
	 //[window removeFromSuperview]
	 UIView *view = [array objectAtIndex:i];
	 [view removeFromSuperview];
	 }
	 */	
	int count = [sender tag];
	[sender setAlpha:0.5];
	NSString *answerlength =[[NSString alloc] initWithFormat:@"%@",answerLable.text];
	NSMutableArray *tempar = [self find:[[NSString alloc]initWithFormat:@"%@",[array1 objectAtIndex:count]] :[[NSString alloc] initWithFormat:@"%@",answerLable.text] : [[NSString alloc] initWithFormat:@"%@",[answer objectAtIndex:countQuestion]]];
	//NSLog(@"firstObj : %@ SecondObj : %@",[tempar objectAtIndex:0],[tempar objectAtIndex:1]);
	//[[NSString alloc]initWithFormat:@"%@",[tempar objectAtIndex:1]];
	if ([[tempar objectAtIndex:1] isEqualToString:@"1"]) {
		answerLable.text = [tempar objectAtIndex:0];
		scoreText++;
		//feed++;
		NSLog(@"Feed : %d : %d",feed,answerlength.length);
		if (feed>=answerlength.length) {
			answerLable.text = @"";
			[self nextQuestion];
		}
	}else {
		scoreText--;
		if (chances>5) {
			[self nextQuestion];
		}else {
			[self animateFeed:chances];
		}
	}
	score.text = [[NSString alloc]initWithFormat:@"Score : %d",scoreText];
	NSLog(@"%@ : ",score.text);
}

- (void)loadUnknownXML {	
	tbxml = [[TBXML alloc] initWithXMLFile:@"data1" fileExtension:@"xml"];
	
	if (tbxml.rootXMLElement)
		[self traverseElement:tbxml.rootXMLElement];
	
	[tbxml release];
}

- (void) traverseElement:(TBXMLElement *)element {
	NSMutableArray *arrayque = [[NSMutableArray alloc] init];
	NSMutableArray *arrayans = [[NSMutableArray alloc] init];
	do {
		TBXMLElement * text = [tbxml childElementNamed:@"text" parentElement:element];
		TBXMLElement * ans = [tbxml childElementNamed:@"ans" parentElement:element];
		if (text != nil) {
			NSString *str =[[NSString alloc] initWithFormat:@"%@", [tbxml textForElement:text] ];
			NSString *strans =[[NSString alloc] initWithFormat:@"%@", [tbxml textForElement:ans] ];
			[arrayque addObject:[[NSString alloc] initWithString:str]];
			[arrayans addObject:[[NSString alloc] initWithString:strans]];
			question = arrayque;
			answer = arrayans;
			NSLog(@"Text %@ : ans : %@",str,strans);
		}
		if (element->firstChild) [self traverseElement:element->firstChild];
	} while ((element = element->nextSibling));
	NSLog(@"Question :%d %d",[question count],countQuestion);
}
-(void)loadText:(NSString*)que:(NSString*)ans{
	NSString *str1 =[[NSString alloc] initWithString:ans];
	//NSLog(@":%@ :",str1);
	ans = [ans stringByReplacingOccurrencesOfString:@" " withString:@""];
	int strlen = [ans length];
	for (int count1=0; count1<strlen; count1++) {
		str1 = [str1 stringByReplacingOccurrencesOfString:[[NSString alloc] initWithFormat:@"%c",[ans characterAtIndex:count1]] withString:@"_"];
		NSLog(@": %@ :",str1);
	}
	questionLable.text = que;
	answerLable.text = str1;
}
-(void)loadQuestion:(int)count{
	NSLog(@"Question loadQuestion :%d %d",[question count],count);
	[self loadText:[question objectAtIndex:count] :[answer objectAtIndex:count]];
}
-(void)checkStatus{
	if (countQuestion>=[question count]) {
		countQuestion = 0;
		//gameOvervar = TRUE;
		[self fadeanimation];
	}else {
		NSLog(@"Question checkStatus :%d %d",[question count],countQuestion);
		[self fadeanimation];
		//countQuestion++;
	}
}
-(void)fadeanimation{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(fadeIn)];
	[gameView setAlpha:0.0];
	[UIView commitAnimations];
}
- (void)updateLandscapeView{
	float width = 0.0;
	float height = 0.0;
	width = self.view.frame.size.width;
	height = self.view.frame.size.height;
	UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if (UIDeviceOrientationIsLandscape(deviceOrientation))
	{
		CGRect rect = CGRectMake(0.0, 0.0, height, width);
		[gameView setFrame:rect];
		[startView setFrame:rect];
		[helpView setFrame:rect];
		[aboutUs setFrame:rect];
		//startView , gameView , helpView ,help ,startGame ,aboutUs
		//[self.view setFrame:CGRectMake(0.0, 0.0, height, width)];
		//[lable setFrame:CGRectMake(0.0, 0.0, height, 100.0)]; 
		//clip_mc.center = CGPointMake(height/2, clip_mc.center.y);
    }
	else if (deviceOrientation == UIDeviceOrientationPortrait)
	{	
		CGRect rect = CGRectMake(0.0, 0.0, width, height);
		[gameView setFrame:rect];
		[startView setFrame:rect];
		[helpView setFrame:rect];	
		[aboutUs setFrame:rect];
		//[self.view setFrame:CGRectMake(0.0, 0.0, width, height)];
		//[lable setFrame:CGRectMake(0.0, 0.0, width, 100.0)];
		//clip_mc.center = CGPointMake(width/2, clip_mc.center.y);
    }   
}
-(void)fadeIn{
	NSLog(@"Animation did stop");
	if (gameOvervar) {
		[self gameOver];
	}else {
		[self loadQuestion:countQuestion];
	}
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[gameView setAlpha:1.0];
	[UIView commitAnimations];
}
-(void)gameOver{		
	//NSLog(@"Error Cause of nextQuestion");
	NSArray *array = [[NSArray alloc] init];
	array = gameView.subviews;
	int arrayLen = [array count];
	for (int i=0; i<arrayLen; i++) {
		//[window removeFromSuperview]
		UIView *button = [array objectAtIndex:i];
		//UIView *bu = button.superview;
		[button removeFromSuperview];
		//[holder_mc removeFromSuperview];
		//NSLog(@"button :%@  bu :%@",button,bu);
		//[bu setEnabled:YES];
		//[view enable]
		//[button setEnabled:YES];
		//[button setAlpha:1.0];
		//[button setTitle:@"_" forState:UIControlStateNormal];
	}
	UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x-100, 10.0, 200.0, 100.0)];
	lable.text = @"GameOver";
	lable.font = [UIFont boldSystemFontOfSize:20];
	lable.textColor = [UIColor blackColor];
	lable.textAlignment = UITextAlignmentCenter;
	[gameView addSubview:lable];
	[back setFrame:CGRectMake(self.view.center.x-50, 200.0, 100.0, 50.0)];
	[gameView addSubview:back];
	
	
}
-(void)nextQuestion{
	chances=0;
	NSLog(@"Error Cause of nextQuestion");
	NSArray *array = [[NSArray alloc] init];
	NSArray *arrayfeed = [[NSArray alloc] init];
	array = holder_mc.subviews;
	arrayfeed = feedHolder_mc.subviews;
	int arrayLen = [array count];
	int arrayLen1 = [arrayfeed count];
	for (int j=0; j<arrayLen1; j++) {
		UIView *text = [arrayfeed objectAtIndex:j];
		text.alpha = 0.2;
		text.transform = CGAffineTransformMakeScale(0.5, 0.5);
	}
	for (int i=0; i<arrayLen; i++) {
		//[window removeFromSuperview]
		UIButton *button = [array objectAtIndex:i];
		//UIView *bu = button.superview;
		//[button removeFromSuperview];
		//NSLog(@"button :%@  bu :%@",button,bu);
		//[bu setEnabled:YES];
		//[view enable]
		[button setEnabled:YES];
		[button setAlpha:1.0];
		//[button setTitle:@"_" forState:UIControlStateNormal];
	}
	//[array release];
	feed = 0;
	countQuestion++;
	[self checkStatus];
}

-(NSMutableArray *)find:(NSString *)searchString :(NSString *)newString:(NSString*)subjectString{
	//NSString *subjectString     = @"this is a sample Text app";
	int trurObj = 0;
	BOOL val = FALSE;
	NSMutableArray *array = [[NSMutableArray alloc] init];
	NSLog(@"NewString :%@ : SubjectString :%@ : FindString %@",newString,subjectString,searchString);
	int strlength = [subjectString length];
	for (int i = 0; i<strlength; i++) {
		if ([[searchString lowercaseString] isEqualToString:[[[NSString alloc] initWithFormat:@"%c",[subjectString characterAtIndex:i] ] lowercaseString]]) {
			val = TRUE;
			trurObj++;
			NSRange r1 = NSMakeRange(0, i);
			NSRange r2 = NSMakeRange(i, 1);
			//NSLog(@"Char Found : %@ : %@ : %d : %d : %@ [ %@ ] %@",[[NSString alloc] initWithFormat:@"%c",[subjectString characterAtIndex:i]],searchString,i,[subjectString length],[newString substringWithRange:r1],[subjectString substringWithRange:r2],[newString substringFromIndex:i+1]);
			newString = [[NSString alloc] initWithFormat:@"%@%@%@",[newString substringWithRange:r1],[subjectString substringWithRange:r2],[newString substringFromIndex:i+1]];
		}
	}
	[array addObject:newString];
	[array addObject:[[NSString alloc]initWithFormat:@"%d",val]];
	//[array addObject:trurObj];
	feed += trurObj;
	return array;
}
-(void)animateFeed:(int)num{
	NSArray *array = [[NSArray alloc] init];
	array = feedHolder_mc.subviews;
	//int arrayLen = [array count];
	UIView *text = [array objectAtIndex:num];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationRepeatCount:1.5];
	[UIView setAnimationRepeatAutoreverses:TRUE];
	//[UIView setAnimationDelegate:self];
	//[UIView setAnimationDidStopSelector:@selector(doit:)];
	text.alpha = 1.0;
	CGAffineTransform transform = CGAffineTransformMakeScale(1.0, 1.0);
	text.transform = transform;
	//sleep(1.0);
	[UIView commitAnimations];
	chances++;
}
- (void)dealloc {
	[startView release];
	[gameView release];
	[helpView release];
	[help release];
	[startGame release];
	[aboutUs release];
	[back release];
	[back1 release];
	[back2 release];
	[about release];
	[question release];
	[answer release];
	[answerLable release];
	[questionLable release];
    [super dealloc];
}
@end