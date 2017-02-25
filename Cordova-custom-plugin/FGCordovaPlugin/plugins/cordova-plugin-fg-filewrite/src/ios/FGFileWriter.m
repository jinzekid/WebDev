/********* FGFileWriter.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface FGFileWriter : CDVPlugin {
  // Member variables go here.
}
// This will return the file contents in a JSON object via the getFileContents utility method
- (void) cordovaGetFileContents:(CDVInvokedUrlCommand *)command;

// This will accept a String and call setFileContents to persist the String on to disk
- (void) cordovaSetFileContents:(CDVInvokedUrlCommand *)command;

#pragma mark - Util_Methods

// Pure native code to persist data
- (void) setFileContents;

// Native code to load data from disk and return the String.
- (NSString *) getFileContents;

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation FGFileWriter

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) cordovaGetFileContents:(CDVInvokedUrlCommand *)command {
  
  // Retrieve the date String from the file via a utility method
  NSString *dateStr = [self getFileContents];
  
  // Create an object that will be serialized into a JSON object.
  // This object contains the date String contents and a success property.
  NSDictionary *jsonObj = [ [NSDictionary alloc]
                           initWithObjectsAndKeys :
                           dateStr, @"dateStr",
                           @"true", @"success",
                           nil
                           ];
  
  // Create an instance of CDVPluginResult, with an OK status code.
  // Set the return message as the Dictionary object (jsonObj)...
  // ... to be serialized as JSON in the browser
  CDVPluginResult *pluginResult = [ CDVPluginResult
                                   resultWithStatus    : CDVCommandStatus_OK
                                   messageAsDictionary : jsonObj
                                   ];
  
  // Execute sendPluginResult on this plugin's commandDelegate, passing in the ...
  // ... instance of CDVPluginResult
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) cordovaSetFileContents:(CDVInvokedUrlCommand *)command {
  // Retrieve the JavaScript-created date String from the CDVInvokedUrlCommand instance.
  // When we implement the JavaScript caller to this function, we'll see how we'll
  // pass an array (command.arguments), which will contain a single String.
  NSString *dateStr = [command.arguments objectAtIndex:0];
  
  // We call our setFileContents utility method, passing in the date String
  // retrieved from the command.arguments array.
  [self setFileContents: dateStr];
  
  // Create an object with a simple success property.
  NSDictionary *jsonObj = [ [NSDictionary alloc]
                           initWithObjectsAndKeys :
                           @"true", @"success",
                           nil
                           ];
  
  CDVPluginResult *pluginResult = [ CDVPluginResult
                                   resultWithStatus    : CDVCommandStatus_OK
                                   messageAsDictionary : jsonObj
                                   ];
  
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

#pragma mark - Util_Methods
// Dives into the file system and writes the file contents.
// Notice fileContents as the first argument, which is of type NSString
- (void) setFileContents:(NSString *)fileContents {
  
  // Create an array of directory Paths, to allow us to get the documents directory
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  
  // The documents directory is the first item
  NSString *documentsDirectory = [paths objectAtIndex:0];
  
  // Create a string that prepends the documents directory path to a text file name
  // using NSString's stringWithFormat method.
  NSString *fileName = [NSString stringWithFormat:@"%@/myTextFile.txt", documentsDirectory];
  
  // Here we save contents to disk by executing the writeToFile method of
  // the fileContents String, which is the first argument to this function.
  [fileContents writeToFile : fileName
                atomically  : NO
                encoding    : NSStringEncodingConversionAllowLossy
                error       : nil];
}

//Dives into the file system and returns contents of the file
- (NSString *) getFileContents{
  
  // These next three lines should be familiar to you.
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  
  NSString *documentsDirectory = [paths objectAtIndex:0];
  
  NSString *fileName = [NSString stringWithFormat:@"%@/myTextFile.txt", documentsDirectory];
  
  // Allocate a string and initialize it with the contents of the file via
  // the initWithContentsOfFile instance method.
  NSString *fileContents = [[NSString alloc]
                            initWithContentsOfFile : fileName
                            usedEncoding           : nil
                            error                  : nil
                            ];
  
  // Return the file contents String to the caller (cordovaGetFileContents)
  return fileContents;
}
@end
