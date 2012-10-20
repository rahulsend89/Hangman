#import <UIKit/UIKit.h>
#import "TBXML.h"

@interface animatioViewViewController : UIViewController {
	UIView *startView;
	UIView *gameView;
	UIView *helpView;
	UIView *aboutUs;
	UIView *holder_mc;
	UIView *feedHolder_mc;
	UIButton *startGame;
	UIButton *help;
	UIButton *about;
	UIButton *back;
	UIButton *back1;
	UIButton *back2;
	UILabel *score;
	UILabel *questionLable;
	UILabel *answerLable;
	int scoreText;
	int countQuestion;
	BOOL b;
	NSMutableArray * question;
	NSMutableArray * answer;
	TBXML * tbxml;
	NSMutableArray *array1;
	int feed;
	BOOL gameOvervar;
	BOOL flip;
	int chances;
}
@property (nonatomic ,retain)UIView *startView;
@property (nonatomic ,retain)UIView *aboutUs;
@property (nonatomic ,retain)UIView *helpView;
@property (nonatomic ,retain)UIView *gameView;
@property (nonatomic ,retain)UIButton *startGame;
@property (nonatomic ,retain)UIButton *help;
@property (nonatomic ,retain)UIButton *about;
@property (nonatomic ,retain)UIButton *back;
@property (nonatomic ,retain)UIButton *back1;
@property (nonatomic ,retain)UIButton *back2;
@property (nonatomic, retain) NSMutableArray * question;
@property (nonatomic, retain) NSMutableArray * array1;
@property (nonatomic, retain) NSMutableArray * answer;
@property (nonatomic, retain) UILabel * questionLable;
@property (nonatomic, retain) UILabel * answerLable;
@property (nonatomic,retain)UIView *holder_mc;
@property (assign) int scoreText;
@property (assign) int feed;
@property (assign) int countQuestion;
@property (assign) BOOL gameOvervar;
@property (assign) BOOL flip;

-(void)flip:(UIView *)flipView:(UIView *)removeView;
-(void)startGameDoit;
-(void)helpDoit;
-(void)aboutDoit;
-(void)backToMain:(UIView *)currentView;
-(void)startGameDoit:(id)sender;
-(void)makeButtons:(UIView *)addToView;
- (void)loadUnknownXML;
- (void) traverseElement:(TBXMLElement *)element;
-(void)checkStatus;
-(void)loadQuestion:(int)count;
-(void)loadText:(NSString*)que:(NSString*)ans;
-(void)nextQuestion;
-(void)fadeanimation;
-(void)fadeIn;
-(void)gameOver;
- (void)updateLandscapeView;
-(void)makeFeed:(UIView *)addToView;
-(void)animateFeed:(int)num;
-(void)RunGame;
- (void)orientationChanged:(NSNotification *)notification;
-(NSMutableArray *)find:(NSString *)searchString :(NSString *)newString:(NSString*)subjectString;
- (UIButton *)buttonWithTitle:(NSString *)title target:(id)target selector:(SEL)inSelector frame:(CGRect)frame :(int)fontSize;
@end