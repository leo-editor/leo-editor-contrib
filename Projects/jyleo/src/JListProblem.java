import javax.swing.*;
import java.awt.*;


public class JListProblem{



    public static void main( String[] args ){
    
        PopupFactory pf = PopupFactory.getSharedInstance();
        Object[] data1 =  new Object[]{ " ", "OOOOoo", "Greeeniesss", "vooodooo", "#%&*1!", "Milk", "moles" };
        Object[] data2 = new Object[]{ "Im not blank", "OOOOoo", "Greeeniesss", "vooodooo", "#%&*1!", "Milk", "moles" };
        Object[] data3 =  new Object[]{ "", "OOOOoo", "Greeeniesss", "vooodooo", "#%&*1!", "Milk", "moles" };
        Object[] data4 =  new Object[]{ "OOOOoo", "", "Greeeniesss", "vooodooo", "", "#%&*1!", "Milk", "moles", "" };
        JList jl1 = new JList( data1 );
        jl1.setVisibleRowCount( 5 );
        JScrollPane jsp1 = new JScrollPane( jl1 );
        Popup pu = pf.getPopup( null, jsp1, 10, 10);
        pu.show();
        
        JList jl2 = new JList( data2 );
        jl2.setVisibleRowCount( 5 );
        JScrollPane jsp2 = new JScrollPane( jl2 );
        Point ss = jsp1.getLocation();
        SwingUtilities.convertPointToScreen( ss, jsp1 );
        Popup pu2 = pf.getPopup( null, jsp2, ss.x + jsp1.getSize().width + 10, 10 ); 
        pu2.show();
    
        JList jl3 = new JList( data3 );
        jl3.setVisibleRowCount( 5 );
        JScrollPane jsp3 = new JScrollPane( jl3 );
        Point ss2 = jsp2.getLocation();
        SwingUtilities.convertPointToScreen( ss2, jsp2 );
        Popup pu3 = pf.getPopup( null, jsp3, ss2.x + jsp2.getSize().width + 10, 10 );
        pu3.show();

        JList jl4 = new JList( data4 );
        jl4.setVisibleRowCount( 5 );
        JScrollPane jsp4 = new JScrollPane( jl4 );
        Point ss3 = jsp3.getLocation();
        SwingUtilities.convertPointToScreen( ss2, jsp3 );
        Popup pu4 = pf.getPopup( null, jsp4, ss2.x + jsp3.getSize().width + 10, 10 );
        pu4.show();
    
    
    }




}