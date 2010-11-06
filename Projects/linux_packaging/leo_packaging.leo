<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet ekr_test?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ville.20090627195028.1452"><vh>@chapters</vh></v>
<v t="ville.20090627195028.1460" a="E"><vh>leo scripts for packaging (non-ileo)</vh>
<v t="ville.20090720134348.2378"><vh>introduce sloppycode</vh></v>
<v t="ville.20090710203400.1284" a="E"><vh>leo_branch_dir</vh>
<v t="ville.20090730191424.1457"><vh>do branch the release</vh></v>
</v>
<v t="ville.20090627195028.1458"><vh>packaging_dir</vh></v>
<v t="ville.20090627195028.1454"><vh>get_bzr_version</vh></v>
<v t="ville.20090710205926.1288" a="E"><vh>release version alts</vh>
<v t="ville.20090627195028.1453"><vh>release_version (get from bzr)</vh></v>
<v t="ville.20090710203400.1283"><vh>release version (for 4.6rc1)</vh></v>
<v t="ville.20090717230028.1403"><vh>release version (for 4.6)</vh></v>
<v t="ville.20090730191424.1460"><vh>release version (for 4.6.1)</vh></v>
<v t="ville.20090803185756.1402"><vh>release version (for 4.6.2)</vh></v>
<v t="ville.20090906205533.1603"><vh>release version (for 4.6.3)</vh></v>
<v t="ville.20090911192305.1410"><vh>release version (for 4.7b1)</vh></v>
<v t="ville.20100212173600.1427"><vh>release version (for 4.7rc1)</vh></v>
<v t="ville.20100223172758.1434"><vh>release version (for 4.7)</vh></v>
<v t="ville.20100226164817.1350"><vh>release version (for 4.7.1)</vh></v>
<v t="ville.20101105210628.1712"><vh>release version (for 4.8b1)</vh></v>
</v>
<v t="ville.20090627195028.1451"><vh>export tarball</vh></v>
<v t="ville.20090627195028.1461"><vh>extract tarball</vh></v>
<v t="ville.20090627195028.1462"><vh>get_debian_dir_from_launchpad</vh></v>
<v t="ville.20090627195028.1465"><vh>create changelog entry</vh></v>
<v t="ville.20090627195028.1463"><vh>build package</vh></v>
<v t="ville.20090701214417.1488"><vh>upload</vh></v>
<v t="ville.20090720182917.1439"><vh>@button dump-namespace</vh></v>
</v>
<v t="ville.20090720182917.1424"><vh>ileo scripts for packaging (classic ileo)</vh>
<v t="ville.20090720182917.1425"><vh>introduce sloppycode</vh></v>
<v t="ville.20090720182917.1426"><vh>leo_branch_dir</vh></v>
<v t="ville.20090720182917.1427"><vh>packaging_dir</vh></v>
<v t="ville.20090720182917.1428"><vh>get_bzr_version</vh></v>
<v t="ville.20090720182917.1429"><vh>release version alts</vh>
<v t="ville.20090720182917.1430"><vh>release_version (get from bzr)</vh></v>
<v t="ville.20090720182917.1431"><vh>release version (for 4.6rc1)</vh></v>
<v t="ville.20090720182917.1432"><vh>release version (for 4.6)</vh></v>
</v>
<v t="ville.20090720182917.1433"><vh>export tarball</vh></v>
<v t="ville.20090720182917.1434"><vh>extract tarball</vh></v>
<v t="ville.20090720182917.1435"><vh>get_debian_dir_from_launchpad</vh></v>
<v t="ville.20090720182917.1436"><vh>create changelog entry</vh></v>
<v t="ville.20090720182917.1437"><vh>build package</vh></v>
<v t="ville.20090720182917.1438"><vh>upload</vh></v>
</v>
<v t="ville.20090710203400.1282"><vh>packaging 4.6</vh></v>
<v t="ville.20090627195028.1466"><vh>debian packaging files</vh></v>
<v t="ville.20090627195028.1468"><vh>set debian dir</vh></v>
<v t="ville.20090702121615.1500"><vh>@edit /home/ville/pkg/leo-4.6~rc1~bzr2164/debian/leo.1</vh></v>
</vnodes>
<tnodes>
<t tx="ville.20090627195028.1451">#wb.require('release_version')
#wb.require('packaging_dir')

