Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OtJMU-0003gd-6S
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 14:04:38 +0200
Received: (qmail 2622 invoked by uid 503); 8 Sep 2010 12:13:21 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 8 Sep 2010 12:13:21 -0000
Received: (qmail 501 invoked by uid 503); 8 Sep 2010 11:46:10 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 8 Sep 2010 11:46:09 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 8 Sep 2010 14:02:03 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 8 Sep 2010 14:02:01 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Sep 2010 14:00:43 +0200
Message-Id: <1283947243-26897-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1283947243-26897-1-git-send-email-eric@eukrea.com>
References: <A88FB909-75F8-430A-B6E7-16C4A1C51A13@vanille-media.de>
	<1283947243-26897-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8879128142317923658
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] python-2.6-manifest.inc: regenerate the file.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Sep 2010 12:05:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

the patch is quite large because packages seems to have been reordered
in the generator but excepting python-dev and python-distutils,
everything is still present.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/python/python-2.6-manifest.inc |   42 ++++++++++++++++----------------
 1 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/recipes/python/python-2.6-manifest.inc b/recipes/python/python-2.6-manifest.inc
index 4ed05cb..dfc098a 100644
--- a/recipes/python/python-2.6-manifest.inc
+++ b/recipes/python/python-2.6-manifest.inc
@@ -1,17 +1,17 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: './generate-manifest-2.6.py' Version 20100711 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: './contrib/python/generate-manifest-2.6.py' Version 20100908 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
 
-PROVIDES+="python-profile python-threading python-distutils python-doctest python-stringold python-codecs python-ctypes python-pickle python-datetime python-core python-io python-compiler python-compression python-re python-xmlrpc python-terminal python-email python-image python-tests python-core-dbg python-resource python-json python-dev python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-curses python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-numbers python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio "
+PROVIDES+="python-codecs python-threading python-distutils python-doctest python-stringold python-curses python-ctypes python-pickle python-datetime python-core python-io python-compression python-re python-profile python-xmlrpc python-terminal python-dev python-email python-image python-tests python-core-dbg python-resource python-json python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-compiler python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-numbers python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio "
 
-PACKAGES="python-core-dbg python-profile python-threading python-distutils python-doctest python-stringold python-codecs python-ctypes python-pickle python-datetime python-core python-io python-compiler python-compression python-re python-xmlrpc python-terminal python-email python-image python-tests python-resource python-json python-dev python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-curses python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-numbers python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio python-modules"
+PACKAGES="python-core-dbg python-codecs python-threading python-distutils python-doctest python-stringold python-curses python-ctypes python-pickle python-datetime python-core python-io python-compression python-re python-profile python-xmlrpc python-terminal python-dev python-email python-image python-tests python-resource python-json python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-compiler python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-numbers python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio python-modules"
 
-DESCRIPTION_python-profile="Python Basic Profiling Support"
-RDEPENDS_python-profile="python-core python-textutils"
-FILES_python-profile="${libdir}/python2.6/profile.* ${libdir}/python2.6/pstats.* ${libdir}/python2.6/cProfile.* ${libdir}/python2.6/lib-dynload/_lsprof.so "
+DESCRIPTION_python-codecs="Python Codecs, Encodings & i18n Support"
+RDEPENDS_python-codecs="python-core python-lang"
+FILES_python-codecs="${libdir}/python2.6/codecs.* ${libdir}/python2.6/encodings ${libdir}/python2.6/gettext.* ${libdir}/python2.6/locale.* ${libdir}/python2.6/lib-dynload/_locale.so ${libdir}/python2.6/lib-dynload/unicodedata.so ${libdir}/python2.6/stringprep.* ${libdir}/python2.6/xdrlib.* "
 
 DESCRIPTION_python-threading="Python Threading & Synchronization Support"
 RDEPENDS_python-threading="python-core python-lang"
@@ -29,9 +29,9 @@ DESCRIPTION_python-stringold="Python String APIs [deprecated]"
 RDEPENDS_python-stringold="python-core python-re"
 FILES_python-stringold="${libdir}/python2.6/lib-dynload/strop.so ${libdir}/python2.6/string.* "
 
-DESCRIPTION_python-codecs="Python Codecs, Encodings & i18n Support"
-RDEPENDS_python-codecs="python-core python-lang"
-FILES_python-codecs="${libdir}/python2.6/codecs.* ${libdir}/python2.6/encodings ${libdir}/python2.6/gettext.* ${libdir}/python2.6/locale.* ${libdir}/python2.6/lib-dynload/_locale.so ${libdir}/python2.6/lib-dynload/unicodedata.so ${libdir}/python2.6/stringprep.* ${libdir}/python2.6/xdrlib.* "
+DESCRIPTION_python-curses="Python Curses Support"
+RDEPENDS_python-curses="python-core"
+FILES_python-curses="${libdir}/python2.6/curses ${libdir}/python2.6/lib-dynload/_curses.so ${libdir}/python2.6/lib-dynload/_curses_panel.so "
 
 DESCRIPTION_python-ctypes="Python C Types Support"
 RDEPENDS_python-ctypes="python-core"
@@ -53,10 +53,6 @@ DESCRIPTION_python-io="Python Low-Level I/O"
 RDEPENDS_python-io="python-core python-math"
 FILES_python-io="${libdir}/python2.6/lib-dynload/_socket.so ${libdir}/python2.6/lib-dynload/_ssl.so ${libdir}/python2.6/lib-dynload/select.so ${libdir}/python2.6/lib-dynload/termios.so ${libdir}/python2.6/lib-dynload/cStringIO.so ${libdir}/python2.6/pipes.* ${libdir}/python2.6/socket.* ${libdir}/python2.6/ssl.* ${libdir}/python2.6/tempfile.* ${libdir}/python2.6/StringIO.* "
 
