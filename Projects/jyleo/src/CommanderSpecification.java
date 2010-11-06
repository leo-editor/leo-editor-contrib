//@+leo-ver=4-thin
//@+node:orkman.20050219185401:@thin CommanderSpecification.java
//@@language java
import java.util.Map;


public interface CommanderSpecification{


    public PositionSpecification currentPosition();
    public PositionSpecification rootPosition(); 
    public PositionSpecification nullPosition();
    
    //--had to be added
    
    public Integer acquirePage_width();
    public Integer acquireTab_width();
    public String acquireTarget_language();
    public String acquireDefault_derived_file_encoding();
    public String acquireOutputNewline();
    public String acquireOs_path_dirname( String name );
    public Boolean g_os_path_isabs( String dir );
    public Boolean g_os_path_exists( String dir );
    public String g_makeAllNonExistentDirectories( String dir );
    public Map g_get_directives_dict( String s );
    public String g_getBaseDirectory();
    public String g_os_path_join( String base, String path );
    public String g_scanAtEncodingDirective( String s, Map theDict );
    public String g_scanAtLineendingDirective( String s, Map theDict);
    public Integer g_scanAtPagewidthDirective( String s,Map theDict, boolean issue_error_flag);
    public Integer g_scanAtTabwidthDirective( String s,Map theDict, boolean issue_error_flag);
    public Object g_fileLikeObject();
    public Boolean g_isValidEncoding( String encoding );
    public String[] g_set_language( String language, Integer k );
    public void g_trace();
    public Boolean hasFrame();
    public String acquireTangle_directory();
    public String acquireFrOpenDirectory();
    public String acquireOpenDirectory();
    public void beginUpdate();
    public void endUpdate();
    public void setChanged( Boolean changed );
    public void setChanged2( Boolean changed );





}
//@nonl
//@-node:orkman.20050219185401:@thin CommanderSpecification.java
//@-leo
