package bankapp.bean.account;
/**
 * 
 * Banking Application
 *
 * @file AccountActivityDetails.java
 * @package bankapp.bean.account
 * @author Manu Yadav
 * @date 30-Nov-2016
 *
 */
public class AccountActivityDetails {
    private int accountId = 0;
    private int customerId = 0;
    private float rem_bal = 0;
    private float amount = 0;
    private String descr = null;
    private String date = null;
    private int activity_id = 0;
    
    /**
     * Stores the Account Activity
     * 
     * @param int accountId
     * @param int customerId
     * @param float rem_bal
     * @param float amount
     * @param String desc
     * @param String date
     */
    public AccountActivityDetails(int accountId, int customerId, float rem_bal, float amount, String descr, String date, int activity_id) {
        this.accountId = accountId;
        this.customerId = customerId;
        this.rem_bal = rem_bal;
        this.amount =  amount;
        this.descr = descr;
        this.date = date;
        this.activity_id = activity_id;
    }

    /**
     * Get the Account ID
     * 
     * @return int
     */
    public int getAccountID() {
        return accountId;
    }

    /**
     * Get the Activity ID
     * 
     * @return int
     */
    public int getActivityID() {
        return activity_id;
    }
    
    /**
     * Get the Customer ID
     * 
     * @return int
     */
    public int getCustomerID() {
        return customerId;
    }
    
    /**
     * Get the balance
     * 
     * @return float
     */
    public float getBalance() {
       return rem_bal;
    }

    /**
     * Get the amount
     * 
     * @return float
     */
    public float getAmount() {
        return amount;
    }

    /**
     * Get the description 
     * 
     * @return desc
     */
    public String getDescription() {
        return descr;
    }

    /**
     * Get the date
     * 
     * @return
     */
    public String getDate() {
        return date;
    }
}

