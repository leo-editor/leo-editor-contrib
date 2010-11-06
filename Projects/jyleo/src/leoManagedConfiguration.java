//@+leo-ver=4-thin
//@+node:zorcanda!.20050529180331:@thin leoManagedConfiguration.java
//@@language java

import javax.management.*;


public class leoManagedConfiguration extends NotificationBroadcasterSupport implements leoManagedConfigurationMBean{

    String _name;
    String _value;
    long sn;
    
    public leoManagedConfiguration( String name, String value ){
    
        _name = name;
        _value = value;
        sn = 0;
    }
    
    public String getName(){ return _name; }
    public void setName( String name ){ _name = name; }
    public String getValue(){ return _value; }
    public void setValue( String value ){
    
        _value = value;
        Notification notify = new Notification( "config change", this , sn++ );
        sendNotification( notify );
     
    }



}
//@nonl
//@-node:zorcanda!.20050529180331:@thin leoManagedConfiguration.java
//@-leo
