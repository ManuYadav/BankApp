
package bankapp.exception;

/**
 * 
 * Banking Application
 *
 * @file AccountsNotFoundException.java
 * @package bankapp.exception
 * @author Manu Yadav
 * @date 30-Nov-2016
 *
 */
public class AccountsNotFoundException extends Exception {

    public AccountsNotFoundException () { }

    public AccountsNotFoundException (String msg) {
        super(msg);
    } 
}

