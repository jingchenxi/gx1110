
package com.rl.ecps.stub;

import javax.xml.ws.WebFault;


/**
 * This class was generated by Apache CXF 2.4.2
 * 2018-06-27T22:53:20.921+08:00
 * Generated source version: 2.4.2
 */

@WebFault(name = "IOException", targetNamespace = "http://service.ws.ecps.rl.com/")
public class IOException_Exception extends Exception {
    
    private com.rl.ecps.stub.IOException ioException;

    public IOException_Exception() {
        super();
    }
    
    public IOException_Exception(String message) {
        super(message);
    }
    
    public IOException_Exception(String message, Throwable cause) {
        super(message, cause);
    }

    public IOException_Exception(String message, com.rl.ecps.stub.IOException ioException) {
        super(message);
        this.ioException = ioException;
    }

    public IOException_Exception(String message, com.rl.ecps.stub.IOException ioException, Throwable cause) {
        super(message, cause);
        this.ioException = ioException;
    }

    public com.rl.ecps.stub.IOException getFaultInfo() {
        return this.ioException;
    }
}
