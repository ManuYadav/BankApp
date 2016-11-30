
package bankapp.exception;

/**
 * 
 * Banking Application
 *
 * @file AccountNotFoundException.java
 * @package bankapp.exception
 * @author Manu Yadav
 * @date 30-Nov-2016
 *
 */
public class AccountNotFoundException extends Exception {

    public AccountNotFoundException () { }

    public AccountNotFoundException (String msg) {
        super(msg);
    } 
}

