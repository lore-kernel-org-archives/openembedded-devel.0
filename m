Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8slm-0005D6-UO
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 10:48:46 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8skW-0004fB-LI for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 04:47:24 -0500
Date: Fri, 13 Nov 2009 04:47:20 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911130446000.1157@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: build breakage: guile-native-1.8.6-r0
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
X-List-Received-Date: Fri, 13 Nov 2009 09:48:46 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-162657877-1258105641=:1157"

--8323328-162657877-1258105641=:1157
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: QUOTED-PRINTABLE


  the log file:

NOTE: make -j4
make  all-recursive
make[1]: Entering directory `/home/rpjday/oe/angstrom-dev/work/x86_64-linux=
/guile-native-1.8.6-r0/guile-1.8.6'
Making all in oop
make[2]: Entering directory `/home/rpjday/oe/angstrom-dev/work/x86_64-linux=
/guile-native-1.8.6-r0/guile-1.8.6/oop'
Making all in goops
make[3]: Entering directory `/home/rpjday/oe/angstrom-dev/work/x86_64-linux=
/guile-native-1.8.6-r0/guile-1.8.6/oop/goops'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/=
guile-native-1.8.6-r0/guile-1.8.6/oop/goops'
make[3]: Entering directory `/home/rpjday/oe/angstrom-dev/work/x86_64-linux=
/guile-native-1.8.6-r0/guile-1.8.6/oop'
make[3]: Nothing to be done for `all-am'.
make[3]: Leaving directory `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/=
guile-native-1.8.6-r0/guile-1.8.6/oop'
make[2]: Leaving directory `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/=
guile-native-1.8.6-r0/guile-1.8.6/oop'
Making all in libguile
make[2]: Entering directory `/home/rpjday/oe/angstrom-dev/work/x86_64-linux=
/guile-native-1.8.6-r0/guile-1.8.6/libguile'
make  all-am
make[3]: Entering directory `/home/rpjday/oe/angstrom-dev/work/x86_64-linux=
/guile-native-1.8.6-r0/guile-1.8.6/libguile'
cat alist.doc arbiters.doc async.doc backtrace.doc boolean.doc chars.doc co=
ntinuations.doc debug.doc deprecation.doc deprecated.doc discouraged.doc dy=
nl.doc dynwind.doc environments.doc eq.doc error.doc eval.doc evalext.doc e=
xtensions.doc feature.doc fluids.doc fports.doc futures.doc gc.doc goops.do=
c gsubr.doc gc-mark.doc gc-segment.doc gc-malloc.doc gc-card.doc guardians.=
doc hash.doc hashtab.doc hooks.doc i18n.doc init.doc ioext.doc keywords.doc=
 lang.doc list.doc load.doc macros.doc mallocs.doc modules.doc numbers.doc =
objects.doc objprop.doc options.doc pairs.doc ports.doc print.doc procprop.=
doc procs.doc properties.doc random.doc rdelim.doc read.doc root.doc rw.doc=
 scmsigs.doc script.doc simpos.doc smob.doc sort.doc srcprop.doc stackchk.d=
oc stacks.doc stime.doc strings.doc srfi-4.doc srfi-13.doc srfi-14.doc stro=
rder.doc strports.doc struct.doc symbols.doc threads.doc throw.doc values.d=
oc variable.doc vectors.doc version.doc vports.doc weaks.doc ramap.doc unif=
=2Edoc dynl.doc filesys.doc posix.doc net_db.doc socket.doc regex-posix.doc=
 | GUILE=3D"/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8=
=2E6-r0/guile-1.8.6/pre-inst-guile" ../scripts/snarf-check-and-output-texi =
         > guile-procedures.texi || { rm guile-procedures.texi; false; }
ERROR: unknown doc attribute: (location (string . alist.c) (int . 40) (hash=
 . hash))
cat: write error: Broken pipe
make[3]: *** [guile-procedures.texi] Error 1
make[3]: Leaving directory `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/=
guile-native-1.8.6-r0/guile-1.8.6/libguile'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/=
guile-native-1.8.6-r0/guile-1.8.6/libguile'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/=
guile-native-1.8.6-r0/guile-1.8.6'
make: *** [all] Error 2
FATAL: oe_runmake failed

rday
--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323328-162657877-1258105641=:1157--
