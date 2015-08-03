Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5F43673D13
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2015 09:39:29 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so106124298wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Aug 2015 02:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dPwgSGSoMcMtU9OIWSR3z8y126oG/RRvY+2qGa1ZOjA=;
	b=hoL1Q6qJSo1vn7TQRqaNlz/9eSuuSCrU0PxOb0+VX2NSZCwyWDqXhb1Cu3Qg/sUEwZ
	cVuKrkXnnvRoADiBLc+BrkHymG2f3aewIpjI8idjHOlW4OuHllpEOYREOhyuHBeVs08W
	kD6F96+yhADPCKs43ahZa3G2EubOILCYgZNK9lfcbEkaEAWy64nKjCwxkIPLa5lkMcln
	NpfMgMzfDCbAB7JMsXCOm9JA4cVFHIrX1YmvXpZV226E5/uvlduyJJ/wo9MIAJr5DMEv
	Ulya96m7cUFt8A00ZYg7k74/K3WDtWoY/h3jWBaHnIGi2fFJVxxi/OPephDFZqsBlbM2
	izSA==
X-Received: by 10.180.107.138 with SMTP id hc10mr31638221wib.2.1438594768589; 
	Mon, 03 Aug 2015 02:39:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id rz9sm4297209wjb.8.2015.08.03.02.39.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:39:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 3 Aug 2015 11:39:32 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150803093932.GA2465@jama>
References: <30DC4EDFD798C94083F3E083754532CC73E10EF8@G08CNEXMBPEKD02.g08.fujitsu.local>
	<30DC4EDFD798C94083F3E083754532CC73E16FB7@G08CNEXMBPEKD02.g08.fujitsu.local>
	<20150708103237.GA2398@jama> <20150708115915.GF2398@jama>
	<30DC4EDFD798C94083F3E083754532CC73E188EA@G08CNEXMBPEKD02.g08.fujitsu.local>
	<20150709155406.GD2446@jama>
	<30DC4EDFD798C94083F3E083754532CC73E18F05@G08CNEXMBPEKD02.g08.fujitsu.local>
	<20150713161727.GA2407@jama>
	<30DC4EDFD798C94083F3E083754532CC73E1AAE5@G08CNEXMBPEKD02.g08.fujitsu.local>
	<30DC4EDFD798C94083F3E083754532CC01197E4B47@G08CNEXMBPEKD03.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC01197E4B47@G08CNEXMBPEKD03.g08.fujitsu.local>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2 3/7] libldb: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Aug 2015 09:39:30 -0000
X-Groupsio-MsgNum: 56515
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2015 at 08:58:04AM +0000, Bian, Naimeng wrote:
> Hi Martin
>=20
> Thanks a lot for your help.
> The patchset has been removed from master-next, does it mean I should re-=
send it again.
> If not, would you telling me what should I do at the next-step.

It was still failing with updated libldb and samba, so I've moved it
=66rom master-next to contrib/jansa/master-next-unresolved-review and I'm
waiting for updated version.

> Thanks
>  Bian
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of=
 Bian,
