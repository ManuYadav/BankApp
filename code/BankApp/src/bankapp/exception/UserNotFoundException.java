
package bankapp.exception;

/**
 * 
 * Banking Application
 *
 * @file UserNotFoundException.java
 * @package bankapp.exception
 * @author Manu Yadav
 * @date 30-Nov-2016
 *
 */
public class UserNotFoundException extends Exception {

    public UserNotFoundException () { }

    public UserNotFoundException (String msg) {
        super(msg);
    } 
}

