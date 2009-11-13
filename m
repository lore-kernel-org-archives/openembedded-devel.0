Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8uv0-0000Fs-OS
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 13:06:26 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8utk-0006pW-Ip for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 07:05:04 -0500
Date: Fri, 13 Nov 2009 07:04:57 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258106998.5799.7.camel@dax.rpnet.com>
Message-ID: <alpine.LFD.2.00.0911130702580.16806@localhost>
References: <alpine.LFD.2.00.0911130447260.1157@localhost>
	<1258106998.5799.7.camel@dax.rpnet.com>
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
Subject: Re: build breakage: sqlite3_3.6.20
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
X-List-Received-Date: Fri, 13 Nov 2009 12:06:26 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-174224166-1258113901=:16806"

--8323328-174224166-1258113901=:16806
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 13 Nov 2009, Richard Purdie wrote:

> On Fri, 2009-11-13 at 04:49 -0500, Robert P. J. Day wrote:
> > NOTE: make -j4 sqlite3.h
> > make: `sqlite3.h' is up to date.
> > NOTE: make -j4
> > rm -rf tsrc
> > mkdir -p tsrc
> > cp ./src/alter.c ./src/analyze.c ./src/attach.c ./src/auth.c ./src/back=
up.c ./src/bitvec.c ./src/btmutex.c ./src/btree.c ./src/btree.h ./src/btree=
Int.h ./src/build.c ./src/callback.c ./src/complete.c ./src/date.c ./src/de=
lete.c ./src/expr.c ./src/fault.c ./src/fkey.c ./src/func.c ./src/global.c =
=2E/src/hash.c ./src/hash.h ./src/hwtime.h ./src/insert.c ./src/journal.c .=
/src/legacy.c ./src/loadext.c ./src/main.c ./src/malloc.c ./src/mem0.c ./sr=
c/mem1.c ./src/mem2.c ./src/mem3.c ./src/mem5.c ./src/memjournal.c ./src/mu=
tex.c ./src/mutex.h ./src/mutex_noop.c ./src/mutex_os2.c ./src/mutex_unix.c=
 ./src/mutex_w32.c ./src/notify.c ./src/os.c ./src/os.h ./src/os_common.h .=
/src/os_os2.c ./src/os_unix.c ./src/os_win.c ./src/pager.c ./src/pager.h ./=
src/parse.y ./src/pcache.c ./src/pcache.h ./src/pcache1.c ./src/pragma.c ./=
src/prepare.c ./src/printf.c ./src/random.c ./src/resolve.c ./src/rowset.c =
=2E/src/select.c ./src/status.c ./src/shell.c ./src/sqlite.h.in ./src/sqlit=
e3ext.h ./src/sqliteInt.h ./src/sqliteLimit.h ./src/table.c ./src/tclsqlite=
=2Ec ./src/tokenize.c ./src/trigger.c ./src/utf.c ./src/update.c ./src/util=
=2Ec ./src/vacuum.c ./src/vdbe.c ./src/vdbe.h ./src/vdbeapi.c ./src/vdbeaux=
=2Ec ./src/vdbeblob.c ./src/vdbemem.c ./src/vdbeInt.h ./src/vtab.c ./src/wa=
lker.c ./src/where.c keywordhash.h opcodes.c opcodes.h parse.c parse.h conf=
ig.h sqlite3.h ./ext/fts1/fts1.c ./ext/fts1/fts1.h ./ext/fts1/fts1_hash.c .=
/ext/fts1/fts1_hash.h ./ext/fts1/fts1_porter.c ./ext/fts1/fts1_tokenizer.h =
=2E/ext/fts1/fts1_tokenizer1.c ./ext/fts2/fts2.c ./ext/fts2/fts2.h ./ext/ft=
s2/fts2_hash.c ./ext/fts2/fts2_hash.h ./ext/fts2/fts2_icu.c ./ext/fts2/fts2=
_porter.c ./ext/fts2/fts2_tokenizer.h ./ext/fts2/fts2_tokenizer.c ./ext/fts=
2/fts2_tokenizer1.c ./ext/fts3/fts3.c ./ext/fts3/fts3.h ./ext/fts3/fts3_exp=
r.c ./ext/fts3/fts3_expr.h ./ext/fts3/fts3_hash.c ./ext/fts3/fts3_hash.h ./=
ext/fts3/fts3_icu.c ./ext/fts3/fts3_porter.c ./ext/fts3/fts3_tokenizer.h ./=
ext/fts3/fts3_tokenizer.c ./ext/fts3/fts3_tokenizer1.c ./ext/icu/sqliteicu.=
h ./ext/icu/icu.c ./ext/rtree/rtree.h ./ext/rtree/rtree.c tsrc
> > rm tsrc/sqlite.h.in tsrc/parse.y
> > tclsh8.4 ./tool/vdbe-compress.tcl <tsrc/vdbe.c >vdbe.new
> > tclsh8.4: error while loading shared libraries: libtcl8.4.so.0: cannot =
open shared object file: No such file or directory
> > make: *** [.target_source] Error 127
> > FATAL: oe_runmake failed
>
> There is talk on irc of the symbolic link for libtcl8.4.so.0 not being
> created. This should be done in the tcl-native recipe by the
> oe_libinstall shell function call.
>
> We're going to need someone who is experiencing this problem to find out
> why that function is not creating the symlink...
>
> (assuming the symlink is missing)

  i reran that build verbosely and with debugging, and posted it:

http://pastebin.com/d2fbcdbb

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

--8323328-174224166-1258113901=:16806--
