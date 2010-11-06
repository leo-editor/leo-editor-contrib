//@+leo-ver=4-thin
//@+node:zorcanda!.20051120183113:@thin ColorConfiguration.java
//@@language java
package org.leo.shell.color;

import java.awt.Color;
import java.util.LinkedList;

public class ColorConfiguration{

    public static enum ColorConstant{
    
        Background, Foreground, Promptone,
        Promptonenumber, Prompttwo, Out, Error,
        Outprompt, Outpromptnumber, Popupbackground,
        Popupdoc, Popupcalltip, Keyword, Local, Builtin,
        Convention, Syntax, String
        
    }

    Color _bg;
    Color _fg;
    Color _p1c;
    Color _p1nc;
    Color _p2c;
    Color _outColor;
    Color _errColor;
    Color _outPrompt;
    Color _outPromptNumber;
    Color _popupbg;
    Color _popupdoc;
    Color _popupct;
    Color _kword;
    Color _local;
    Color _builtin;
    Color _convention;
    Color _synColor;
    Color _stringColor;
    LinkedList<ColorConfigurationListener> listeners;
    
    //@    @+others
    //@+node:zorcanda!.20051120194554:ColorConfiguration
    public ColorConfiguration(){
        
        //defaults time!!!
        _bg = Color.BLACK;
        _fg = Color.WHITE;
        _p1c = Color.RED;
        _p1nc = Color.PINK;
        _p2c = Color.GREEN;
        _outColor = Color.WHITE;
        _errColor = Color.RED;
        _outPrompt = Color.decode( "#218429" );
        _outPromptNumber = Color.GREEN;
        _kword = Color.decode( "#299C39" );
        _local = Color.ORANGE;
        _builtin = Color.CYAN;
        _convention = Color.decode( "#087B7B" );
        _synColor = Color.RED; 
        _stringColor = Color.YELLOW;
        
        listeners = new LinkedList<ColorConfigurationListener>();
        
    }
    //@nonl
    //@-node:zorcanda!.20051120194554:ColorConfiguration
    //@+node:zorcanda!.20051120201022:registerColorConfigurationListener
    public void registerColorConfigurationListener( ColorConfigurationListener ccl ){
    
        listeners.add( ccl );
    
    
    }
    
    
    public void removeColorConfigurationListener( ColorConfigurationListener ccl ){
    
        if( listeners.contains( ccl ) )
            listeners.remove( ccl );
    
    }
    
    private void fireColorConfigurationEvent( ColorConstant cc ){
    
        ColorEvent ce = new ColorEvent( this, cc );
        for( ColorConfigurationListener ccl: listeners )
            ccl.colorChanged( ce );
    
    }
    //@nonl
    //@-node:zorcanda!.20051120201022:registerColorConfigurationListener
    //@+node:zorcanda!.20051120193253:background
    public Color getBackgroundColor(){
        
        return _bg;
        
    }
        
    public void setBackgroundColor( Color bg ){
        
        _bg = bg;
        fireColorConfigurationEvent( ColorConstant.Background );
        
    }
    //@nonl
    //@-node:zorcanda!.20051120193253:background
    //@+node:zorcanda!.20051120193253.1:foreground
    public Color getForegroundColor(){
    
    
        return _fg;
    
    
    }
    
    public void setForegroundColor( Color fg ){
    
    
        _fg = fg;
        fireColorConfigurationEvent( ColorConstant.Foreground );
    
    }
    //@nonl
    //@-node:zorcanda!.20051120193253.1:foreground
    //@+node:zorcanda!.20051120193253.2:prompt colors
    public Color getPromptOneColor(){
    
        return _p1c;
    
    
    }
    
    public void setPromptOneColor( Color p1c ){
    
        _p1c = p1c;
        fireColorConfigurationEvent( ColorConstant.Promptone );
    
    }
    
    public Color getPromptOneNumberColor(){
    
    
        return _p1nc;
    
    }
    
    public void setPromptOneNumberColor( Color p1nc ){
    
        _p1nc = p1nc;
        fireColorConfigurationEvent( ColorConstant.Promptonenumber );
    
    }
    
    public Color getPromptTwoColor(){
    
        return _p2c;
    
    }
    
    public void setPromptTwoColor( Color p2c ){
    
    
        _p2c = p2c;
        fireColorConfigurationEvent( ColorConstant.Prompttwo );
    
    }
    
    public Color getOutPromptColor(){
    
        return _outPrompt;
    
    
    }
    
