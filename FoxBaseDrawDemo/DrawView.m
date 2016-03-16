//
//  DrawView.m
//  SharpLayerTest
//
//  Created by 徐惠雨 on 15/12/16.
//  Copyright © 2015年 XFoxer. All rights reserved.
//

#import "DrawView.h"

/*!
    该类为基本绘画学习，包含了CoreGriphic库 一些基本绘画图形
   @note 参考学习资料：
     CGContextRef 用法
     http://blog.csdn.net/perfect_promise/article/details/7660220
     
     IOS Quartz 各种绘制图形的用法
     http://blog.csdn.net/zhibudefeng/article/details/8463268
     
     
     http://blog.csdn.net/fhbystudy/article/details/6792891
 */



@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
//    [self drawStraightLine];
//    
//    [self drawBrokenLine];
    
//    [self drawViewRect];
    
//    [self drawOtherRect];
//    
//    [self drawText];
//
//    [self drawBackgroundRect];
//    
//    [self drawEllipseView];
//    
//    [self drawEllipseRect];
//    
//    [self drawArcView];
//
//    [self drawLinearGradientView];
//    [self drawLineRect];
//
    [self drawLinePath];
//
//    [self drawCircleView];
//    [self drawFillEllipseView];
//    
//    [self drawRhombusView];
//    
//    [self drawColorRect];
//    
//    
//    [self drawBezierView];
//    
//    [self drawSecondBezierView];
//    
//    
//    [self drawDashLine];
//    [self drawImage];
    
}


/*!
 *  @brief attribute文字属性设置
 *
 *  @param size      文字大小
 *  @param color     文字颜色
 *  @param alignment 对齐方式
 *  @note   NSStrokeColorAttributeName  和  NSStrokeWidthAttributeName  配合使用设置空心文字
 *  @return attribute dict
 */
- (NSDictionary *)setAttributeWithFontSize:(NSInteger)size
                             withTextColor:(UIColor *)color
                             withAlignment:(NSTextAlignment)alignment
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode  = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = alignment;
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                
                                [UIFont systemFontOfSize:size],NSFontAttributeName,
                                
                                paragraphStyle,NSParagraphStyleAttributeName,
                                
                                color,NSForegroundColorAttributeName,
                                
                                [UIColor blackColor],NSStrokeColorAttributeName,
                                
                                [NSNumber numberWithFloat:2.0f],NSStrokeWidthAttributeName,nil];
    
    
    return attributes;
}

/*! D1
 *  @brief 画直线
 *  @note  两点一线，主要在于起始点和结束点
 */
- (void)drawStraightLine
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 1); //画线的颜色
    CGContextMoveToPoint(context, 20, 20);      //开始画图，起点
    CGContextAddLineToPoint(context, 200, 20);  //画直线，结束点
    CGContextSetLineWidth(context, 2);          //线的宽度
    CGContextStrokePath(context);               //收拢画线
}


/*! D2
 *  @brief 画折线，确定折线的点，多个
 */
-  (void)drawBrokenLine
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画线
    UIColor *aColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0];
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1.0);
    CGContextSetFillColorWithColor(context, aColor.CGColor);
    CGContextSetLineWidth(context, 4.0);
    CGPoint aPoints[5];
    aPoints[0] = CGPointMake(60, 60);
    aPoints[1] = CGPointMake(260, 60);
    aPoints[2] = CGPointMake(260, 300);
    aPoints[3] = CGPointMake(60, 300);
    aPoints[4] = CGPointMake(60, 60);
    CGContextAddLines(context, aPoints, 5);
    CGContextDrawPath(context, kCGPathStroke); //开始画线
}

/*! D3.1
 *  @brief 画矩形
 */
- (void)drawViewRect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0, 0.25, 0, 0.5);
    CGContextFillRect(context, CGRectMake(40, 40, 100, 100));
    CGContextStrokePath(context);
}

/*!  D3.2
 *  @brief 画矩形
 */
- (void)drawOtherRect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGRect rectangle = CGRectMake(60,170,200,80);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
}



