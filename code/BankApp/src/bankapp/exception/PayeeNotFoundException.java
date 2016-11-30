
package bankapp.exception;

/**
 * 
 * Banking Application
 *
 * @file PayeeNotFoundException.java
 * @package bankapp.exception
 * @author Manu Yadav
 * @date 30-Nov-2016
 *
 */
public class PayeeNotFoundException extends Exception {

    public PayeeNotFoundException () { }

    public PayeeNotFoundException (String msg) {
        super(msg);
    } 
}

