#import "LivenessPlugin.h"
@import AAILivenessSDK;
#import "AAILivenessViewController.h"

@interface LivenessPlugin()
@property(nonatomic, copy, nullable) NSArray<NSNumber *> *detectionActions;
@property(nonatomic, strong) FlutterMethodChannel *methodChannel;
@end

@implementation LivenessPlugin

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(livenessDetectionComplete:) name:@"kAAILivenessDetectComplete" object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"kAAILivenessDetectComplete" object:nil];
}

- (void)livenessDetectionComplete:(NSNotification *)notifi {
    NSDictionary *resultInfo = notifi.userInfo;
    
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (rootVC != NULL) {
        [rootVC dismissViewControllerAnimated:YES completion:^{
            if ([resultInfo[@"isSuccess"] boolValue] == YES) {
                [self.methodChannel invokeMethod:@"onDetectionSuccess" arguments:resultInfo];
            } else {
                [self.methodChannel invokeMethod:@"onDetectionFailure" arguments:resultInfo];
            }
        }];
    }
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"liveness_plugin" binaryMessenger:[registrar messenger]];
    LivenessPlugin* instance = [[LivenessPlugin alloc] init];
    instance.methodChannel = channel;
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString *callMethod = call.method;
    if ([@"getPlatformVersion" isEqualToString:callMethod]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if ([@"initSDK" isEqualToString:callMethod]) {
        [self initSDK:call result:result];
    } else if ([@"initSDKOfLicense" isEqualToString:callMethod]) {
        [self initSDKOfLicense:call result:result];
    } else if ([@"setLicenseAndCheck" isEqualToString:callMethod]) {
        [self configLicenseAndCheck:call result:result];
    } else if ([@"startLivenessDetection" isEqualToString:callMethod]) {
        [self startLivenessDetection];
    } else if ([@"setActionSequence" isEqualToString:callMethod]) {
        [self configActionSequence:call result:result];
    } else if ([@"bindUser" isEqualToString:callMethod]) {
        [self configUserId:call result:result];
    } else if ([@"getSDKVersion" isEqualToString:callMethod]) {
        result([AAILivenessSDK sdkVersion]);
    } else if ([@"getLatestDetectionResult" isEqualToString:callMethod]) {
        result(FlutterMethodNotImplemented);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)initSDK:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *params = call.arguments;
    if (params == NULL) {
        result([FlutterError errorWithCode:@"ERROR_NULL" message:@"call.arguments is NULL" details:nil]);
        return;
    }
    
    NSString *marketStr = params[@"market"];
    if (marketStr == NULL) {
        result([FlutterError errorWithCode:@"ERROR_NULL" message:@"market is NULL" details:nil]);
        return;
    }
    
    NSInteger market = [self marketOfValue:marketStr];
    if (market < 0) {
        NSString *errorMsg = [NSString stringWithFormat:@"Market %@ is not support on iOS", marketStr];
        result([FlutterError errorWithCode:@"ERROR_MARKET" message:errorMsg details:nil]);
        return;
    }
    
    NSString *accessKey = params[@"accessKey"];
    NSString *secretKey = params[@"secretKey"];
    if (accessKey == NULL || secretKey == NULL) {
        result([FlutterError errorWithCode:@"ERROR_KEY" message:@"accessKey or secretKey is NULL" details:nil]);
        return;
    }
    [AAILivenessSDK initWithAccessKey:accessKey secretKey:secretKey market:(AAILivenessMarket)market];
}

- (void)initSDKOfLicense:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *params = call.arguments;
    if (params == NULL) {
        result([FlutterError errorWithCode:@"ERROR_NULL" message:@"call.arguments is NULL" details:nil]);
        return;
    }
    
    NSString *marketStr = params[@"market"];
    if (marketStr == NULL) {
        result([FlutterError errorWithCode:@"ERROR_NULL" message:@"market is NULL" details:nil]);
        return;
    }
    
    NSInteger market = [self marketOfValue:marketStr];
    if (market < 0) {
        NSString *errorMsg = [NSString stringWithFormat:@"Market %@ is not support on iOS", marketStr];
        result([FlutterError errorWithCode:@"ERROR_MARKET" message:errorMsg details:nil]);
        return;
    }
    
    [AAILivenessSDK initWithMarket:(AAILivenessMarket)market];
}

