
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
public class TransferAccountNotFoundException extends Exception {

    public TransferAccountNotFoundException () { }

    public TransferAccountNotFoundException (String msg) {
        super(msg);
    } 
}

