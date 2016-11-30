
package bankapp.exception;

/**
 * 
 * Banking Application
 *
 * @file BillPaymentException.java
 * @package bankapp.exception
 * @author Manu Yadav
 * @date 30-Nov-2016
 *
 */
public class BillPaymentException extends Exception {

    public BillPaymentException () { }

    public BillPaymentException (String msg) {
        super(msg);
    } 
}