- (void)startLivenessDetection {
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (rootVC != NULL) {
        AAILivenessViewController *livenessVC = [[AAILivenessViewController alloc] init];
        
        if (self.detectionActions != NULL && self.detectionActions.count > 0) {
            livenessVC.detectionActions = self.detectionActions;
        }
        
        UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:livenessVC];
        navc.navigationBarHidden = YES;
        [rootVC presentViewController:navc animated:YES completion:nil];
    }
}

- (void)configActionSequence:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *params = call.arguments;
    if (params == NULL) {
        result([FlutterError errorWithCode:@"ERROR_NULL" message:@"call.arguments is NULL" details:nil]);
        return;
    }
    
    NSArray<NSString *> *actionSequence = params[@"actionSequence"];
    if (actionSequence == NULL) {
        result([FlutterError errorWithCode:@"ERROR_ACTION_SEQUENCE" message:@"actionSequence is NULL" details:nil]);
        return;
    }
    
    NSNumber *shuffleObj = params[@"shuffle"];
    if (shuffleObj == NULL) {
        result([FlutterError errorWithCode:@"ERROR_SHUFFLE" message:@"shuffle is NULL" details:nil]);
        return;
    }
    
    NSMutableArray<NSNumber *> *actionTypeList = [[NSMutableArray alloc] init];
    for (NSString *actionStr in actionSequence) {
        NSInteger actionType = [self actionOfValue:actionStr];
        if (actionType < 0) {
            NSString *errorMsg = [NSString stringWithFormat:@"Action %@ is not support", actionStr];
            result([FlutterError errorWithCode:@"ERROR_ACTION" message:errorMsg details:nil]);
            return;
        } else {
            [actionTypeList addObject:@(actionType)];
        }
    }
    
    // Random index array
    BOOL shuffle = [shuffleObj boolValue];
    if (shuffle) {
        NSUInteger idx = actionTypeList.count - 1;
        while (idx) {
            [actionTypeList exchangeObjectAtIndex:idx withObjectAtIndex:arc4random_uniform((uint32_t)idx)];
            idx--;
        }
    }
    
    self.detectionActions = [actionTypeList copy];
}

- (void)configLicenseAndCheck:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *params = call.arguments;
    if (params == NULL) {
        result([FlutterError errorWithCode:@"ERROR_NULL" message:@"call.arguments is NULL" details:nil]);
        return;
    }
    
    NSString *licenseStr = params[@"license"];
    if (licenseStr == NULL) {
        result(@"ERROR_NULL: license is null");
        return;
    }
    
    NSString *checkResult = [AAILivenessSDK configLicenseAndCheck:licenseStr];
    result(checkResult);
}

- (void)configUserId:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *params = call.arguments;
    if (params == NULL) {
        result([FlutterError errorWithCode:@"ERROR_NULL" message:@"call.arguments is NULL" details:nil]);
        return;
    }
    NSString *userId = params[@"userId"];
    if (userId) {
        [AAILivenessSDK configUserId: userId];
    }
}

- (NSInteger)marketOfValue:(NSString *)marketStr {
    NSInteger market = -1;
    if ([marketStr.lowercaseString isEqualToString:@"indonesia"]) {
        market = AAILivenessMarketIndonesia;
    } else if ([marketStr.lowercaseString isEqualToString:@"india"]) {
        market = AAILivenessMarketIndia;
    } else if ([marketStr.lowercaseString isEqualToString:@"philippines"]) {
        market = AAILivenessMarketPhilippines;
    } else if ([marketStr.lowercaseString isEqualToString:@"vietnam"]) {
        market = AAILivenessMarketVietnam;
    } else if ([marketStr.lowercaseString isEqualToString:@"thailand"]) {
        market = AAILivenessMarketThailand;
    } else if ([marketStr.lowercaseString isEqualToString:@"malaysia"]) {
        market = AAILivenessMarketMalaysia;
    }
    
    return market;
}

- (NSInteger)actionOfValue:(NSString *)actionStr {
    NSInteger actionType = -1;
    if ([actionStr.lowercaseString isEqualToString:@"mouth"]) {
        actionType = AAIDetectionTypeMouth;
    } else if ([actionStr.lowercaseString isEqualToString:@"blink"]) {
        actionType = AAIDetectionTypeBlink;
    } else if ([actionStr.lowercaseString isEqualToString:@"pos_yaw"]) {
        actionType = AAIDetectionTypePosYaw;
    }
    
    return actionType;
}

@end
