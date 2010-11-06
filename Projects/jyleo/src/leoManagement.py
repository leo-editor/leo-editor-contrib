#@+leo-ver=4-thin
#@+node:zorcanda!.20050529141420:@thin leoManagement.py
#@@language python

import javax.management as jmanage
import leoManagedConfiguration
import leoManagedConfigurationMBean


class leoManagement:
       '''leoManagement is the mechanism by which behaviors
       can be modified at runtime.  It is seperate from
       configuration in that configuration can alter behaviors
       but configuration is not the sole alterer of behaviors'''
       
       
       #@       @+others
       #@+node:zorcanda!.20050529141420.1:__init__
       def __init__( self ):
           
           self.mbserver = jmanage.MBeanServerFactory.createMBeanServer()
           
       #@-node:zorcanda!.20050529141420.1:__init__
       #@+node:zorcanda!.20050529160738:addNotificationDef
       def addNotificationDef( self, name, method ):
           
           nd = self.NotificationDef( method )
           on = jmanage.ObjectName( "MBean", "name", name )
           self.mbserver.addNotificationListener( on, nd, None, None )
           
       
       #@-node:zorcanda!.20050529160738:addNotificationDef
       #@+node:zorcanda!.20050529160738.1:class NotificationDef
       class NotificationDef( jmanage.NotificationListener ):
           
           def __init__( self, method ):
               self.method = method
               
           def handleNotification( self, notification, handback ):
               self.method( notification, handback )
               
       #@-node:zorcanda!.20050529160738.1:class NotificationDef
       #@+node:zorcanda!.20050529161650:addMBeanForProperty
       def addMBeanForConfig( self, name, value ):
           
           if not name: return
           if name.find( ":" ):
               names = name.split( ":" )
               name = ' '.join( names )
               
           impl = leoManagedConfiguration( name, str( value ) )
           on = jmanage.ObjectName(  "MBean", "name", name )
           if not self.mbserver.isRegistered( on ):
               self.mbserver.registerMBean( impl, on )
           else:
               print on
                
       
       
       #@-node:zorcanda!.20050529161650:addMBeanForProperty
       #@+node:zorcanda!.20050529161916:class leoMC
       class leoMC( leoManagedConfigurationMBean , jmanage.NotificationBroadcasterSupport ):
           
           def __init__( self, name, value ):
               jmanage.NotificationBroadcasterSupport.__init__( self )
               self._name = name
               self._value = value
                   
           def setValue( self, value ):
               self._value = value
               
           def getValue( self ):
               return self._value
               
           def getName( self ):
               return self._name
               
           def setName( self, name ):
               self._name = name
               
           def createMBeanInfo( self ):
               
               import jarray
               mmbai = jarray.zeros( 2, jmanage.modelmbean.ModelMBeanAttributeInfo )
               mmbai[ 0 ] = jmanage.modelmbean.ModelMBeanAttributeInfo( "Value", "java.lang.String", "what is the value", 1, 1, 0 )
               mmbai[ 1 ] = jmanage.modelmbean.ModelMBeanAttributeInfo( "Name", "java.lang.String", "what is the name", 1,1, 0 )
               
               mmboi = jarray.zeros( 0, jmanage.modelmbean.ModelMBeanOperationInfo )
               mmbci = jarray.zeros( 0, jmanage.modelmbean.ModelMBeanConstructorInfo )
               mmis = jmanage.modelmbean.ModelMBeanInfoSupport( str( self.__class__ ), 'support', mmbai, mmbci, mmboi, None )
               return mmis
       #@nonl
       #@-node:zorcanda!.20050529161916:class leoMC
       #@-others
       
#@-node:zorcanda!.20050529141420:@thin leoManagement.py
#@-leo
