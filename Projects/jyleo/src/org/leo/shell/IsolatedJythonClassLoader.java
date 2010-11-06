//@+leo-ver=4-thin
//@+node:zorcanda!.20051114092424.105:@thin IsolatedJythonClassLoader.java
//@@language java
package org.leo.shell;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;

public class IsolatedJythonClassLoader extends ClassLoader{

    final static Map<String, byte[]> classes = new HashMap< String, byte[] >();
    final static ScheduledThreadPoolExecutor ses = new ScheduledThreadPoolExecutor( 1 );
    final static LinkedBlockingQueue shellqueue = new LinkedBlockingQueue();
    final private Map<String, Class> ld_classes = new HashMap< String, Class>();
    final static List<File> a_directories = new ArrayList<File>();
    
    
    public static void addToSearchPath( final File directory ){
    
        System.out.println( directory );
        a_directories.add( directory );
    
    
    }
    
    
    final static class LoadJythonTask implements Runnable{
    
        public void run(){
        
            try{
            
                final IsolatedJythonClassLoader ijcl = new IsolatedJythonClassLoader();
                final Class clazz = ijcl.loadClass( "org.leo.shell.JythonShell" );
                final Object o = clazz.newInstance();
                for( String s: force_load ){ //here we load the classes that slow down the first inputs...
                    
                    try{
                    
                        ijcl.loadClass( s );
                    
                    }
                    catch( ClassNotFoundException cnfe ){
                    
                        System.out.println( cnfe );
                    
                    }
                    
                
                
                
                }
            
                shellqueue.put( o );
            
                   
            }
            catch( Exception x ){ x.printStackTrace();}
        
        }    
    
    }
    
    public static void beginLoading(){
    
        final LoadJythonTask ljt = new LoadJythonTask();
        ses.schedule( ljt, 1000, TimeUnit.MILLISECONDS );
    
    
    }
    
    public static Object getJythonShell(){
    
        try{
            
            Object o;
            if( shellqueue.peek() != null || ses.getActiveCount() > 0 )
                o = shellqueue.take();
            else{
            
                LoadJythonTask ljt = new LoadJythonTask();
                ses.execute( ljt );
                o = shellqueue.take();
                
            }
            
            
            final LoadJythonTask ljt = new LoadJythonTask();
            ses.schedule( ljt, 1000, TimeUnit.MILLISECONDS );
            return o;
            
        }
        catch( Exception x ){ x.printStackTrace();}
        return null;
    
    }
    
    
    public IsolatedJythonClassLoader(){
    
        super();
    
    }



    public final Class getIsolatedClass( final String name ){
        
        byte[] data2;
        if( classes.containsKey( name ) ){
         data2 = classes.get( name );
         
         }
        else{
            InputStream ins = getSystemResourceAsStream( name );
            if( ins == null ){
                //System.out.println( name );
                for( File f: a_directories ){
                    

                    
                    if( !f.isDirectory() ) continue;
                    String[] pieces = name.split( "\\." );
                    StringBuilder sb = new StringBuilder();
                    if( pieces.length > 2 ){
                    
                        for( int i = 0; i < pieces.length - 2; i++ ) sb.append( pieces[ i ] ).append( File.separatorChar );
                        int spot = pieces.length -2;
                        int spot2 = pieces.length -1;
                        sb.append( pieces[ spot ] );
                        sb.append( "." );
                        sb.append( pieces[ spot2 ] );
                    
                    }
                    else{
                    
                        for( String s: pieces ) sb.append( s );
                    
                    }
                    String nwpath = sb.toString();
                    File f2 = new File( f, nwpath );
                    //System.out.println(f2);
                    if( f2.exists() ){
                    
                        try{
                            ins = new FileInputStream( f2 );
                            break;
                        }
                        catch( FileNotFoundException fnfe ){}
                    
                    }
        
                    if( ins != null ) break;
                }
                if( ins == null ) return null;
                               
            }
            ArrayList<Byte> ba = new ArrayList<Byte>();
            try{
        
                while( true ){
            
                    int i = ins.read();
                    if( i == -1 ) break;
                    ba.add( (byte)i );
            
            
                }
        
        
            }
            catch( IOException io ){
        
                System.out.println( io );
                return null;
            
            }
            Byte[] data = ba.toArray( new Byte[]{} );
            data2 = new byte[ data.length ];
            for( int i = 0; i < data.length; i ++ )
                data2[ i ] = data[ i ];
            classes.put( name, data2 );
        }
        
        final Class c = defineClass( null, data2, 0, data2.length );
        resolveClass( c );
        return c;
    
    }