    public void setOutPromptColor( Color outPrompt ){
    
    
        _outPrompt = outPrompt;
        fireColorConfigurationEvent( ColorConstant.Outprompt );
    
    
    }
    
    public Color getOutPromptNumberColor(){
    
        return _outPromptNumber;
    
    }
    
    public void setOutPromptNumberColor( Color outPromptNumberColor ){
    
        _outPromptNumber = outPromptNumberColor;
        fireColorConfigurationEvent( ColorConstant.Outpromptnumber );
    
    
    }
    
    
    
    
    //@-node:zorcanda!.20051120193253.2:prompt colors
    //@+node:zorcanda!.20051120193253.3:out and err color
    public Color getOutColor(){
    
        return _outColor;
    
    }
    
    public void setOutColor( Color outColor ){
    
        _outColor = outColor;
        fireColorConfigurationEvent( ColorConstant.Out );
    
    }
    
    public Color getErrColor(){
    
    
        return _errColor;
    
    }
    
    public void setErrColor( Color errColor ){
    
     _errColor = errColor;   
     fireColorConfigurationEvent( ColorConstant.Error );
    
    }
    //@-node:zorcanda!.20051120193253.3:out and err color
    //@+node:zorcanda!.20051120193956:calltip
    public Color getCalltipBackground(){
    
        return _popupbg;
    
    
    }
    
    public void setCalltipBackground( Color popupbg ){
    
        _popupbg = popupbg;
        fireColorConfigurationEvent( ColorConstant.Popupbackground );
    
    }
    
    public Color getCalltipDocColor(){
    
        return _popupdoc;
    
    }
    
    public void setCalltipDocColor( Color popupdoc ){
    
        _popupdoc = popupdoc;
        fireColorConfigurationEvent( ColorConstant.Popupdoc );
    
    }
    
    public Color getCalltipColor(){
    
        return _popupct;
    
    }
    
    
    public void setCalltipColor( Color popupct ){
    
    
        _popupct = popupct;
        fireColorConfigurationEvent( ColorConstant.Popupcalltip );
    
    }
    //@nonl
    //@-node:zorcanda!.20051120193956:calltip
    //@+node:zorcanda!.20051120194155:kword
    public Color getKeywordColor(){
    
        return _kword;
    
    }
    
    public void setKeywordColor( Color kword ){
    
        _kword = kword;
        fireColorConfigurationEvent( ColorConstant.Keyword );
    
    }
    //@nonl
    //@-node:zorcanda!.20051120194155:kword
    //@+node:zorcanda!.20051120194155.1:local
    public Color getLocalColor(){
    
        return _local;
    
    }
    
    public void setLocalColor( Color local ){
    
        _local = local;
        fireColorConfigurationEvent( ColorConstant.Local );
    
    }
    //@nonl
    //@-node:zorcanda!.20051120194155.1:local
    //@+node:zorcanda!.20051120194155.2:builtin
    public Color getBuiltinColor(){
    
        return _builtin;
    
    }
    
    public void setBuiltinColor( Color builtin ){
    
        _builtin = builtin;
        fireColorConfigurationEvent( ColorConstant.Builtin );
    
    }
    //@nonl
    //@-node:zorcanda!.20051120194155.2:builtin
    //@+node:zorcanda!.20051120194237:convention
    public Color getConventionColor(){
    
        return _convention;
    
    }
    
    public void setConventionColor( Color convention ){
    
        _convention = convention;
        fireColorConfigurationEvent( ColorConstant.Convention );
    
    }
    //@nonl
    //@-node:zorcanda!.20051120194237:convention
    //@+node:zorcanda!.20051120194328:syntax color
    public Color getSyntaxColor(){
    
        return _synColor;
    
    }
    
    public void setSyntaxColor( Color syntax ){
    
        _synColor = syntax;
        fireColorConfigurationEvent( ColorConstant.Syntax );
    
    }
    //@nonl
    //@-node:zorcanda!.20051120194328:syntax color
    //@+node:zorcanda!.20051120194421:string color
    public Color getStringColor(){
    
        return _stringColor;
    
    }
    
    public void setStringColor( Color string ){
    
        _stringColor = string;
        fireColorConfigurationEvent( ColorConstant.String );
    
    }
    //@nonl
    //@-node:zorcanda!.20051120194421:string color
    //@-others

}
//@nonl
//@-node:zorcanda!.20051120183113:@thin ColorConfiguration.java
//@-leo