/*! D4
 *  @brief 画文字
 */
- (void)drawText

{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetRGBFillColor(context, 0.5, 0.5, 0.5, 0.5);
    
    [@"踏歌长行，梦想永在"  drawInRect:CGRectMake(40,50,100,60)
               withAttributes:[self setAttributeWithFontSize:15
                                               withTextColor:[UIColor purpleColor]
                                               withAlignment:NSTextAlignmentLeft]];
}

/*! D5
 *  @brief 画颜色背景矩形
 */
- (void)drawBackgroundRect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.1, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    UIGraphicsPushContext(context);
    CGContextSetLineWidth(context, 320);
    CGContextSetRGBStrokeColor(context, 250/255, 250/255, 250/255, 1);
    CGContextStrokeRect(context,CGRectMake(0, 0, 100, 100));
    UIGraphicsPopContext();
}

/*! D6
 *  @brief 画椭圆
 */
- (void)drawEllipseView
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect aRect= CGRectMake(40, 200, 160, 100);
    CGContextSetRGBStrokeColor(context, 0.6, 0.9, 0, 1.0);
    CGContextSetLineWidth(context, 3.0);
    CGContextAddEllipseInRect(context, aRect); //椭圆
    CGContextDrawPath(context, kCGPathEOFill);
}


/*! D7
 *  @brief 画圆弧
 *  @note  弧度的2点加圆弧的半径
 */
- (void)drawArcView
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddArcToPoint(context, 50, 100, 50, 150, 50);
    CGContextStrokePath(context);
}

/*! D8
 *  @brief 渐变色
 */
- (void)drawLinearGradientView
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClip(context);
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
        0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    CGColorSpaceRelease(rgb);
    CGContextDrawLinearGradient(context, gradient,CGPointMake
                                (0.0,0.0) ,CGPointMake(0.0,self.frame.size.height),
                                kCGGradientDrawsBeforeStartLocation);
}

/*! D9
 *  @brief 四条线画一个正方形
 */
- (void)drawLineRect
{
    //画线
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *aColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0];
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1.0);
    CGContextSetFillColorWithColor(context, aColor.CGColor);
    CGContextSetLineWidth(context, 4.0);
    CGPoint aPoints[5];
    aPoints[0] =CGPointMake(60, 60);
    aPoints[1] =CGPointMake(260, 60);
    aPoints[2] =CGPointMake(260, 300);
    aPoints[3] =CGPointMake(60, 300);
    aPoints[4] =CGPointMake(60, 60);
    CGContextAddLines(context, aPoints, 5);
    CGContextDrawPath(context, kCGPathStroke); //开始画线
}



/*! D10
 *  @brief 椭圆和矩形
 */
- (void)drawCircleView
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *aColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0];
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1.0);
    CGContextSetFillColorWithColor(context, aColor.CGColor);
    //椭圆
    CGRect aRect= CGRectMake(80, 80, 160, 100);
    CGContextSetRGBStrokeColor(context, 0.6, 0.9, 0, 1.0);
    CGContextSetLineWidth(context, 3.0);
    CGContextSetFillColorWithColor(context, aColor.CGColor);
    CGContextAddRect(context, aRect); //矩形
    CGContextAddEllipseInRect(context, aRect); //椭圆
    CGContextDrawPath(context, kCGPathStroke);
}

/*! D11
 *  @brief 画一个实心的圆
 */
- (void)drawFillEllipseView
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextFillEllipseInRect(context, CGRectMake(95, 95, 100.0, 100));
    CGContextDrawPath(context, kCGPathStroke);
}


/*! D12
 *  @brief rhombus
 */
- (void)drawRhombusView{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 150);
    CGContextAddLineToPoint(context, 100, 200);
    CGContextAddLineToPoint(context, 50, 150);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextStrokePath(context);
    
}

/*! D13
 *  @brief 画椭圆
 */
- (void)drawEllipseRect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGRect rectangle = CGRectMake(60,170,200,80);
    
    CGContextAddEllipseInRect(context, rectangle);
    
    CGContextStrokePath(context);
}

