//
//  grid.m
//  GameOfLife
//
//  Created by MikeBook on 12/22/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "grid.h"
#import "Creature.h"

//these are variables that cannot be changed
static const int  GRID_ROWS = 8;
static const int GRID_COLUMNS = 10;

@implementation grid{
    
NSMutableArray *_gridArray;
float _cellWidth;
float _cellHeight;
    
}

-(void)onEnter {
    [super onEnter];
    
    [self setupGrid];
    
    //accept touches on the grid;
    self.userInteractionEnabled = YES;
}

-(void)setupGrid{
    //divide the grids size by the number of columns/rows to figure out the right width and hieght of each cell
    _cellWidth = self.contentSize.width/GRID_COLUMNS;
    _cellHeight = self.contentSize.height/GRID_ROWS;
    
    float x = 0;
    float y = 0;
    
    //intitalize array as blank mutable array (because ns array cannot be changed after initialization)
    _gridArray = [NSMutableArray array];
    
    //initalize creatures
    for( int i =0 ; i < GRID_ROWS; i++){
        //this is how to create 2d arrays in objective c,, arrays in arrays
        _gridArray[i] = [NSMutableArray array];
        x=0;
        for(int j =0; j < GRID_COLUMNS;j++){
            Creature *creature = [[Creature alloc]init];
            creature.anchorPoint = ccp(0,0);
            creature.position = ccp(x,y);
            [self addChild:creature];
            //shorthand access to array inside array or 2d array
            _gridArray[i][j] = creature;
            
            //make creatures visible to this method, remove once the grid is properly filled;
            creature.isAlive = YES;
            x+=_cellWidth;
            
        }
        y+= _cellHeight;
    }
}

@end