> > Naimeng
> > Sent: Friday, July 17, 2015 3:40 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new recipe
> >=20
> > Thanks for your help.
> >=20
> > Please rebase the patch of libldb and samba from here.
> > - libldb
> >=20
> > https://github.com/bendaaron/meta-oe-dev/commit/f7a7d49164c8f5a4e8b12cc=
dc9
> > 2e08d73952a97c
> >=20
> > - samba
> >=20
> > https://github.com/bendaaron/meta-oe-dev/commit/db03404a4b6fed975345705=
5fe
> > c88b523ceeda3c
> >=20
> > Thanks
> >  Bian
> >=20
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > > Of Martin Jansa
> > > Sent: Tuesday, July 14, 2015 12:17 AM
> > > To: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new recipe
> > >
> > > On Fri, Jul 10, 2015 at 03:49:02AM +0000, Bian, Naimeng wrote:
> > > > > -----Original Message-----
> > > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> > > > > Behalf Of Martin Jansa
> > > > > Sent: Thursday, July 09, 2015 11:54 PM
> > > > > To: openembedded-devel@lists.openembedded.org
> > > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new recipe
> > > > >
> > > > > On Thu, Jul 09, 2015 at 12:30:42AM +0000, Bian, Naimeng wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > > > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> > > > > > > Behalf Of Martin Jansa
> > > > > > > Sent: Wednesday, July 08, 2015 7:59 PM
> > > > > > > To: openembedded-devel@lists.openembedded.org
> > > > > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new
> > > > > > > recipe
> > > > > > >
> > > > > > > On Wed, Jul 08, 2015 at 12:32:37PM +0200, Martin Jansa wrote:
> > > > > > > > On Thu, Jul 02, 2015 at 09:01:14AM +0000, Bian, Naimeng wro=
te:
> > > > > > > > > Hi Martin,
> > > > > > > > >
> > > > > > > > > I think I have fixed them and pushed them to github,
> > > > > > > > > please cherry-pick
> > > > > > > them.
> > > > > > > > >
> > > > > > > > > - libldb
> > > > > > > > >
> > > > > > > > > https://github.com/bendaaron/meta-oe-dev/commit/c6cade4236
> > > > > > > > > 22
> > > > > > > > > 6646
> > > > > > > > > fde9
> > > > > > > > > 9611c20fe3fcc6612e7a
> > > > > > > >
> > > > > > > > Hi Bian,
> > > > > > > >
> > > > > > > > it's still failing with this patch. I'll try to build it
> > > > > > > > manually and provide more details.
> > > > > > >
> > > > > > > find /usr/lib/python* -name \*tdb\* =3Dnothing=3D
> > > > > > >
> > > > > > > ldb and tdb workdirs are here:
> > > > > > > http://logs.nslu2-linux.org/buildlogs/oe/world/libldb.tar.bz2
> > > > > > > http://logs.nslu2-linux.org/buildlogs/oe/world/libtdb.tar.bz2
> > > > > > >
> > > > > >
> > > > > > Thank you very much.
> > > > > > I confirmed that tdb.so is exists in
> > > > > > ${D}/usr/lib/python2.7/site-packages
> > > > > of libtdb.
> > > > > >
> > > > > > Would you helping me check whether does tdb.so exist in
> > > > > > ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}
> > > > > > after building libtdb.
> > > > > > # find
> > > > > > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/us
> > > > > > r/ lib/ python2.7/site-packages -name \*tdb\*
> > > > >
> > > > > that server is already buiding domething else and tmpfs is gone,
> > > > > but in the archive I've sent you we can see that it's in
> > > > > sysroot-destdir directory so I believe it was also in
> > > > > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/
> > > > > li
> > > > > b/pyth
> > > > > on2.7/site-packages
> > > > >
> > > > > jenkins@aruba:~/oe/world/shr-core$ find libtdb/ -name tdb.so
> > > > > libtdb/1.3.0-r0/image/usr/lib/python2.7/site-packages/tdb.so
> > > > > libtdb/1.3.0-r0/package/usr/lib/python2.7/site-packages/.debug/tdb
> > > > > .s o
> > > > > libtdb/1.3.0-r0/package/usr/lib/python2.7/site-packages/tdb.so
> > > > > libtdb/1.3.0-r0/packages-split/python-tdb/usr/lib/python2.7/site-p
> > > > > ac
> > > > > kages/
> > > > > tdb.so
> > > > > libtdb/1.3.0-r0/packages-split/python-tdb-dbg/usr/lib/python2.7/si
> > > > > te
> > > > > -packa
> > > > > ges/.debug/tdb.so
> > > > > libtdb/1.3.0-r0/sysroot-destdir/usr/lib/python2.7/site-packages/t=
db.
> > > > > so libtdb/1.3.0-r0/tdb-1.3.0/bin/python/tdb.so
> > > > >
> > > >
> > > > Thanks for your time.
> > > >
> > > > I'm sorry for that, but would you mind to apply this patch which is
> > > > based on master-next, and then build libldb again to catch more
> > > > information
> > > for me.
> > > > https://github.com/bendaaron/meta-oe-dev/commit/e1f5e847e197cf0abad5
> > > > 78
> > > > e74d9f7b8f1c3ff951
> > >
> > > | Checking for
> > > getgrouplist                                                         =
: ok
> > > | Checking for system tdb >=3D
> > > 1.2.13                                                 : yes
> > > | module[/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64
> > > | /u sr/lib/python2.7/site-packages/tdb.so] exists in
> > > | [/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/l
> > > | ib
> > > | /python2.7/site-packages] Cross
> > > |
> > > module[/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u
> > > sr/l ib/python2.7/site-packages/tdb.so] can not be loaded.
> > > | Close
> > > module[/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u
> > > sr/l ib/python2.7/site-packages/tdb.so]. Note: maybe some exception
> > > was caught!
> > > | ERROR: Python module pytdb of version 1.2.13 not found, and bundling
> > > | disabled
> > > | WARNING: exit code 1 from a shell command.
> > > | ERROR: Function failed: do_configure (log file is located at
> > > | /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/lib
> > > | ld
> > > | b/1.1.17-r0/temp/log.do_configure.15453)
> > > NOTE: recipe libldb-1.1.17-r0: task do_configure: Failed
> > >
> > > >
> > > > Thanks
> > > >  Bian
> > > >
> > > > > >
> > > > > > Thanks
> > > > > >  Bian
> > > > > >
> > > > > > > > > - samba
> > > > > > > > >
> > > > > > > > > https://github.com/bendaaron/meta-oe-dev/commit/25430ee92b
> > > > > > > > > bb
> > > > > > > > > 2820
> > > > > > > > > 294c
> > > > > > > > > b9ce239d9d4dccc492ea
> > > > > > > > >
> > > > > > > > > Thanks
> > > > > > > > >  Bian
> > > > > > > > >
> > > > > > > > > > -----Original Message-----
> > > > > > > > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > > > > > > > [mailto:openembedded-devel-bounces@lists.openembedded.or
> > > > > > > > > > g] On Behalf Of Bian, Naimeng
> > > > > > > > > > Sent: Wednesday, June 24, 2015 3:05 PM
> > > > > > > > > > To: openembedded-devel@lists.openembedded.org
> > > > > > > > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add
> > > > > > > > > > new recipe
> > > > > > > > > >
> > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > From:
> > > > > > > > > > > openembedded-devel-bounces@lists.openembedded.org
> > > > > > > > > > > [mailto:openembedded-devel-bounces@lists.openembedded.
> > > > > > > > > > > or g] On Behalf Of Martin Jansa
> > > > > > > > > > > Sent: Tuesday, June 23, 2015 4:05 PM
> > > > > > > > > > > To: openembedded-devel
> > > > > > > > > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add
> > > > > > > > > > > new recipe
> > > > > > > > > > >
> > > > > > > > > > > I don't have access to that build anymore (because
> > > > > > > > > > > it's jenkins job using tmpfs for TMPDIR, so after the
> > > > > > > > > > > build the TMPDIR is gone), but it's failing only in
> > > > > > > > > > > qemux86-64 builds, so I assume that it's finding host
> > > > > > > > > > > tdb or python directories, because it's running on
> > > > > > > > > > > 12.04 Ubuntu
> > > x86-64.
> > > > > > > > > > >
> > > > > > > > > > > Try to install tdb on your build host if it allows you
> > > > > > > > > > > to reproduce the issue, otherwise I'll try to
> > > > > > > > > > > reproduce it again in some
> > > > > > > next jenkins build.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > My host is CentOS6.5 x86-64, and although I installed
> > > > > > > > > > tdb.so into my host, i still cannot reproduce it.
> > > > > > > > > >
> > > > > > > > > > And, I have exported
> > > > > > > > > > PYTHONPATH=3D${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_D=
IR}
> > > > > > > > > > in waf-samba.bbclasss which is inherited by libldb. IMO,
> > > > > > > > > > it should find modules in PYTHONPATH firstly.
> > > > > > > > > >
> > > > > > > > > > Thanks
> > > > > > > > > >  Bian
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > On Tue, Jun 23, 2015 at 7:47 AM, Bian, Naimeng
> > > > > > > > > > > <biannm@cn.fujitsu.com>
> > > > > > > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > From:
> > > > > > > > > > > > > openembedded-devel-bounces@lists.openembedded.org
> > > > > > > > > > > > > [mailto:openembedded-devel-bounces@lists.openembed
> > > > > > > > > > > > > de d.or g] On Behalf Of Martin Jansa
> > > > > > > > > > > > > Sent: Friday, June 19, 2015 11:57 PM
> > > > > > > > > > > > > To: openembedded-devel@lists.openembedded.org
> > > > > > > > > > > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb:
> > > > > > > > > > > > > add new recipe
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Wed, Jun 17, 2015 at 03:49:09PM +0800, Bian Na=
imeng
> > wrote:
> > > > > > > > > > > > > > libldb is required by samba4
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Signed-off-by: Bian Naimeng
> > > > > > > > > > > > > > <biannm@cn.fujitsu.com>
> > > > > > > > > > > > > > ---
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > .../do-not-import-target-module-in-configure.pat
> > > > > > > > > > > > > > ch
> > > > > > > > > > > > > > |
> > > > > > > > > > > > > > 32
> > > > > > > > > > > > +++++++++++++++
> > > > > > > > > > > > > >  meta-oe/recipes-support/libldb/libldb_1.1.17.b=
b    |
> > > 45
> > > > > > > > > > > > > ++++++++++++++++++++++
> > > > > > > > > > > > > >  2 files changed, 77 insertions(+)  create mode
> > > > > > > > > > > > > > 100644
> > > > > > > > > > > > > > meta-oe/recipes-support/libldb/libldb/do-not-imp
> > > > > > > > > > > > > > or
> > > > > > > > > > > > > > t-ta
> > > > > > > > > > > > > > rget
> > > > > > > > > > > > > > -modul
> > > > > > > > > > > > > > e- in-c onfigure.patch  create mode 100644
> > > > > > > > > > > > > > meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> > > > > > > > > > > > >
> > > > > > > > > > > > > Fails to build in bitbake world:
> > > > > > > > > > > > >
> > > > > > > > > > > > > | Checking for system tdb >=3D
> > > > > > > > > > > > > 1.2.13                                           =
      :