-DESCRIPTION_python-compiler="Python Compiler Support"
-RDEPENDS_python-compiler="python-core"
-FILES_python-compiler="${libdir}/python2.6/compiler "
-
 DESCRIPTION_python-compression="Python High Level Compression Support"
 RDEPENDS_python-compression="python-core python-zlib"
 FILES_python-compression="${libdir}/python2.6/gzip.* ${libdir}/python2.6/zipfile.* ${libdir}/python2.6/tarfile.* ${libdir}/python2.6/lib-dynload/bz2.so "
@@ -65,6 +61,10 @@ DESCRIPTION_python-re="Python Regular Expression APIs"
 RDEPENDS_python-re="python-core"
 FILES_python-re="${libdir}/python2.6/re.* ${libdir}/python2.6/sre.* ${libdir}/python2.6/sre_compile.* ${libdir}/python2.6/sre_constants* ${libdir}/python2.6/sre_parse.* "
 
+DESCRIPTION_python-profile="Python Basic Profiling Support"
+RDEPENDS_python-profile="python-core python-textutils"
+FILES_python-profile="${libdir}/python2.6/profile.* ${libdir}/python2.6/pstats.* ${libdir}/python2.6/cProfile.* ${libdir}/python2.6/lib-dynload/_lsprof.so "
+
 DESCRIPTION_python-xmlrpc="Python XMLRPC Support"
 RDEPENDS_python-xmlrpc="python-core python-xml python-netserver python-lang"
 FILES_python-xmlrpc="${libdir}/python2.6/xmlrpclib.* ${libdir}/python2.6/SimpleXMLRPCServer.* "
@@ -73,6 +73,10 @@ DESCRIPTION_python-terminal="Python Terminal Controlling Support"
 RDEPENDS_python-terminal="python-core python-io"
 FILES_python-terminal="${libdir}/python2.6/pty.* ${libdir}/python2.6/tty.* "
 
+DESCRIPTION_python-dev="Python Development Package"
+RDEPENDS_python-dev="python-core"
+FILES_python-dev="${includedir} ${libdir}/libpython2.6.so ${libdir}/python2.6/config "
+
 DESCRIPTION_python-email="Python Email Support"
 RDEPENDS_python-email="python-core python-io python-re python-mime python-audio python-image python-netclient"
 FILES_python-email="${libdir}/python2.6/imaplib.* ${libdir}/python2.6/email "
@@ -97,10 +101,6 @@ DESCRIPTION_python-json="Python JSON Support"
 RDEPENDS_python-json="python-core python-math python-re"
 FILES_python-json="${libdir}/python2.6/json "
 
-DESCRIPTION_python-dev="Python Development Package"
-RDEPENDS_python-dev="python-core"
-FILES_python-dev="${includedir} ${libdir}/libpython2.6.so ${libdir}/python2.6/config "
-
 DESCRIPTION_python-difflib="Python helpers for computing deltas between objects."
 RDEPENDS_python-difflib="python-lang python-re"
 FILES_python-difflib="${libdir}/python2.6/difflib.* "
@@ -153,9 +153,9 @@ DESCRIPTION_python-netserver="Python Internet Protocol Servers"
 RDEPENDS_python-netserver="python-core python-netclient"
 FILES_python-netserver="${libdir}/python2.6/cgi.* ${libdir}/python2.6/*HTTPServer.* ${libdir}/python2.6/SocketServer.* "
 
-DESCRIPTION_python-curses="Python Curses Support"
-RDEPENDS_python-curses="python-core"
-FILES_python-curses="${libdir}/python2.6/curses ${libdir}/python2.6/lib-dynload/_curses.so ${libdir}/python2.6/lib-dynload/_curses_panel.so "
+DESCRIPTION_python-compiler="Python Compiler Support"
+RDEPENDS_python-compiler="python-core"
+FILES_python-compiler="${libdir}/python2.6/compiler "
 
 DESCRIPTION_python-smtpd="Python Simple Mail Transport Daemon"
 RDEPENDS_python-smtpd="python-core python-netserver python-email python-mime"
@@ -266,7 +266,7 @@ RDEPENDS_python-audio="python-core"
 FILES_python-audio="${libdir}/python2.6/wave.* ${libdir}/python2.6/chunk.* ${libdir}/python2.6/sndhdr.* ${libdir}/python2.6/lib-dynload/ossaudiodev.so ${libdir}/python2.6/lib-dynload/audioop.so "
 
 DESCRIPTION_python-modules="All Python modules"
-RDEPENDS_python-modules="python-profile python-threading python-distutils python-doctest python-stringold python-codecs python-ctypes python-pickle python-datetime python-core python-io python-compiler python-compression python-re python-xmlrpc python-terminal python-email python-image python-tests python-resource python-json python-dev python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-curses python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-numbers python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio  "
+RDEPENDS_python-modules="python-codecs python-threading python-doctest python-stringold python-curses python-ctypes python-pickle python-datetime python-core python-io python-compression python-re python-profile python-xmlrpc python-terminal python-email python-image python-tests python-resource python-json python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-compiler python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-numbers python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio  "
 ALLOW_EMPTY_python-modules = "1"
 
 
-- 
1.6.3.3



