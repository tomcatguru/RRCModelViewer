//
//  RRCShaderLines.h
//  RRCModelViewer
//
//  Created by RRC on 1/25/14.
//  Copyright (c) 2014 RendonCepeda. All rights reserved.
//

#import "RRCShader.h"
#import "RRCSceneEngine.h"

@interface RRCShaderLines : RRCShader

// Attribute Handles
@property (assign, nonatomic, readonly) GLint aPosition;

// Uniform Handles
@property (assign, nonatomic, readonly) GLint uProjectionMatrix;
@property (assign, nonatomic, readonly) GLint uModelViewMatrix;

- (void)renderModel:(RRCOpenglesModel *)model inScene:(RRCSceneEngine *)scene;

@end