/*! D14
 *  @brief 线距离
 */
- (void)drawLinePath
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 150);
    CGContextAddLineToPoint(context, 100, 200);
    CGContextAddLineToPoint(context, 50, 150);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillPath(context);
}


/*! D15
 *  @brief 画蓝色边线的矩形
 */
- (void)drawColorRect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGRect rectangle = CGRectMake(60,170,200,80);
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillRect(context, rectangle);
}

/*! D16
 *  @brief 绘制贝塞尔曲线
 *  @note 贝兹曲线是通过移动一个起始点，然后通过两个控制点,还有一个中止点，
 *        调用CGContextAddCurveToPoint() 函数绘制
 */
- (void)drawBezierView
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddCurveToPoint(context, 0, 50, 300, 250, 300, 400);
    CGContextStrokePath(context);
}

/*! D17
 *  @brief 绘制二次贝塞尔曲线
 */
- (void)drawSecondBezierView
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextMoveToPoint(context, 10, 200);
    
    CGContextAddQuadCurveToPoint(context, 150, 10, 300, 200);
    
    CGContextStrokePath(context);
}

/*! D18
 *  @brief 画虚线
 */
- (void)drawDashLine
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGFloat dashArray[] = {2,6,4,2};
    
    //跳过3个再画虚线，所以刚开始有6-（3-2）=5个虚点
    CGContextSetLineDash(context, 3, dashArray, 4);
    
    CGContextMoveToPoint(context, 10, 200);
    
    CGContextAddQuadCurveToPoint(context, 150, 10, 300, 200);
    
    CGContextStrokePath(context);
}

/*! D19
 *  @brief 绘制图片
 */
- (void)drawImage
{
    NSString* imagePath = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"png"];
    UIImage* myImageObj = [[UIImage alloc] initWithContentsOfFile:imagePath];
    //[myImageObj drawAtPoint:CGPointMake(0, 0)];
    [myImageObj drawInRect:CGRectMake(0, 0, 320, 480)];
    
    NSString *s = @"我的小狗";
    
    [s drawAtPoint:CGPointMake(100, 0)
    withAttributes:[self setAttributeWithFontSize:15
                                    withTextColor:[UIColor purpleColor]
                                    withAlignment:NSTextAlignmentLeft]];
    
    
    
    /*
     NSString *path = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"png"];
     UIImage *img = [UIImage imageWithContentsOfFile:path];
     CGImageRef image = img.CGImage;
     CGContextSaveGState(context);
     CGRect touchRect = CGRectMake(0, 0, img.size.width, img.size.height);
     CGContextDrawImage(context, touchRect, image);
     CGContextRestoreGState(context);
     */
    
    
    /*NSString *path = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"png"];
     UIImage *img = [UIImage imageWithContentsOfFile:path];
     CGImageRef image = img.CGImage;
     CGContextSaveGState(context);
     
     CGContextRotateCTM(context, M_PI);
     CGContextTranslateCTM(context, -img.size.width, -img.size.height);
     
     CGRect touchRect = CGRectMake(0, 0, img.size.width, img.size.height);
     CGContextDrawImage(context, touchRect, image);
     CGContextRestoreGState(context);*/
    
    /*
     NSString *path = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"png"];
     UIImage *img = [UIImage imageWithContentsOfFile:path];
     CGImageRef image = img.CGImage;
     
     CGContextSaveGState(context);
     
     CGAffineTransform myAffine = CGAffineTransformMakeRotation(M_PI);
     myAffine = CGAffineTransformTranslate(myAffine, -img.size.width, -img.size.height);
     CGContextConcatCTM(context, myAffine);
     
     CGContextRotateCTM(context, M_PI);
     CGContextTranslateCTM(context, -img.size.width, -img.size.height);
     
     CGRect touchRect = CGRectMake(0, 0, img.size.width, img.size.height);
     CGContextDrawImage(context, touchRect, image);
     CGContextRestoreGState(context);
     */

}




@end