> > > yes
> > > > > > > > > > > > > | ERROR: Python module pytdb of version 1.2.13 not
> > > > > > > > > > > > > | found, and bundling disabled
> > > > > > > > > > > > > | WARNING: exit code 1 from a shell command.
> > > > > > > > > > > > > | ERROR: Function failed: do_configure (log file
> > > > > > > > > > > > > | is located at
> > > > > > > > > > > > > | /home/jenkins/oe/world/shr-core/tmp-glibc/work/c
> > > > > > > > > > > > > | or
> > > > > > > > > > > > > | e2-6
> > > > > > > > > > > > > | 4-oe
> > > > > > > > > > > > > | -linux
> > > > > > > > > > > > > | /l
> > > > > > > > > > > > > | ibld
> > > > > > > > > > > > > | b/1.1.17-r0/temp/log.do_configure.22697)
> > > > > > > > > > > > > NOTE: recipe libldb-1.1.17-r0: task do_configure:
> > > > > > > > > > > > > Failed
> > > > > > > > > > > > > ERROR: Task 25505
> > > > > > > > > > > > >
> > > > > > > > > > > > (/home/jenkins/oe/world/shr-core/meta-openembedded/m
> > > > > > > > > > > > et
> > > > > > > > > > > > a-oe
> > > > > > > > > > > > /rec
> > > > > > > > > > > > ipes-s
> > > > > > > > > > > > up
> > > > > > > > > > > > port
> > > > > > > > > > > > > /libldb/libldb_1.1.17.bb, do_configure) failed
> > > > > > > > > > > > > with exit code
> > > > > '1'
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > tdb.so is provided by libtdb which is DEPEND-ed by
> > > > > > > > > > > > libldb, I think it should be installed into
> > > > > > > STAGING_DIR_HOST/PYTHON_SITEPACKAGES_DIR.
> > > > > > > > > > > >
> > > > > > > > > > > > Because I could not reproduce it in my building,
> > > > > > > > > > > > would you mind telling me whether does tdb.so exist
> > > > > > > > > > > > in STAGING_DIR_HOST/PYTHON_SITEPACKAGES_DIR/ while
> > > > > > > > > > > > this error was
> > > > > caught.
> > > > > > > > > > > >
> > > > > > > > > > > > Thanks
> > > > > > > > > > > >  Bian
> > > > > > > > > > > >
> > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > a/meta-oe/recipes-support/libldb/libldb/do-not-i
> > > > > > > > > > > > > > mp
> > > > > > > > > > > > > > ort-
> > > > > > > > > > > > > > targ
> > > > > > > > > > > > > > et-mod
> > > > > > > > > > > > > > ul
> > > > > > > > > > > > > > e-in
> > > > > > > > > > > > > > -configure.patch
> > > > > > > > > > > > > > b/meta-oe/recipes-support/libldb/libldb/do-not-i
> > > > > > > > > > > > > > mp
> > > > > > > > > > > > > > ort-
> > > > > > > > > > > > > > targ
> > > > > > > > > > > > > > et-mod
> > > > > > > > > > > > > > ul
> > > > > > > > > > > > > > e-in
> > > > > > > > > > > > > > -configure.patch new file mode 100644 index
> > > > > > > > > > > > > > 0000000..b4d522a
> > > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > > +++ b/meta-oe/recipes-support/libldb/libldb/do-n
> > > > > > > > > > > > > > +++ ot
> > > > > > > > > > > > > > +++ -imp
> > > > > > > > > > > > > > +++ ort-
> > > > > > > > > > > > > > +++ target
> > > > > > > > > > > > > > +++ -m
> > > > > > > > > > > > > > +++ odul
> > > > > > > > > > > > > > +++ e-in-configure.patch
> > > > > > > > > > > > > > @@ -0,0 +1,32 @@
> > > > > > > > > > > > > > +Some module can be loaded while cross compile,
> > > > > > > > > > > > > > +we jst check whether the module exist
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +Signed-off-by: Bian Naimeng
> > > > > > > > > > > > > > +<biannm@cn.fujitsu.com>
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +---
> > > > > > > > > > > > > > +ldb-1.1.17.orig/buildtools/wafsamba/samba_bundl
> > > > > > > > > > > > > > +ed
> > > > > > > > > > > > > > +.py
> > > > > > > > > > 2014-05-05
> > > > > > > > > > > > > 17:00:41.000000000 +0900
> > > > > > > > > > > > > > ++++ ldb-1.1.17/buildtools/wafsamba/samba_bundl=
ed.
> > > > > > > > > > > > > > ++++ py
> > > > > > > > > > 2015-06-15
> > > > > > > > > > > > > 10:09:50.210000217 +0900
> > > > > > > > > > > > > > +@@ -1,7 +1,7 @@  # functions to support bundled
> > > > > > > > > > > > > > +libraries
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > + from Configure import conf -import sys, Logs
> > > > > > > > > > > > > > ++import sys, Logs, imp
> > > > > > > > > > > > > > + from samba_utils import *
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > + def PRIVATE_NAME(bld, name, private_extension,
> > > > > private_library):
> > > > > > > > > > > > > > +@@ -222,6 +222,16 @@ def
> > > > > > > > > > > > > > +CHECK_BUNDLED_SYSTEM_PYTHON(conf,
> > > > > li
> > > > > > > > > > > > > > +         m =3D __import__(modulename)
> > > > > > > > > > > > > > +     except ImportError:
> > > > > > > > > > > > > > +         found =3D False
> > > > > > > > > > > > > > ++
> > > > > > > > > > > > > > ++        build_arch =3D os.environ["BUILD_ARCH=
"]
> > > > > > > > > > > > > > ++        host_arch =3D os.environ["HOST_ARCH"]
> > > > > > > > > > > > > > ++        if build_arch !=3D host_arch:
> > > > > > > > > > > > > > ++            # Some modules maybe can not be
> > > > > > > > > > > > > > ++ imported while cross
> > > > > > > > > > > > compile
> > > > > > > > > > > > > > ++            # We just check whether the modul=
e exist
> > > > > > > > > > > > > > ++            stuff =3D
> > > > > > > > > > > > > > ++ imp.find_module(modulename,
> > > > > > > > > > > > > [os.environ["PYTHONPATH"]])
> > > > > > > > > > > > > > ++            if stuff !=3D None:
> > > > > > > > > > > > > > ++                Logs.warn('Cross module[%s]
> > > > > > > > > > > > > > ++ has been found, but can
> > > > > > > > > > > > not
> > > > > > > > > > > > > be loaded.' % (stuff[1]))
> > > > > > > > > > > > > > ++                found =3D True
> > > > > > > > > > > > > > +     else:
> > > > > > > > > > > > > > +         try:
> > > > > > > > > > > > > > +             version =3D m.__version__
> > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > a/meta-oe/recipes-support/libldb/libldb_1.1.17.b
> > > > > > > > > > > > > > b
> > > > > > > > > > > > > > b/meta-oe/recipes-support/libldb/libldb_1.1.17.b
> > > > > > > > > > > > > > b new file mode 100644 index 0000000..17607f7
> > > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > > +++ b/meta-oe/recipes-support/libldb/libldb_1.1.
> > > > > > > > > > > > > > +++ 17
> > > > > > > > > > > > > > +++ .bb
> > > > > > > > > > > > > > @@ -0,0 +1,45 @@
> > > > > > > > > > > > > > +SUMMARY =3D "Hierarchical, reference counted
> > > > > > > > > > > > > > +memory pool system with
> > > > > > > > > > > > > destructors"
> > > > > > > > > > > > > > +HOMEPAGE =3D "http://ldb.samba.org"
> > > > > > > > > > > > > > +SECTION =3D "libs"
> > > > > > > > > > > > > > +LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +DEPENDS +=3D "libtdb talloc libtevent libtdb"
> > > > > > > > > > > > > > +RDEPENDS_${PN} +=3D "libtevent popt libtalloc"
> > > > > > > > > > > > > > +RDEPENDS_pyldb +=3D "python libtdb libtalloc"
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +SRC_URI =3D
> > > > > > > > > > > > > > +"http://samba.org/ftp/ldb/ldb-${PV}.tar.gz
> > > > > > > > > > > > > > +\
> > > > > > > > > > > > > > +
> > > > > > > file://do-not-import-target-module-in-configure.patch"
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +LIC_FILES_CHKSUM =3D
> > > > > > > > > > > > >
> > > > > > > > > > > > "file://${COREBASE}/meta/files/common-licenses/LGPL=
-3.
> > > > > > > > > > > > 0;md
> > > > > > > > > > > > 5=3Dbf
> > > > > > > > > > > > ccfe95
> > > > > > > > > > > > 22
> > > > > > > > > > > > 69ff
> > > > > > > > > > > > > f2b407dd11f2f3083b \
> > > > > > > > > > > > > > +
> > > > > > > > > > > > >
> > > > > > > > > > > > file://${COREBASE}/meta/files/common-licenses/LGPL-2
> > > > > > > > > > > > .1
> > > > > > > > > > > > ;md5
> > > > > > > > > > > > =3D1a6
> > > > > > > > > > > > d268fd
> > > > > > > > > > > > 21
> > > > > > > > > > > > 8675
> > > > > > > > > > > > > ffea8be556788b780 \
> > > > > > > > > > > > > > +
> > > > > > > > > > > > >
> > > > > > > > > > > > file://${COREBASE}/meta/files/common-licenses/GPL-3.
> > > > > > > > > > > > 0;
> > > > > > > > > > > > md5=3D
> > > > > > > > > > > > c79f
> > > > > > > > > > > > f39f19
> > > > > > > > > > > > df
> > > > > > > > > > > > ec6d
> > > > > > > > > > > > > 293b95dea7b07891"
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +SRC_URI[md5sum] =3D "7c2ab4e3f2a4186493aa06eab=
bc61cc0"
> > > > > > > > > > > > > > +SRC_URI[sha256sum] =3D
> > > > > > > > > > > > >
> > > > > > > "b9a312aad19e9463716d257d8f2529fd7fc1a5ef24f6dcdc0c4a1930d7bd=
b6e6"
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +inherit waf-samba
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +S =3D "${WORKDIR}/ldb-${PV}"
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +EXTRA_OECONF +=3D "--disable-rpath \
> > > > > > > > > > > > > > +                 --disable-rpath-install \
> > > > > > > > > > > > > > +                 --bundled-libraries=3DNONE \
> > > > > > > > > > > > > > +                 --builtin-libraries=3Dreplace=
 \
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +--with-modulesdir=3D${libdir}/ldb/modules
> > > > > \
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > + --with-privatelibdir=3D${libdir}/ldb \
> > > > > > > > > > > > > > +
> > > > > --with-libiconv=3D${STAGING_DIR_HOST}${prefix}\
> > > > > > > > > > > > > > +                "
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +PACKAGES +=3D "pyldb pyldb-dbg pyldb-dev"
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +FILES_${PN} +=3D "${libdir}/ldb/*"
> > > > > > > > > > > > > > +FILES_${PN}-dbg +=3D "${libdir}/ldb/.debug/* \
> > > > > > > > > > > > > > +                    ${libdir}/ldb/modules/ldb/=
=2Edebug/*"
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +FILES_pyldb =3D
> > > > > > > > > > > > > > +"${libdir}/python${PYTHON_BASEVERSION}/site-pac
> > > > > > > > > > > > > > +ka
> > > > > > > > > > > > > > +ges/
> > > > > > > > > > > > > > +*
> > > > > > > > > > > \
> > > > > > > > > > > > > > +               ${libdir}/libpyldb-util.so.1 \
> > > > > > > > > > > > > > +               ${libdir}/libpyldb-util.so.1.1.=
17 \
> > > > > > > > > > > > > > +              "
> > > > > > > > > > > > > > +FILES_pyldb-dbg =3D
> > > > > > > > > > > > > "${libdir}/python${PYTHON_BASEVERSION}/site-packag
> > > > > > > > > > > > > es
> > > > > > > > > > > > > /.de
> > > > > > > > > > > > > bug
> > > > > > > > > > > > > \
> > > > > > > > > > > > > > +
> > > ${libdir}/.debug/libpyldb-util.so.1.1.17"
> > > > > > > > > > > > > > +FILES_pyldb-dev =3D "${libdir}/libpyldb-util.s=
o"
> > > > > > > > > > > > > > --
> > > > > > > > > > > > > > 1.9.1
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > --
> > > > > > > > > > > > > > _______________________________________________
> > > > > > > > > > > > > > Openembedded-devel mailing list
> > > > > > > > > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > > > > > > > > http://lists.openembedded.org/mailman/listinfo/o
> > > > > > > > > > > > > > pe
> > > > > > > > > > > > > > nemb
> > > > > > > > > > > > > > edde
> > > > > > > > > > > > > > d-deve
> > > > > > > > > > > > > > l
> > > > > > > > > > > > >
> > > > > > > > > > > > > --
> > > > > > > > > > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmai=
l.com
> > > > > > > > > > > > --
> > > > > > > > > > > > _______________________________________________
> > > > > > > > > > > > Openembedded-devel mailing list
> > > > > > > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > > > > > > http://lists.openembedded.org/mailman/listinfo/opene
> > > > > > > > > > > > mb
> > > > > > > > > > > > edde
> > > > > > > > > > > > d-de
> > > > > > > > > > > > vel
> > > > > > > > > > > >
> > > > > > > > > > > --
> > > > > > > > > > > _______________________________________________
> > > > > > > > > > > Openembedded-devel mailing list
> > > > > > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > > > > > http://lists.openembedded.org/mailman/listinfo/openemb
> > > > > > > > > > > ed
> > > > > > > > > > > ded-
> > > > > > > > > > > deve
> > > > > > > > > > > l
> > > > > > > > > > --
> > > > > > > > > > _______________________________________________
> > > > > > > > > > Openembedded-devel mailing list
> > > > > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > > > > http://lists.openembedded.org/mailman/listinfo/openembed
> > > > > > > > > > de
> > > > > > > > > > d-de
> > > > > > > > > > vel
> > > > > > > > > --
> > > > > > > > > _______________________________________________
> > > > > > > > > Openembedded-devel mailing list
> > > > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > > > http://lists.openembedded.org/mailman/listinfo/openembedde
> > > > > > > > > d-
> > > > > > > > > deve
> > > > > > > > > l
> > > > > > > >
> > > > > > > > --
> > > > > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > > > > --
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-deve
> > > > > > l
> > > > >
> > > > > --
> > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW/NtMACgkQN1Ujt2V2gByTWwCfRaIXK98ZUOg1JRw9GBPNvUQA
6RAAn3zpdIr4iKsJk0dlPd81z9R7GYvJ
=eKBk
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
