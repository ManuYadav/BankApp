
package bankapp.exception;

/**
 * 
 * Banking Application
 *
 * @file TransferException.java
 * @package bankapp.exception
 * @author Manu Yadav
 * @date 30-Nov-2016
 *
 */
public class TransferException extends Exception {

    public TransferException () { }

    public TransferException (String msg) {
        super(msg);
    } 
}

