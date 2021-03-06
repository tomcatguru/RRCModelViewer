//
//  RRCiPhoneViewController.m
//  RRCModelViewer
//
//  Created by Ricardo on 1/18/14.
//  Copyright (c) 2014 RendonCepeda. All rights reserved.
//

#import "RRCiPhoneViewController.h"
#import "RRCColladaParser.h"
#import "RRCOpenglesModel.h"

@interface RRCiPhoneViewController ()

@property (strong, nonatomic, readwrite) RRCOpenglesModel* openglesModel;
@property (strong, nonatomic, readwrite) GLKBaseEffect* effect;

@end

@implementation RRCiPhoneViewController

#pragma mark - View
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@:- viewDidLoad", [self class]);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%@:- viewDidAppear", [self class]);
    
    // Load
    [self loadGlkitView];
    [self loadOpenglesModel];
    [self loadGlkitEffect];
    [self loadGlkitTexture];
    [self loadSceneMatrices];
}

#pragma mark - Load
- (void)loadGlkitView
{
}

- (void)loadOpenglesModel
{
    RRCColladaParser* colladaParser = [[RRCColladaParser alloc] initWithXML:@"Models/mushroom"];
    if([colladaParser didParseXML])
    {
        // Model parsed!
        
        self.openglesModel = [[RRCOpenglesModel alloc] initWithCollada:colladaParser.collada];
        if([self.openglesModel didConvertCollada])
        {
            // Model converted!
        }
    }
}

- (void)loadGlkitEffect
{
    // Initialize
    self.effect = [[GLKBaseEffect alloc] init];
}

- (void)loadGlkitTexture
{
}

- (void)loadSceneMatrices
{
    // Projection matrix
    GLfloat aspectRatio = self.view.bounds.size.width/self.view.bounds.size.height;
    GLfloat fieldOfView = GLKMathDegreesToRadians(90.0);
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(fieldOfView, aspectRatio, 0.1, 10.0);
    self.effect.transform.projectionMatrix = projectionMatrix;
    
    // ModelView matrix
    GLKMatrix4 modelViewMatrix = GLKMatrix4Identity;
    modelViewMatrix = GLKMatrix4Translate(modelViewMatrix, 0.0, -1.5, -5.0);
    modelViewMatrix = GLKMatrix4RotateY(modelViewMatrix, GLKMathDegreesToRadians(200.0));
    modelViewMatrix = GLKMatrix4RotateX(modelViewMatrix, GLKMathDegreesToRadians(-90.0));
    modelViewMatrix = GLKMatrix4Scale(modelViewMatrix, 0.67, 0.67, 0.67);
    self.effect.transform.modelviewMatrix = modelViewMatrix;
}

#pragma mark - Render
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    // Clear view
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
}

@end
