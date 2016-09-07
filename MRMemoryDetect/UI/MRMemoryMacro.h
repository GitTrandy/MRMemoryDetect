//
//  MRMemoryMacro.h
//  MRMemoryDetectDemo
//
//  Created by 阿迪 on 16/9/6.
//  Copyright © 2016年 北京时趣网络有限公司. All rights reserved.
//

#ifndef MRMemoryMacro_h
#define MRMemoryMacro_h

/** 屏幕高度 */
#define MRMD_SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height

/** 屏幕宽度 */
#define MRMD_SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width

/** 状态栏高度 */
#define MRMD_STATUSBAR_HEIGHT      20.f

/** 导航栏高度 */
#define MRMD_NAVBAR_HEIGHT         (44.f + STATUSBAR_HEIGHT)

/** rect & point */
#define MRMD_Rect(x,y,w,h)         CGRectMake((x),(y),(w),(h))
#define MRMD_Point(x,y)            CGPointMake((x),(y))
#define MRMD_Size(w,h)             CGSizeMake((w),(h))


#endif /* MRMemoryMacro_h */