with g.cd(g.ns.leo_branch_dir):
    g.ns.tarball_name = g.ns.rel_version + ".tar.gz"
    print "exporting "+ g.ns.tarball_name
    g.sh('bzr export $tarball_name') 
    g.ns.orig_tar_name = g.ns.packaging_dir + "/" + g.ns.rel_version.replace('-','_') + ".orig.tar.gz"
    g.sh('mv ${rel_version}.tar.gz $orig_tar_name')


</t>
<t tx="ville.20090627195028.1452"></t>
<t tx="ville.20090627195028.1453">#wb.require("get_bzr_version")
g.ns.rel_version = "leo-4.6~rc1~bzr" + g.ns.bzr_revno
</t>
<t tx="ville.20090627195028.1454">with g.cd('$leo_branch_dir'):
    verinfo= g.cap('bzr version-info')
    g.ns.bzr_revno = verinfo.grep('revno').fields(1)[0]



</t>
<t tx="ville.20090627195028.1458">g.ns.packaging_dir = "~/b/pkg"</t>
<t tx="ville.20090627195028.1460"></t>
<t tx="ville.20090627195028.1461">print "extracting tarball " + g.ns.orig_tar_name
with g.cd(g.ns.packaging_dir):
    g.sh('tar xzf $orig_tar_name')</t>
<t tx="ville.20090627195028.1462"># the tarball was extracted here
import os

with g.cd(g.ns.packaging_dir + '/' + g.ns.rel_version) as g.ns.workpath:
    g.sh('pwd')    
    assert not os.path.isdir('debian')
    g.sh('bzr branch lp:~leo-editor-team/leo-editor/packaging debian')</t>
<t tx="ville.20090627195028.1463"># sign with my (Ville) key

#debuild -i -I.git -S -sa -k348F0F07</t>
<t tx="ville.20090627195028.1465">with g.cd(g.ns.workpath):
    g.sh("dch -b -v ${rel_version.lstrip('leo-') + '-1'} -D lucid")</t>
<t tx="ville.20090627195028.1466"></t>
<t tx="ville.20090627195028.1468">c.db['debian_pkg_dir'] = "~/pkg/leo-4.6~rc1~bzr2098"
</t>
<t tx="ville.20090701214417.1488"># dput leo-preview leo_4.6b2-3_source.changes (or equivalent)

dput ppa:villemvainio/ppa &lt;source.changes&gt;

# upload packaging changes to launchpad
# bzr push --remember lp:~leo-editor-team/leo-editor/packaging-jaunty</t>
<t tx="ville.20090710203400.1282"></t>
<t tx="ville.20090710203400.1283">#wb.require("get_bzr_version")
rel_version = "leo-4.6~rc1"
rel_version</t>
<t tx="ville.20090710203400.1284">#check out the wanted branch here

g.ns.leo_branch_dir = "~/b/leo-pkgbranch"
</t>
<t tx="ville.20090710205926.1288"></t>
<t tx="ville.20090717230028.1403">#wb.require("get_bzr_version")
rel_version = "leo-4.6"
rel_version</t>
<t tx="ville.20090720134348.2378"># sloppycode is at https://launchpad.net/sloppycode
import sloppycode.shortcuts as sc
g.sh = sc.shrun
g.cap = sc.shcap
g.ns = sc.ns
g.cd = sc.chdir

</t>
<t tx="ville.20090720182917.1424"></t>
<t tx="ville.20090720182917.1425">import sloppycode.shortcuts as sc
g.sh = sc.shrun
g.cap = sc.shcap
g.ns = sc.ns

