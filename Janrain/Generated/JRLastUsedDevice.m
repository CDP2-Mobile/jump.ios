/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 Copyright (c) 2012, Janrain, Inc.

 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.
 * Neither the name of the Janrain, Inc. nor the names of its
   contributors may be used to endorse or promote products derived from this
   software without specific prior written permission.


 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)


#import "JRCaptureObject+Internal.h"
#import "JRLastUsedDevice.h"

@interface JRLastUsedDevice ()
@property BOOL canBeUpdatedOnCapture;
@end

@implementation JRLastUsedDevice
{
    NSString *_deviceToken;
    NSString *_tokenType;
}
@synthesize canBeUpdatedOnCapture;

- (NSString *)deviceToken
{
    return _deviceToken;
}

- (void)setDeviceToken:(NSString *)newDeviceToken
{
    [self.dirtyPropertySet addObject:@"deviceToken"];

    _deviceToken = [newDeviceToken copy];
}

- (NSString *)tokenType
{
    return _tokenType;
}

- (void)setTokenType:(NSString *)newTokenType
{
    [self.dirtyPropertySet addObject:@"tokenType"];

    _tokenType = [newTokenType copy];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath = @"/lastUsedDevice";
        self.canBeUpdatedOnCapture = YES;


        [self.dirtyPropertySet setSet:[self updatablePropertySet]];
    }
    return self;
}

+ (id)lastUsedDevice
{
    return [[JRLastUsedDevice alloc] init];
}

- (NSDictionary*)newDictionaryForEncoder:(BOOL)forEncoder
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:(self.deviceToken ? self.deviceToken : [NSNull null])
                   forKey:@"deviceToken"];
    [dictionary setObject:(self.tokenType ? self.tokenType : [NSNull null])
                   forKey:@"tokenType"];

    if (forEncoder)
    {
        [dictionary setObject:([self.dirtyPropertySet allObjects] ? [self.dirtyPropertySet allObjects] : [NSArray array])
                       forKey:@"dirtyPropertiesSet"];
        [dictionary setObject:(self.captureObjectPath ? self.captureObjectPath : [NSNull null])
                       forKey:@"captureObjectPath"];
        [dictionary setObject:[NSNumber numberWithBool:self.canBeUpdatedOnCapture]
                       forKey:@"canBeUpdatedOnCapture"];
    }

    return [NSDictionary dictionaryWithDictionary:dictionary];
}

+ (id)lastUsedDeviceObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder
{
    if (!dictionary)
        return nil;

    JRLastUsedDevice *lastUsedDevice = [JRLastUsedDevice lastUsedDevice];

    NSSet *dirtyPropertySetCopy = nil;
    if (fromDecoder)
    {
        dirtyPropertySetCopy = [NSSet setWithArray:[dictionary objectForKey:@"dirtyPropertiesSet"]];
        lastUsedDevice.captureObjectPath = ([dictionary objectForKey:@"captureObjectPath"] == [NSNull null] ?
                                                              nil : [dictionary objectForKey:@"captureObjectPath"]);
    }

    lastUsedDevice.deviceToken =
        [dictionary objectForKey:@"deviceToken"] != [NSNull null] ? 
        [dictionary objectForKey:@"deviceToken"] : nil;

    lastUsedDevice.tokenType =
        [dictionary objectForKey:@"tokenType"] != [NSNull null] ? 
        [dictionary objectForKey:@"tokenType"] : nil;

    if (fromDecoder)
        [lastUsedDevice.dirtyPropertySet setSet:dirtyPropertySetCopy];
    else
        [lastUsedDevice.dirtyPropertySet removeAllObjects];

    return lastUsedDevice;
}

+ (id)lastUsedDeviceObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    return [JRLastUsedDevice lastUsedDeviceObjectFromDictionary:dictionary withPath:capturePath fromDecoder:NO];
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [self.dirtyPropertySet copy];

    self.canBeUpdatedOnCapture = YES;

    self.deviceToken =
        [dictionary objectForKey:@"deviceToken"] != [NSNull null] ? 
        [dictionary objectForKey:@"deviceToken"] : nil;

    self.tokenType =
        [dictionary objectForKey:@"tokenType"] != [NSNull null] ? 
        [dictionary objectForKey:@"tokenType"] : nil;

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
}

- (NSSet *)updatablePropertySet
{
    return [NSSet setWithObjects:@"deviceToken", @"tokenType", nil];
}

- (void)setAllPropertiesToDirty
{
    [self.dirtyPropertySet addObjectsFromArray:[[self updatablePropertySet] allObjects]];

}

- (NSDictionary *)snapshotDictionaryFromDirtyPropertySet
{
    NSMutableDictionary *snapshotDictionary =
             [NSMutableDictionary dictionaryWithCapacity:10];

    [snapshotDictionary setObject:[self.dirtyPropertySet copy] forKey:@"lastUsedDevice"];

    return [NSDictionary dictionaryWithDictionary:snapshotDictionary];
}

- (void)restoreDirtyPropertiesFromSnapshotDictionary:(NSDictionary *)snapshotDictionary
{
    if ([snapshotDictionary objectForKey:@"lastUsedDevice"])
        [self.dirtyPropertySet addObjectsFromArray:[[snapshotDictionary objectForKey:@"lastUsedDevice"] allObjects]];

}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dictionary =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"deviceToken"])
        [dictionary setObject:(self.deviceToken ? self.deviceToken : [NSNull null]) forKey:@"deviceToken"];

    if ([self.dirtyPropertySet containsObject:@"tokenType"])
        [dictionary setObject:(self.tokenType ? self.tokenType : [NSNull null]) forKey:@"tokenType"];

    [self.dirtyPropertySet removeAllObjects];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (void)updateOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate context:(NSObject *)context
{
    [super updateOnCaptureForDelegate:delegate context:context];
}

- (NSDictionary *)toReplaceDictionary
{
    NSMutableDictionary *dictionary =
         [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:(self.deviceToken ? self.deviceToken : [NSNull null]) forKey:@"deviceToken"];
    [dictionary setObject:(self.tokenType ? self.tokenType : [NSNull null]) forKey:@"tokenType"];

    [self.dirtyPropertySet removeAllObjects];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (BOOL)needsUpdate
{
    if ([self.dirtyPropertySet count])
         return YES;

    return NO;
}

- (BOOL)isEqualToLastUsedDevice:(JRLastUsedDevice *)otherLastUsedDevice
{
    if (!self.deviceToken && !otherLastUsedDevice.deviceToken) /* Keep going... */;
    else if ((self.deviceToken == nil) ^ (otherLastUsedDevice.deviceToken == nil)) return NO; // xor
    else if (![self.deviceToken isEqualToString:otherLastUsedDevice.deviceToken]) return NO;

    if (!self.tokenType && !otherLastUsedDevice.tokenType) /* Keep going... */;
    else if ((self.tokenType == nil) ^ (otherLastUsedDevice.tokenType == nil)) return NO; // xor
    else if (![self.tokenType isEqualToString:otherLastUsedDevice.tokenType]) return NO;

    return YES;
}

- (NSDictionary*)objectProperties
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:@"NSString" forKey:@"deviceToken"];
    [dictionary setObject:@"NSString" forKey:@"tokenType"];

    return [NSDictionary dictionaryWithDictionary:dictionary];
}

@end
