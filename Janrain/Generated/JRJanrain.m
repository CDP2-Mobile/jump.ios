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



#import "JRCaptureObject+Internal.h"
#import "JRJanrain.h"
#import "debug_log.h"

@interface JRJanrainCloudsearch (JRJanrainCloudsearch_InternalMethods)
+ (id)janrainCloudsearchObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder;
- (BOOL)isEqualToJanrainCloudsearch:(JRJanrainCloudsearch *)otherJanrainCloudsearch;
@end

@interface JRControlFields (JRControlFields_InternalMethods)
+ (id)controlFieldsObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder;
- (BOOL)isEqualToControlFields:(JRControlFields *)otherControlFields;
@end

@interface JRProperties (JRProperties_InternalMethods)
+ (id)propertiesObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder;
- (BOOL)isEqualToProperties:(JRProperties *)otherProperties;
@end

@interface JRJanrain ()
@property BOOL canBeUpdatedOnCapture;
@end

@implementation JRJanrain
{
    JRJanrainCloudsearch *_janrainCloudsearch;
    NSString *_controlField;
    JRControlFields *_controlFields;
    JRProperties *_properties;
}
@synthesize canBeUpdatedOnCapture;

- (JRJanrainCloudsearch *)janrainCloudsearch
{
    return _janrainCloudsearch;
}

- (void)setJanrainCloudsearch:(JRJanrainCloudsearch *)newJanrainCloudsearch
{
    [self.dirtyPropertySet addObject:@"janrainCloudsearch"];

    _janrainCloudsearch = newJanrainCloudsearch;

    [_janrainCloudsearch setAllPropertiesToDirty];
}

- (NSString *)controlField
{
    return _controlField;
}

- (void)setControlField:(NSString *)newControlField
{
    [self.dirtyPropertySet addObject:@"controlField"];

    _controlField = [newControlField copy];
}

- (JRControlFields *)controlFields
{
    return _controlFields;
}

- (void)setControlFields:(JRControlFields *)newControlFields
{
    [self.dirtyPropertySet addObject:@"controlFields"];

    _controlFields = newControlFields;

    [_controlFields setAllPropertiesToDirty];
}

- (JRProperties *)properties
{
    return _properties;
}

- (void)setProperties:(JRProperties *)newProperties
{
    [self.dirtyPropertySet addObject:@"properties"];

    _properties = newProperties;

    [_properties setAllPropertiesToDirty];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath = @"/janrain";
        self.canBeUpdatedOnCapture = YES;

        _janrainCloudsearch = [[JRJanrainCloudsearch alloc] init];
        _controlFields = [[JRControlFields alloc] init];
        _properties = [[JRProperties alloc] init];

        [self.dirtyPropertySet setSet:[self updatablePropertySet]];
    }
    return self;
}

+ (id)janrain
{
    return [[JRJanrain alloc] init];
}

- (NSDictionary*)newDictionaryForEncoder:(BOOL)forEncoder
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:(self.janrainCloudsearch ? [self.janrainCloudsearch newDictionaryForEncoder:forEncoder] : [NSNull null])
                   forKey:@"cloudsearch"];
    [dictionary setObject:(self.controlField ? self.controlField : [NSNull null])
                   forKey:@"controlField"];
    [dictionary setObject:(self.controlFields ? [self.controlFields newDictionaryForEncoder:forEncoder] : [NSNull null])
                   forKey:@"controlFields"];
    [dictionary setObject:(self.properties ? [self.properties newDictionaryForEncoder:forEncoder] : [NSNull null])
                   forKey:@"properties"];

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

+ (id)janrainObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder
{
    if (!dictionary)
        return nil;

    JRJanrain *janrain = [JRJanrain janrain];

    NSSet *dirtyPropertySetCopy = nil;
    if (fromDecoder)
    {
        dirtyPropertySetCopy = [NSSet setWithArray:[dictionary objectForKey:@"dirtyPropertiesSet"]];
        janrain.captureObjectPath = ([dictionary objectForKey:@"captureObjectPath"] == [NSNull null] ?
                                                              nil : [dictionary objectForKey:@"captureObjectPath"]);
    }

    janrain.janrainCloudsearch =
        [dictionary objectForKey:@"cloudsearch"] != [NSNull null] ? 
        [JRJanrainCloudsearch janrainCloudsearchObjectFromDictionary:[dictionary objectForKey:@"cloudsearch"] withPath:janrain.captureObjectPath fromDecoder:fromDecoder] : nil;

    janrain.controlField =
        [dictionary objectForKey:@"controlField"] != [NSNull null] ? 
        [dictionary objectForKey:@"controlField"] : nil;

    janrain.controlFields =
        [dictionary objectForKey:@"controlFields"] != [NSNull null] ? 
        [JRControlFields controlFieldsObjectFromDictionary:[dictionary objectForKey:@"controlFields"] withPath:janrain.captureObjectPath fromDecoder:fromDecoder] : nil;

    janrain.properties =
        [dictionary objectForKey:@"properties"] != [NSNull null] ? 
        [JRProperties propertiesObjectFromDictionary:[dictionary objectForKey:@"properties"] withPath:janrain.captureObjectPath fromDecoder:fromDecoder] : nil;

    if (fromDecoder)
        [janrain.dirtyPropertySet setSet:dirtyPropertySetCopy];
    else
        [janrain.dirtyPropertySet removeAllObjects];

    return janrain;
}

