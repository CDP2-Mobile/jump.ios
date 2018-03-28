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

#import <Foundation/Foundation.h>
#import "JRCaptureObject.h"
#import "JRCaptureTypes.h"
#import "JRNSDate+ISO8601_CaptureDateTimeString.h"

/**
 * @brief A JRConsentsElement object
 **/
@interface JRConsentsElement : JRCaptureObject
@property (nonatomic, copy)     NSString *campaignId; /**< Campaign Id */ 
@property (nonatomic, copy)     JRDateTime *communicationSentAt; /**< The object's \e communicationSentAt property @note A ::JRDateTime property is a property of type \ref typesTable "dateTime" and a typedef of \e NSDate. The accepted format should be an ISO 8601 dateTime string (e.g., <code>yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ</code>) */ 
@property (nonatomic, copy)     JRDateTime *confirmationCommunicationSentAt; /**< The object's \e confirmationCommunicationSentAt property @note A ::JRDateTime property is a property of type \ref typesTable "dateTime" and a typedef of \e NSDate. The accepted format should be an ISO 8601 dateTime string (e.g., <code>yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ</code>) */ 
@property (nonatomic, copy)     JRDateTime *confirmationCommunicationToSendAt; /**< The object's \e confirmationCommunicationToSendAt property @note A ::JRDateTime property is a property of type \ref typesTable "dateTime" and a typedef of \e NSDate. The accepted format should be an ISO 8601 dateTime string (e.g., <code>yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ</code>) */ 
@property (nonatomic, copy)     JRBoolean *confirmationGiven; /**< The object's \e confirmationGiven property @note A ::JRBoolean property is a property of type \ref typesTable "boolean" and a typedef of \e NSNumber. The accepted values can only be <code>[NSNumber numberWithBool:<em>myBool</em>]</code> or <code>nil</code> */ 
@property (nonatomic, copy)     JRDateTime *confirmationStoredAt; /**< The object's \e confirmationStoredAt property @note A ::JRDateTime property is a property of type \ref typesTable "dateTime" and a typedef of \e NSDate. The accepted format should be an ISO 8601 dateTime string (e.g., <code>yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ</code>) */ 
@property (nonatomic, copy)     JRBoolean *given; /**< The object's \e given property @note A ::JRBoolean property is a property of type \ref typesTable "boolean" and a typedef of \e NSNumber. The accepted values can only be <code>[NSNumber numberWithBool:<em>myBool</em>]</code> or <code>nil</code> */ 
@property (nonatomic, copy)     NSString *locale; /**< The object's \e locale property */ 
@property (nonatomic, copy)     NSString *microSiteID; /**< The object's \e microSiteID property */ 
@property (nonatomic, copy)     JRDateTime *storedAt; /**< The object's \e storedAt property @note A ::JRDateTime property is a property of type \ref typesTable "dateTime" and a typedef of \e NSDate. The accepted format should be an ISO 8601 dateTime string (e.g., <code>yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ</code>) */ 

/**
 * @name Constructors
 **/
/*@{*/
/**
 * Default instance constructor. Returns an empty JRConsentsElement object
 *
 * @return
 *   A JRConsentsElement object
 *
 * @note 
 * Method creates a object without the required properties: \e campaignId.
 * These properties are required when updating the object on Capture. That is, you must set them before calling
 * updateOnCaptureForDelegate:context:().
 **/
- (id)init;

/**
 * Default class constructor. Returns an empty JRConsentsElement object
 *
 * @return
 *   A JRConsentsElement object
 *
 * @note 
 * Method creates a object without the required properties: \e campaignId.
 * These properties are required when updating the object on Capture. That is, you must set them before calling
 * updateOnCaptureForDelegate:context:().
 **/
+ (id)consentsElement;

/**
 * Returns a JRConsentsElement object initialized with the given required properties: \c newCampaignId
 *
 * @param newCampaignId
 *   Campaign Id
 *
 * @return
 *   A JRConsentsElement object initialized with the given required properties: \e newCampaignId.
 *   If the required arguments are \e nil or \e [NSNull null], returns \e nil
 **/
- (id)initWithCampaignId:(NSString *)newCampaignId;

/**
 * Returns a JRConsentsElement object initialized with the given required properties: \c campaignId
 *
 * @param campaignId
 *   Campaign Id
 *
 * @return
 *   A JRConsentsElement object initialized with the given required properties: \e campaignId.
 *   If the required arguments are \e nil or \e [NSNull null], returns \e nil
 **/
+ (id)consentsElementWithCampaignId:(NSString *)campaignId;

/*@}*/

/**
 * @name Manage Remotely 
 **/
/*@{*/
/**
 * Use this method to determine if the object or element needs to be updated remotely.
 * That is, if there are local changes to any of the object/elements's properties or
 * sub-objects, then this object will need to be updated on Capture. You can update
 * an object on Capture by using the method updateOnCaptureForDelegate:context:().
 *
 * @return
 * \c YES if this object or any of it's sub-objects have any properties that have changed
 * locally. This does not include properties that are arrays, if any, or the elements contained
 * within the arrays. \c NO if no non-array properties or sub-objects have changed locally.
 *
 * @warning
 * This object, or one of its ancestors, is an element of a plural. If any elements of the plural have changed,
 * (added or removed) the array must be replaced on Capture before the elements or their sub-objects can be
 * updated. Please use the appropriate <code>replace&lt;<em>ArrayName</em>&gt;ArrayOnCaptureForDelegate:context:</code>
 * method first. Even if JRCaptureObject#needsUpdate returns \c YES, this object cannot be updated on Capture unless
 * JRCaptureObject#canBeUpdatedOnCapture also returns \c YES.
 **/
- (BOOL)needsUpdate;

/**
 * TODO: Doxygen doc
 **/
- (void)updateOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate context:(NSObject *)context;
/*@}*/

/**
 * @name Primitive Getters/Setters 
 **/
/*@{*/
/**
 * Returns the primitive boolean value stored in the confirmationGiven property. Will return \c NO if the
 * confirmationGiven is  nil. **/
- (BOOL)getConfirmationGivenBoolValue;

/**
 * Sets the confirmationGiven property to a the primitive boolean value.
 **/
- (void)setConfirmationGivenWithBool:(BOOL)boolVal;

/**
 * Returns the primitive boolean value stored in the given property. Will return \c NO if the
 * given is  nil. **/
- (BOOL)getGivenBoolValue;

/**
 * Sets the given property to a the primitive boolean value.
 **/
- (void)setGivenWithBool:(BOOL)boolVal;
/*@}*/

@end