    public Class loadClass( final String name ) throws ClassNotFoundException{
    
        if( ld_classes.containsKey( name ) ) return ld_classes.get( name );
        if( name.startsWith( "org.leo.shell" ) ){
        
            final Class clazz = getIsolatedClass( name + ".class" );
            if( clazz == null ) throw new ClassNotFoundException( "Could not find: " + name );
            ld_classes.put( name, clazz );
            return clazz;
        
        }
        else if( name.startsWith( "org.python" ) ){
        
            final String newname = name.replace( '.', '/' ) + ".class";
            //System.out.println(newname);
            //final String newname = name + ".class";
            final Class clazz = getIsolatedClass( newname );
            if( clazz == null ) throw new ClassNotFoundException( "Could not find: " + name );
            ld_classes.put( name, clazz );
            return clazz;
        
        
        }
        return super.loadClass( name );    
    
    }

static final String[] force_load = new String[]{
"org.python.parser.PythonGrammarConstants",
"org.python.core.parser",
"org.python.parser.CharStream",
"org.python.parser.Node",
"org.python.parser.IParserHost",
"org.python.core.FixMacReaderBug",
"org.python.core.LiteralMakerForParser",
"org.python.parser.PythonGrammar",
"org.python.parser.PythonGrammarTreeConstants",
"org.python.parser.ParseException",
"org.python.parser.PythonGrammar$LookaheadSuccess",
"org.python.parser.TokenMgrError",
"org.python.parser.ReaderCharStream",
"org.python.parser.JJTPythonGrammarState",
"org.python.parser.IntStack",
"org.python.parser.TreeBuilder",
"org.python.parser.SimpleNode",
"org.python.parser.ast.exprType",
"org.python.parser.ast.stmtType",
"org.python.parser.ast.AugAssign",
"org.python.parser.ast.operatorType",
"org.python.parser.ast.Interactive",
"org.python.parser.ast.modType",
"org.python.parser.ast.Module",
"org.python.parser.ast.Expression",
"org.python.parser.ast.Name",
"org.python.parser.ast.expr_contextType",
"org.python.parser.ast.Num",
"org.python.parser.ast.Str",
"org.python.parser.ast.Suite",
"org.python.parser.ast.Assign",
"org.python.parser.ast.Expr",
"org.python.parser.ast.Subscript",
"org.python.parser.ast.Attribute",
"org.python.parser.ast.Delete",
"org.python.parser.ast.Print",
"org.python.parser.ast.For",
"org.python.parser.ast.While",
"org.python.parser.ast.If",
"org.python.parser.ast.Pass",
"org.python.parser.ast.Break",
"org.python.parser.ast.Continue",
"org.python.parser.ast.FunctionDef",
"org.python.parser.DefaultArg",
"org.python.parser.ExtraArg",
"org.python.parser.ast.ClassDef",
"org.python.parser.ast.Return",
"org.python.parser.ast.Yield",
"org.python.parser.ast.Raise",
"org.python.parser.ast.Global",
"org.python.parser.ast.Exec",
"org.python.parser.ast.Assert",
"org.python.parser.ast.TryFinally",
"org.python.parser.ast.TryExcept",
"org.python.parser.ast.excepthandlerType",
"org.python.parser.ast.BoolOp",
"org.python.parser.ast.boolopType",
"org.python.parser.ast.Compare",
"org.python.parser.ast.cmpopType",
"org.python.parser.ast.BinOp",
"org.python.parser.ast.UnaryOp",
"org.python.parser.ast.unaryopType",
"org.python.parser.ast.Call",
"org.python.parser.ExtraArgValue",
"org.python.parser.ast.keywordType",
"org.python.parser.ast.Tuple",
"org.python.parser.ast.ListComp",
"org.python.parser.ast.List",
"org.python.parser.ast.Dict",
"org.python.parser.ast.Repr",
"org.python.parser.ast.Lambda",
"org.python.parser.ast.Ellipsis",
"org.python.parser.ast.sliceType",
"org.python.parser.ast.Index",
"org.python.parser.ast.Slice",
"org.python.parser.ast.ExtSlice",
"org.python.parser.ast.listcompType",
"org.python.parser.ast.ImportFrom",
"org.python.parser.ast.Import",
"org.python.parser.ast.aliasType",
"org.python.parser.CtxVisitor",
"org.python.parser.Visitor",
"org.python.parser.ast.VisitorBase",
"org.python.parser.ast.VisitorIF",
"org.python.parser.PythonGrammar$JJCalls",
"org.python.parser.PythonGrammarTokenManager",
"org.python.parser.Token",
"org.python.parser.IdentityNode",
"org.python.compiler.Module",
"org.python.compiler.ClassConstants",
"org.python.compiler.CompilationContext",
"org.python.compiler.Attribute",
"org.python.compiler.SourceFile",
"org.python.compiler.APIVersion",
"org.python.compiler.Constant",
"org.python.compiler.PyCodeConstant",
"org.python.compiler.PyLongConstant",
"org.python.compiler.PyStringConstant",
"org.python.compiler.PyComplexConstant",
"org.python.compiler.PyFloatConstant",
"org.python.compiler.PyIntegerConstant",
"org.python.compiler.ClassFile",
"org.python.compiler.ConstantPool",
"org.python.compiler.Future",
"org.python.compiler.ScopesCompiler",
"org.python.compiler.ScopeConstants",
"org.python.compiler.ScopeInfo",
"org.python.compiler.Code",
"org.python.compiler.Bytes",
"org.python.compiler.Method",
"org.python.compiler.CodeCompiler",
"org.python.compiler.Label",
"org.python.compiler.LineNumberTable",
"org.python.core.BytecodeLoader",
"org.python.core.Loader",
"org.python.core.BytecodeLoader2",
"org.python.core.PyFunctionTable",
"org.python.core.PyGenerator" };


}
//@nonl
//@-node:zorcanda!.20051114092424.105:@thin IsolatedJythonClassLoader.java
//@-leo