+ (id)janrainObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    return [JRJanrain janrainObjectFromDictionary:dictionary withPath:capturePath fromDecoder:NO];
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [self.dirtyPropertySet copy];

    self.canBeUpdatedOnCapture = YES;

    if (![dictionary objectForKey:@"cloudsearch"] || [dictionary objectForKey:@"cloudsearch"] == [NSNull null])
        self.janrainCloudsearch = nil;
    else if (!self.janrainCloudsearch)
        self.janrainCloudsearch = [JRJanrainCloudsearch janrainCloudsearchObjectFromDictionary:[dictionary objectForKey:@"cloudsearch"] withPath:self.captureObjectPath fromDecoder:NO];
    else
        [self.janrainCloudsearch replaceFromDictionary:[dictionary objectForKey:@"cloudsearch"] withPath:self.captureObjectPath];

    self.controlField =
        [dictionary objectForKey:@"controlField"] != [NSNull null] ? 
        [dictionary objectForKey:@"controlField"] : nil;

    if (![dictionary objectForKey:@"controlFields"] || [dictionary objectForKey:@"controlFields"] == [NSNull null])
        self.controlFields = nil;
    else if (!self.controlFields)
        self.controlFields = [JRControlFields controlFieldsObjectFromDictionary:[dictionary objectForKey:@"controlFields"] withPath:self.captureObjectPath fromDecoder:NO];
    else
        [self.controlFields replaceFromDictionary:[dictionary objectForKey:@"controlFields"] withPath:self.captureObjectPath];

    if (![dictionary objectForKey:@"properties"] || [dictionary objectForKey:@"properties"] == [NSNull null])
        self.properties = nil;
    else if (!self.properties)
        self.properties = [JRProperties propertiesObjectFromDictionary:[dictionary objectForKey:@"properties"] withPath:self.captureObjectPath fromDecoder:NO];
    else
        [self.properties replaceFromDictionary:[dictionary objectForKey:@"properties"] withPath:self.captureObjectPath];

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
}

- (NSSet *)updatablePropertySet
{
    return [NSSet setWithObjects:@"janrainCloudsearch", @"controlField", @"controlFields", @"properties", nil];
}

- (void)setAllPropertiesToDirty
{
    [self.dirtyPropertySet addObjectsFromArray:[[self updatablePropertySet] allObjects]];

}

- (NSDictionary *)snapshotDictionaryFromDirtyPropertySet
{
    NSMutableDictionary *snapshotDictionary =
             [NSMutableDictionary dictionaryWithCapacity:10];

    [snapshotDictionary setObject:[self.dirtyPropertySet copy] forKey:@"janrain"];

    if (self.janrainCloudsearch)
        [snapshotDictionary setObject:[self.janrainCloudsearch snapshotDictionaryFromDirtyPropertySet]
                               forKey:@"janrainCloudsearch"];

    if (self.controlFields)
        [snapshotDictionary setObject:[self.controlFields snapshotDictionaryFromDirtyPropertySet]
                               forKey:@"controlFields"];

    if (self.properties)
        [snapshotDictionary setObject:[self.properties snapshotDictionaryFromDirtyPropertySet]
                               forKey:@"properties"];

    return [NSDictionary dictionaryWithDictionary:snapshotDictionary];
}

