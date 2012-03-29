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


#import "JRProfilePhotos.h"

@implementation JRProfilePhotos
{
    NSInteger _profilePhotosId;
    BOOL _primary;
    NSString *_type;
    NSString *_value;
}
@dynamic profilePhotosId;
@dynamic primary;
@dynamic type;
@dynamic value;

- (NSInteger)profilePhotosId
{
    return _profilePhotosId;
}

- (void)setProfilePhotosId:(NSInteger)newProfilePhotosId
{
    [self.dirtyPropertySet addObject:@"profilePhotosId"];
    _profilePhotosId = newProfilePhotosId;
}

- (BOOL)primary
{
    return _primary;
}

- (void)setPrimary:(BOOL)newPrimary
{
    [self.dirtyPropertySet addObject:@"primary"];
    _primary = newPrimary;
}

- (NSString *)type
{
    return _type;
}

- (void)setType:(NSString *)newType
{
    [self.dirtyPropertySet addObject:@"type"];
    _type = [newType copy];
}

- (NSString *)value
{
    return _value;
}

- (void)setValue:(NSString *)newValue
{
    [self.dirtyPropertySet addObject:@"value"];
    _value = [newValue copy];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath = @"/profiles/profile/profilePhotos";
    }
    return self;
}

+ (id)profilePhotos
{
    return [[[JRProfilePhotos alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{ // TODO: SHOULD PROBABLY NOT REQUIRE REQUIRED FIELDS
    JRProfilePhotos *profilePhotosCopy =
                [[JRProfilePhotos allocWithZone:zone] init];

    profilePhotosCopy.profilePhotosId = self.profilePhotosId;
    profilePhotosCopy.primary = self.primary;
    profilePhotosCopy.type = self.type;
    profilePhotosCopy.value = self.value;

    [profilePhotosCopy.dirtyPropertySet removeAllObjects];
    [profilePhotosCopy.dirtyPropertySet setSet:self.dirtyPropertySet];

    return profilePhotosCopy;
}

- (NSDictionary*)toDictionary
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:[NSNumber numberWithInt:self.profilePhotosId]
             forKey:@"id"];
    [dict setObject:[NSNumber numberWithBool:self.primary]
             forKey:@"primary"];
    [dict setObject:(self.type ? self.type : [NSNull null])
             forKey:@"type"];
    [dict setObject:(self.value ? self.value : [NSNull null])
             forKey:@"value"];

    return dict;
}

+ (id)profilePhotosObjectFromDictionary:(NSDictionary*)dictionary
{
    JRProfilePhotos *profilePhotos = [JRProfilePhotos profilePhotos];

    profilePhotos.profilePhotosId =
        [dictionary objectForKey:@"id"] != [NSNull null] ? 
        [(NSNumber*)[dictionary objectForKey:@"id"] intValue] : 0;

    profilePhotos.primary =
        [dictionary objectForKey:@"primary"] != [NSNull null] ? 
        [(NSNumber*)[dictionary objectForKey:@"primary"] boolValue] : 0;

    profilePhotos.type =
        [dictionary objectForKey:@"type"] != [NSNull null] ? 
        [dictionary objectForKey:@"type"] : nil;

    profilePhotos.value =
        [dictionary objectForKey:@"value"] != [NSNull null] ? 
        [dictionary objectForKey:@"value"] : nil;

    [profilePhotos.dirtyPropertySet removeAllObjects];
    
    return profilePhotos;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"id"])
        _profilePhotosId = [dictionary objectForKey:@"id"] != [NSNull null] ? 
            [(NSNumber*)[dictionary objectForKey:@"id"] intValue] : 0;

    if ([dictionary objectForKey:@"primary"])
        _primary = [dictionary objectForKey:@"primary"] != [NSNull null] ? 
            [(NSNumber*)[dictionary objectForKey:@"primary"] boolValue] : 0;

    if ([dictionary objectForKey:@"type"])
        _type = [dictionary objectForKey:@"type"] != [NSNull null] ? 
            [dictionary objectForKey:@"type"] : nil;

    if ([dictionary objectForKey:@"value"])
        _value = [dictionary objectForKey:@"value"] != [NSNull null] ? 
            [dictionary objectForKey:@"value"] : nil;
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary
{
    _profilePhotosId =
        [dictionary objectForKey:@"id"] != [NSNull null] ? 
        [(NSNumber*)[dictionary objectForKey:@"id"] intValue] : 0;

    _primary =
        [dictionary objectForKey:@"primary"] != [NSNull null] ? 
        [(NSNumber*)[dictionary objectForKey:@"primary"] boolValue] : 0;

    _type =
        [dictionary objectForKey:@"type"] != [NSNull null] ? 
        [dictionary objectForKey:@"type"] : nil;

    _value =
        [dictionary objectForKey:@"value"] != [NSNull null] ? 
        [dictionary objectForKey:@"value"] : nil;
}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"primary"])
        [dict setObject:(self.primary ? [NSNumber numberWithBool:self.primary] : [NSNull null]) forKey:@"primary"];

    if ([self.dirtyPropertySet containsObject:@"type"])
        [dict setObject:(self.type ? self.type : [NSNull null]) forKey:@"type"];

    if ([self.dirtyPropertySet containsObject:@"value"])
        [dict setObject:(self.value ? self.value : [NSNull null]) forKey:@"value"];

    return dict;
}

- (void)updateObjectOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    NSDictionary *newContext = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     self, @"captureObject",
                                                     delegate, @"delegate",
                                                     context, @"callerContext", nil];

    [JRCaptureInterface updateCaptureObject:[self toUpdateDictionary]
                                     withId:_profilePhotosId
                                     atPath:self.captureObjectPath
                                  withToken:[JRCaptureData accessToken]
                                forDelegate:self
                                withContext:newContext];
}

- (NSDictionary *)toReplaceDictionary
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:(self.primary ? [NSNumber numberWithBool:self.primary] : [NSNull null]) forKey:@"primary"];
    [dict setObject:(self.type ? self.type : [NSNull null]) forKey:@"type"];
    [dict setObject:(self.value ? self.value : [NSNull null]) forKey:@"value"];

    return dict;
}

- (void)replaceObjectOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    NSDictionary *newContext = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     self, @"captureObject",
                                                     delegate, @"delegate",
                                                     context, @"callerContext", nil];

    [JRCaptureInterface replaceCaptureObject:[self toReplaceDictionary]
                                      withId:_profilePhotosId
                                      atPath:self.captureObjectPath
                                   withToken:[JRCaptureData accessToken]
                                 forDelegate:self
                                 withContext:newContext];
}

- (void)dealloc
{
    [_type release];
    [_value release];

    [super dealloc];
}
@end
