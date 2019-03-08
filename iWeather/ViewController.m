//
//  ViewController.m
//  iWeather
//
//  Created by Kapok Capital on 3/7/19.
//  Copyright © 2019 LPN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *temperatureType;
@property (nonatomic) BOOL isCelcius;
@property (nonatomic) float celcius;

@end

@implementation ViewController {
    NSArray *quotes;
    NSArray *locations;
    NSArray *photoIcons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc", @"Đi một ngày đàng học một sàng khôn"];
    
    locations = @[@"Hai Ba Trung, Hanoi", @"Sydney, Australia", @"New York, USA"];
    
    photoIcons = @[@"Rain", @"Sunny", @"Thunder", @"Windy"];
    self.isCelcius = YES;
    [self updateWeather:nil];
}

- (IBAction)changeTemperature:(id)sender {
    if (self.isCelcius) {
        self.isCelcius = NO;
        self.temperatureType.text = @"F";
    } else {
        self.isCelcius = YES;
        self.temperatureType.text = @"C";
    }
    [self formatTemperature];
}

- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int weatherIconIndex = arc4random_uniform(photoIcons.count);
    self.weatherIcon.image = [UIImage imageNamed:photoIcons[weatherIconIndex]];
    [self randomTemperature];
    [self formatTemperature];
    
}

- (void) randomTemperature {
    float celciusTemperature = 14.0 + arc4random_uniform(18) + (float)arc4random() / (float)INT32_MAX;
    self.celcius = celciusTemperature;
}

- (void) formatTemperature {
    if (self.isCelcius) {
        [self.temperature setTitle:[NSString stringWithFormat:@"%2.1f", self.celcius] forState:UIControlStateNormal];
    } else {
        float fahreinheit = self.celcius * (9 / 5) + 32;
        [self.temperature setTitle:[NSString stringWithFormat:@"%2.1f", fahreinheit] forState:UIControlStateNormal];
    }
}

@end
