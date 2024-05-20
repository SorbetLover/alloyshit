
import openfl.net.URLLoader;
import openfl.net.URLLoaderDataFormat;
import openfl.net.URLRequest;
import sys.io.File;
import sys.io.FileInput;

import sys.Http;

function postCreate(){

        var rawURL:String = "https://raw.githubusercontent.com/SorbetLover/SorbetLover/main/test.txt";

        // Step 2: Fetch the file content
        fetchTextFile(rawURL, onFileLoaded);
    }

    function fetchTextFile(url:String, callback:String->Void):Void
    {
        var request = new Http(url);
        request.onData = function(data:String) {
            callback(data);
        }
        request.onError = function(error) {
            trace("Error loading file: " + error);
        }
        request.request();
    }
//  function onFileLoaded(data:String):Void
//     {
//         // Step 3: Process the file content
//         trace("File content: " + data);

//         // Now you can use the data in your HaxeFlixel code
//     }
   function onFileLoaded(data:String):Void
    {
        // Step 3: Parse the file content
        var lines:Array<String> = data.split("\n");

        // Display each line
        for (line in lines)
        {
            trace("Line: " + line);
            // Here you can process each line as needed
        }
    }