- (void)restoreDirtyPropertiesFromSnapshotDictionary:(NSDictionary *)snapshotDictionary
{
    if ([snapshotDictionary objectForKey:@"janrain"])
        [self.dirtyPropertySet addObjectsFromArray:[[snapshotDictionary objectForKey:@"janrain"] allObjects]];

    if ([snapshotDictionary objectForKey:@"janrainCloudsearch"])
        [self.janrainCloudsearch restoreDirtyPropertiesFromSnapshotDictionary:
                    [snapshotDictionary objectForKey:@"janrainCloudsearch"]];

    if ([snapshotDictionary objectForKey:@"controlFields"])
        [self.controlFields restoreDirtyPropertiesFromSnapshotDictionary:
                    [snapshotDictionary objectForKey:@"controlFields"]];

    if ([snapshotDictionary objectForKey:@"properties"])
        [self.properties restoreDirtyPropertiesFromSnapshotDictionary:
                    [snapshotDictionary objectForKey:@"properties"]];

}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dictionary =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"janrainCloudsearch"])
        [dictionary setObject:(self.janrainCloudsearch ?
                              [self.janrainCloudsearch toUpdateDictionary] :
                              [[JRJanrainCloudsearch janrainCloudsearch] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                       forKey:@"cloudsearch"];
    else if ([self.janrainCloudsearch needsUpdate])
        [dictionary setObject:[self.janrainCloudsearch toUpdateDictionary]
                       forKey:@"cloudsearch"];

    if ([self.dirtyPropertySet containsObject:@"controlField"])
        [dictionary setObject:(self.controlField ? self.controlField : [NSNull null]) forKey:@"controlField"];

    if ([self.dirtyPropertySet containsObject:@"controlFields"])
        [dictionary setObject:(self.controlFields ?
                              [self.controlFields toUpdateDictionary] :
                              [[JRControlFields controlFields] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                       forKey:@"controlFields"];
    else if ([self.controlFields needsUpdate])
        [dictionary setObject:[self.controlFields toUpdateDictionary]
                       forKey:@"controlFields"];

    if ([self.dirtyPropertySet containsObject:@"properties"])
        [dictionary setObject:(self.properties ?
                              [self.properties toUpdateDictionary] :
                              [[JRProperties properties] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                       forKey:@"properties"];
    else if ([self.properties needsUpdate])
        [dictionary setObject:[self.properties toUpdateDictionary]
                       forKey:@"properties"];

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


    [dictionary setObject:(self.janrainCloudsearch ?
                          [self.janrainCloudsearch toReplaceDictionary] :
                          [[JRJanrainCloudsearch janrainCloudsearch] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                   forKey:@"cloudsearch"];
    [dictionary setObject:(self.controlField ? self.controlField : [NSNull null]) forKey:@"controlField"];

    [dictionary setObject:(self.controlFields ?
                          [self.controlFields toReplaceDictionary] :
                          [[JRControlFields controlFields] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                   forKey:@"controlFields"];

    [dictionary setObject:(self.properties ?
                          [self.properties toReplaceDictionary] :
                          [[JRProperties properties] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                   forKey:@"properties"];

    [self.dirtyPropertySet removeAllObjects];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (BOOL)needsUpdate
{
    if ([self.dirtyPropertySet count])
         return YES;

    if ([self.janrainCloudsearch needsUpdate])
        return YES;

    if ([self.controlFields needsUpdate])
        return YES;

    if ([self.properties needsUpdate])
        return YES;

    return NO;
}

- (BOOL)isEqualToJanrain:(JRJanrain *)otherJanrain
{
    if (!self.janrainCloudsearch && !otherJanrain.janrainCloudsearch) /* Keep going... */;
    else if (!self.janrainCloudsearch && [otherJanrain.janrainCloudsearch isEqualToJanrainCloudsearch:[JRJanrainCloudsearch janrainCloudsearch]]) /* Keep going... */;
    else if (!otherJanrain.janrainCloudsearch && [self.janrainCloudsearch isEqualToJanrainCloudsearch:[JRJanrainCloudsearch janrainCloudsearch]]) /* Keep going... */;
    else if (![self.janrainCloudsearch isEqualToJanrainCloudsearch:otherJanrain.janrainCloudsearch]) return NO;

    if (!self.controlField && !otherJanrain.controlField) /* Keep going... */;
    else if ((self.controlField == nil) ^ (otherJanrain.controlField == nil)) return NO; // xor
    else if (![self.controlField isEqualToString:otherJanrain.controlField]) return NO;

    if (!self.controlFields && !otherJanrain.controlFields) /* Keep going... */;
    else if (!self.controlFields && [otherJanrain.controlFields isEqualToControlFields:[JRControlFields controlFields]]) /* Keep going... */;
    else if (!otherJanrain.controlFields && [self.controlFields isEqualToControlFields:[JRControlFields controlFields]]) /* Keep going... */;
    else if (![self.controlFields isEqualToControlFields:otherJanrain.controlFields]) return NO;

    if (!self.properties && !otherJanrain.properties) /* Keep going... */;
    else if (!self.properties && [otherJanrain.properties isEqualToProperties:[JRProperties properties]]) /* Keep going... */;
    else if (!otherJanrain.properties && [self.properties isEqualToProperties:[JRProperties properties]]) /* Keep going... */;
    else if (![self.properties isEqualToProperties:otherJanrain.properties]) return NO;

    return YES;
}

- (NSDictionary*)objectProperties
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:@"JRJanrainCloudsearch" forKey:@"janrainCloudsearch"];
    [dictionary setObject:@"NSString" forKey:@"controlField"];
    [dictionary setObject:@"JRControlFields" forKey:@"controlFields"];
    [dictionary setObject:@"JRProperties" forKey:@"properties"];

    return [NSDictionary dictionaryWithDictionary:dictionary];
}

@end