</t>
<t tx="ville.20090720182917.1426">#check out the wanted branch here

leo_branch_dir = "~/leo-pkgbranch"
</t>
<t tx="ville.20090720182917.1427">packaging_dir = "~/pkg"</t>
<t tx="ville.20090720182917.1428">cd ~/$(leo_branch_dir)
verinfo= !bzr version-info
bzr_revno = verinfo.grep('revno').fields(1)[0]
bzr_revno</t>
<t tx="ville.20090720182917.1429"></t>
<t tx="ville.20090720182917.1430">wb.require("get_bzr_version")
rel_version = "leo-4.6~rc1~bzr" + bzr_revno
rel_version</t>
<t tx="ville.20090720182917.1431">#wb.require("get_bzr_version")
rel_version = "leo-4.6~rc1"
rel_version</t>
<t tx="ville.20090720182917.1432">#wb.require("get_bzr_version")
rel_version = "leo-4.6"
rel_version</t>
<t tx="ville.20090720182917.1433">#wb.require('release_version')
wb.require('packaging_dir')

cd ${leo_branch_dir}
tarball_name = rel_version + ".tar.gz"
print "exporting "+ tarball_name
bzr export $tarball_name 
orig_tar_name = packaging_dir + "/" + rel_version.replace('-','_') + ".orig.tar.gz"
!mv ${rel_version + ".tar.gz"} ${orig_tar_name}


</t>
<t tx="ville.20090720182917.1434">print "extracting tarball " + orig_tar_name
cd $packaging_dir
tar xzf $orig_tar_name</t>
<t tx="ville.20090720182917.1435"># the tarball was extracted here
cd ${packaging_dir}/${rel_version}
pwd
assert not os.path.isdir('debian')
bzr branch lp:~leo-editor-team/leo-editor/packaging-jaunty debian</t>
<t tx="ville.20090720182917.1436">dch -b -v ${rel_version.lstrip('leo-') + '-1'} -D jaunty</t>
<t tx="ville.20090720182917.1437"># sign with my (Ville) key

#debuild -i -S -sa -k348F0F07</t>
<t tx="ville.20090720182917.1438"># dput leo-preview leo_4.6b2-3_source.changes (or equivalent)
# upload packaging changes to launchpad
# bzr push --remember lp:~leo-editor-team/leo-editor/packaging-jaunty</t>
<t tx="ville.20090720182917.1439">import pprint
dd = dict((k,v) for k,v in g.ns.__dict__.items() if not k.startswith('__'))
pprint.pprint(dd)
</t>
<t tx="ville.20090730191424.1457">branchtag = 'leo-4-8-b1'
g.sh('bzr branch -r tag:$branchtag lp:leo-editor ${leo_branch_dir}')</t>
<t tx="ville.20090730191424.1460">#wb.require("get_bzr_version")
g.ns.rel_version = "leo-4.6.1"
</t>
<t tx="ville.20090803185756.1402">#wb.require("get_bzr_version")
g.ns.rel_version = "leo-4.6.2"
</t>
<t tx="ville.20090906205533.1603">#wb.require("get_bzr_version")
g.ns.rel_version = "leo-4.6.2"
</t>
<t tx="ville.20090911192305.1410">#wb.require("get_bzr_version")
g.ns.rel_version = "leo-4.7~b1"
</t>
<t tx="ville.20100212173600.1427">#wb.require("get_bzr_version")
g.ns.rel_version = "leo-4.7~rc1"
</t>
<t tx="ville.20100223172758.1434">#wb.require("get_bzr_version")
g.ns.rel_version = "leo-4.7"
</t>
<t tx="ville.20100226164817.1350">#wb.require("get_bzr_version")
g.ns.rel_version = "leo-4.7.1"
</t>
<t tx="ville.20101105210628.1712">#wb.require("get_bzr_version")
g.ns.rel_version = "leo-4.8~b1"
</t>
</tnodes>
</leo_file>
