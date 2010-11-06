//@+leo-ver=4-thin
//@+node:zorcanda!.20050831213508:@thin NodeUndoerBase.java
//@@language java

import javax.swing.undo.*;
import java.io.*;
import java.util.Vector;

public class NodeUndoerBase extends UndoManager{

    public int indexOfNextAdd = 0;
    
    public int getNextIndex(){
    
        return indexOfNextAdd;
    
    }
    
    public void setNextIndex( int i ){
    
        indexOfNextAdd = i;
    
    }
    
    
    public final Vector<UndoableEdit> getEdits(){
    
        return edits;
    
    
    }
    
            
    public UndoableEdit editToBeUndone(){
    
        return super.editToBeUndone();
    
    }
    
    public UndoableEdit editToBeRedone(){
    
    
        return super.editToBeRedone();
    
    
    }
    
    public void redoTo( final UndoableEdit ue ){
    
        super.redoTo( ue );
    
    }
    
    public void undoTo( final UndoableEdit ue ){
    
        super.undoTo( ue );
    
    }
    
    public void trimEdits( int from, int to ){
    
        super.trimEdits( from, to );
    
    }
    
    public final byte[] serializeSelf(){
    
        try{
        
            final ByteArrayOutputStream baos = new ByteArrayOutputStream();
            final ObjectOutputStream oos = new ObjectOutputStream( baos );
            oos.writeObject( this );
            oos.close();
            byte[] b = baos.toByteArray();
            return b;
        
        }
        catch( final IOException ioe ){
            
            System.out.println( ioe );
            ioe.printStackTrace();
            return new byte[]{};
        
        }
    
    
    
    }


}
//@nonl
//@-node:zorcanda!.20050831213508:@thin NodeUndoerBase.java
//@-leo
