//
//  JTHeaderView.m
//  HeaderForm
//
//  Created by Joy Tao on 12/20/12.
//  Copyright (c) 2012 Joy Tao. All rights reserved.
//

#import "JTHeaderView.h"
#import <QuartzCore/QuartzCore.h>

#define RADIUS 4.0f


@implementation JTHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        CGRect rect1 = CGRectMake(100.0f, 15.0f, 210.0f, 30.0f);
        CGRect tfFrame = UIEdgeInsetsInsetRect(rect1, UIEdgeInsetsMake(1.0f, 5.0f ,1.0f , 5.0f));
        
        UITextField * tf = [[UITextField alloc]initWithFrame:tfFrame];
        UIImageView * tfImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"edit"]];
        [tf setLeftView:tfImg];
        [tf setLeftViewMode:UITextFieldViewModeAlways];
        [tf setBackgroundColor:[UIColor clearColor]];
        [tf setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [tf setFont:[UIFont fontWithName:@"HelveticaNeue" size:14]];
        [tf setDelegate:self];
        [self addSubview:tf];
        
        
        CGRect rect2 = CGRectMake(100.0f, 45.0f, 210.0f, 60.0f);
        
        UIImageView * tvImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"comment"]];
        tvImg.frame = CGRectMake(105.0f, 46.0f, [UIImage imageNamed:@"comment"].size.width, [UIImage imageNamed:@"comment"].size.height);
        [self addSubview:tvImg];
        
        CGRect tvFrame = UIEdgeInsetsInsetRect(rect2, UIEdgeInsetsMake(1.0f, 15.0f , 1.0f , 5.0f));

        UITextView * tv = [[UITextView alloc]initWithFrame:tvFrame];
        [tv setDelegate:self];
        [tv setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tv];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [[UIColor lightGrayColor] setStroke];
    [[UIColor whiteColor] setFill];
    
    // Drawing ImageView Rect
    [self drawThumbViewWithRect:CGRectMake(10.0f, 15.0f, 90.0f, 90.0f)];
    [self drawTextFieldWithRect:CGRectMake(100.0f, 15.0f, 210.0f, 30.0f)];
    [self drawTextViewWithRect:CGRectMake(100.0f, 45.0f, 210.0f, 60.0f)];
    
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [[UIColor blackColor]CGColor];
    self.layer.shadowOffset = CGSizeMake(3.0f, 5.0f);
    self.layer.shadowOpacity = 0.7;
    
    
}

- (void) drawThumbViewWithRect:(CGRect)rect
{
     UIBezierPath * pathThumbImg = [UIBezierPath bezierPathWithRoundedRect:rect
                          byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerTopLeft
                                cornerRadii:CGSizeMake(RADIUS, RADIUS)];
    [pathThumbImg setLineWidth:2.0f];
    [pathThumbImg stroke];
    [pathThumbImg fill];
    
    
    CGRect innerRect = UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f));
    UIBezierPath * dashedRect = [UIBezierPath bezierPathWithRoundedRect:innerRect cornerRadius:RADIUS];
    
    CGFloat dashPattern[2] = { 5.0f, 4.0f };
    [dashedRect setLineDash:dashPattern count:2 phase:0];
    [dashedRect setLineWidth:2.0f];
    [dashedRect stroke];
    
}

- (void) drawTextFieldWithRect:(CGRect)rect
{
    UIBezierPath * pathThumbImg = [UIBezierPath bezierPathWithRoundedRect:rect
                                                        byRoundingCorners:UIRectCornerTopRight
                                                              cornerRadii:CGSizeMake(RADIUS, RADIUS)];
    [pathThumbImg setLineWidth:2.0f];
    [pathThumbImg stroke];
    [pathThumbImg fill];

}

- (void) drawTextViewWithRect:(CGRect)rect
{
    UIBezierPath * pathThumbImg = [UIBezierPath bezierPathWithRoundedRect:rect
                                                        byRoundingCorners:UIRectCornerBottomRight
                                                              cornerRadii:CGSizeMake(RADIUS, RADIUS)];
    [pathThumbImg setLineWidth:2.0f];
    [pathThumbImg stroke];
    [pathThumbImg fill];

}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return YES;
}

- (BOOL) textViewShouldEndEditing:(UITextView *)textView
{
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


@end
