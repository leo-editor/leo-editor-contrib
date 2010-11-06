//@+leo-ver=4-thin
//@+node:zorcanda!.20051006102904:@thin TnodeOperations.java
//@@language java



public interface TnodeOperations{



    public void setVisited( Object t );
    public String getTempBodyString( Object t );
    public void setTempBodyString( Object t, String s );
    public boolean hasTempBodyString( Object t );
    public void setDirty( Object t );
    public String getBody( Object t );
    public boolean hasBody( Object t );
    public void insert( Object t, int spot, String s );
    public Object getT( Object v );
    public String getHeadString( Object t );


}
//@nonl
//@-node:zorcanda!.20051006102904:@thin TnodeOperations.java
//@-leo
