Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5F58373E20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 10:41:52 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so104686173wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s/KGcaksIhF2pccuf7b685d6ZkvzMTKRqQKhJ7UFeq4=;
	b=SnuIEzFOrkRR3uUNY/L2tju0oPn2BvUUYuJ3fOzM5klk1sunh5O0UGmS3l6EI2bWRS
	gb7qX+K8aaFXPbXviabyXK3vvMz43B239SB9oTyJ4lX1m86MUu6JheIwzAjR9KOsilVk
	9lMaIrA4+FFbqRGCUlasq106fjw7h9mlBPDJkqylkgXCj7+T2wrkg5r7HXmZNVrGGI7o
	LCssAootVNSRX9/fBAx2UOfk7xJlJQ/Ws/9JsC9SCMTrLCVZN4GzUGEojsOp0Clu01Fq
	kZZUbMz7jJr2I5vXvU+o9P6l4Psa1XUA/uAL2iKbgGgUJrLE0bgdtuTBEYF7x9Dafy3V
	kBBA==
X-Received: by 10.194.59.100 with SMTP id y4mr12561338wjq.151.1439894512575;
	Tue, 18 Aug 2015 03:41:52 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	k4sm20779121wix.19.2015.08.18.03.41.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 03:41:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 12:41:55 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150818104155.GB13732@jama>
References: <20150708103237.GA2398@jama> <20150708115915.GF2398@jama>
	<30DC4EDFD798C94083F3E083754532CC73E188EA@G08CNEXMBPEKD02.g08.fujitsu.local>
	<20150709155406.GD2446@jama>
	<30DC4EDFD798C94083F3E083754532CC73E18F05@G08CNEXMBPEKD02.g08.fujitsu.local>
	<20150713161727.GA2407@jama>
	<30DC4EDFD798C94083F3E083754532CC73E1AAE5@G08CNEXMBPEKD02.g08.fujitsu.local>
	<30DC4EDFD798C94083F3E083754532CC01197E4B47@G08CNEXMBPEKD03.g08.fujitsu.local>
	<20150803093932.GA2465@jama>
	<30DC4EDFD798C94083F3E083754532CC011C1F4DD3@G08CNEXMBPEKD03.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC011C1F4DD3@G08CNEXMBPEKD03.g08.fujitsu.local>
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
X-List-Received-Date: Tue, 18 Aug 2015 10:41:54 -0000
X-Groupsio-MsgNum: 56767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline

--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2015 at 06:57:08AM +0000, Bian, Naimeng wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Martin Jansa
> > Sent: Monday, August 03, 2015 5:40 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new recipe
> >=20
> > On Mon, Aug 03, 2015 at 08:58:04AM +0000, Bian, Naimeng wrote:
> > > Hi Martin
> > >
> > > Thanks a lot for your help.
> > > The patchset has been removed from master-next, does it mean I should=
 re-send
> > it again.
> > > If not, would you telling me what should I do at the next-step.
> >=20
> > It was still failing with updated libldb and samba, so I've moved it fr=
om
> > master-next to contrib/jansa/master-next-unresolved-review and I'm wait=
ing
> > for updated version.
> >=20
>=20
> I have pushed the updated patch to my git-hub tree.
> Because I just updated the patch of libldb and samba, so please rebase th=
em from there.
>=20
> - libldb
>   https://github.com/bendaaron/meta-oe-dev/commit/972123f0722033ddc7d1c8f=
eb2eb0479ea774edb
>=20
> - samba
>   https://github.com/bendaaron/meta-oe-dev/commit/c14b4b8ef8827d305bdd680=
cb0e8a00e08b8fba0
>=20
> If you think that it's better to re-send patcheset to this ML, I will do =
it.

I've taken all 7 commits before c14b4b8ef8827d305bdd680cb0e8a00e08b8fba0
to master-next, lets see if it helps.

Please work with Koen to compare your implementations and find good
version which works for all.

http://lists.openembedded.org/pipermail/openembedded-devel/2015-August/1026=
24.html

>=20
> Thanks
>  Bian
>=20
> > > Thanks
> > >  Bian
> > >
> > > > -----Original Message-----
> > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > > > Of Bian, Naimeng
> > > > Sent: Friday, July 17, 2015 3:40 PM
> > > > To: openembedded-devel@lists.openembedded.org
> > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new recipe
> > > >
> > > > Thanks for your help.
> > > >
> > > > Please rebase the patch of libldb and samba from here.
> > > > - libldb
> > > >
> > > > https://github.com/bendaaron/meta-oe-dev/commit/f7a7d49164c8f5a4e8b1
> > > > 2ccdc9
> > > > 2e08d73952a97c
> > > >
> > > > - samba
> > > >
> > > > https://github.com/bendaaron/meta-oe-dev/commit/db03404a4b6fed975345
> > > > 7055fe
> > > > c88b523ceeda3c
> > > >
> > > > Thanks
> > > >  Bian
> > > >
> > > > > -----Original Message-----
> > > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> > > > > Behalf Of Martin Jansa
> > > > > Sent: Tuesday, July 14, 2015 12:17 AM
> > > > > To: openembedded-devel@lists.openembedded.org
> > > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new recipe
> > > > >
> > > > > On Fri, Jul 10, 2015 at 03:49:02AM +0000, Bian, Naimeng wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > > > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> > > > > > > Behalf Of Martin Jansa
> > > > > > > Sent: Thursday, July 09, 2015 11:54 PM
> > > > > > > To: openembedded-devel@lists.openembedded.org
> > > > > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new
> > > > > > > recipe
> > > > > > >
> > > > > > > On Thu, Jul 09, 2015 at 12:30:42AM +0000, Bian, Naimeng wrote:
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > > > > > > [mailto:openembedded-devel-bounces@lists.openembedded.org]
> > > > > > > > > On Behalf Of Martin Jansa
> > > > > > > > > Sent: Wednesday, July 08, 2015 7:59 PM
> > > > > > > > > To: openembedded-devel@lists.openembedded.org
> > > > > > > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new
> > > > > > > > > recipe
> > > > > > > > >
> > > > > > > > > On Wed, Jul 08, 2015 at 12:32:37PM +0200, Martin Jansa wr=
ote:
> > > > > > > > > > On Thu, Jul 02, 2015 at 09:01:14AM +0000, Bian, Naimeng=
 wrote:
> > > > > > > > > > > Hi Martin,
> > > > > > > > > > >
> > > > > > > > > > > I think I have fixed them and pushed them to github,
> > > > > > > > > > > please cherry-pick
> > > > > > > > > them.
> > > > > > > > > > >
> > > > > > > > > > > - libldb
> > > > > > > > > > >
> > > > > > > > > > > https://github.com/bendaaron/meta-oe-dev/commit/c6cade
> > > > > > > > > > > 4236
> > > > > > > > > > > 22
> > > > > > > > > > > 6646
> > > > > > > > > > > fde9
> > > > > > > > > > > 9611c20fe3fcc6612e7a
> > > > > > > > > >
> > > > > > > > > > Hi Bian,
> > > > > > > > > >
> > > > > > > > > > it's still failing with this patch. I'll try to build it
> > > > > > > > > > manually and provide more details.
> > > > > > > > >
> > > > > > > > > find /usr/lib/python* -name \*tdb\* =3Dnothing=3D
> > > > > > > > >
> > > > > > > > > ldb and tdb workdirs are here:
> > > > > > > > > http://logs.nslu2-linux.org/buildlogs/oe/world/libldb.tar.
> > > > > > > > > bz2
> > > > > > > > > http://logs.nslu2-linux.org/buildlogs/oe/world/libtdb.tar.
> > > > > > > > > bz2
> > > > > > > > >
> > > > > > > >
> > > > > > > > Thank you very much.
> > > > > > > > I confirmed that tdb.so is exists in
> > > > > > > > ${D}/usr/lib/python2.7/site-packages
> > > > > > > of libtdb.
> > > > > > > >
> > > > > > > > Would you helping me check whether does tdb.so exist in
> > > > > > > > ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}
> > > > > > > > after building libtdb.
> > > > > > > > # find
> > > > > > > > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-6
> > > > > > > > 4/us r/ lib/ python2.7/site-packages -name \*tdb\*
> > > > > > >
> > > > > > > that server is already buiding domething else and tmpfs is
> > > > > > > gone, but in the archive I've sent you we can see that it's in
> > > > > > > sysroot-destdir directory so I believe it was also in
> > > > > > > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/
> > > > > > > usr/
> > > > > > > li
> > > > > > > b/pyth
> > > > > > > on2.7/site-packages
> > > > > > >
> > > > > > > jenkins@aruba:~/oe/world/shr-core$ find libtdb/ -name tdb.so
> > > > > > > libtdb/1.3.0-r0/image/usr/lib/python2.7/site-packages/tdb.so
> > > > > > > libtdb/1.3.0-r0/package/usr/lib/python2.7/site-packages/.debug
> > > > > > > /tdb
> > > > > > > .s o
> > > > > > > libtdb/1.3.0-r0/package/usr/lib/python2.7/site-packages/tdb.so
> > > > > > > libtdb/1.3.0-r0/packages-split/python-tdb/usr/lib/python2.7/si
> > > > > > > te-p
> > > > > > > ac
> > > > > > > kages/
> > > > > > > tdb.so
> > > > > > > libtdb/1.3.0-r0/packages-split/python-tdb-dbg/usr/lib/python2.
> > > > > > > 7/si
> > > > > > > te
> > > > > > > -packa
> > > > > > > ges/.debug/tdb.so
> > > > > > >
> > libtdb/1.3.0-r0/sysroot-destdir/usr/lib/python2.7/site-packages/tdb.
> > > > > > > so libtdb/1.3.0-r0/tdb-1.3.0/bin/python/tdb.so
> > > > > > >
> > > > > >
> > > > > > Thanks for your time.
> > > > > >
> > > > > > I'm sorry for that, but would you mind to apply this patch which
> > > > > > is based on master-next, and then build libldb again to catch
> > > > > > more information
> > > > > for me.
> > > > > > https://github.com/bendaaron/meta-oe-dev/commit/e1f5e847e197cf0a
> > > > > > bad5
> > > > > > 78
> > > > > > e74d9f7b8f1c3ff951
> > > > >
> > > > > | Checking for
> > > > > getgrouplist                                                     =
    :
> > ok
> > > > > | Checking for system tdb >=3D
> > > > > 1.2.13                                                 : yes
> > > > > | module[/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux8
> > > > > | 6-64 /u sr/lib/python2.7/site-packages/tdb.so] exists in
> > > > > | [/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u
> > > > > | sr/l
> > > > > | ib
> > > > > | /python2.7/site-packages] Cross
> > > > > |
> > > > > module[/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-
> > > > > 64/u sr/l ib/python2.7/site-packages/tdb.so] can not be loaded.
> > > > > | Close
> > > > > module[/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-
> > > > > 64/u sr/l ib/python2.7/site-packages/tdb.so]. Note: maybe some
> > > > > exception was caught!
> > > > > | ERROR: Python module pytdb of version 1.2.13 not found, and
> > > > > | bundling disabled
> > > > > | WARNING: exit code 1 from a shell command.
> > > > > | ERROR: Function failed: do_configure (log file is located at
> > > > > | /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux
> > > > > | /lib
> > > > > | ld
> > > > > | b/1.1.17-r0/temp/log.do_configure.15453)
> > > > > NOTE: recipe libldb-1.1.17-r0: task do_configure: Failed
> > > > >
> > > > > >
> > > > > > Thanks
> > > > > >  Bian
> > > > > >
> > > > > > > >
> > > > > > > > Thanks
> > > > > > > >  Bian
> > > > > > > >
> > > > > > > > > > > - samba
> > > > > > > > > > >
> > > > > > > > > > > https://github.com/bendaaron/meta-oe-dev/commit/25430e
> > > > > > > > > > > e92b
> > > > > > > > > > > bb
> > > > > > > > > > > 2820
> > > > > > > > > > > 294c
> > > > > > > > > > > b9ce239d9d4dccc492ea
> > > > > > > > > > >
> > > > > > > > > > > Thanks
> > > > > > > > > > >  Bian
> > > > > > > > > > >
> > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > From:
> > > > > > > > > > > > openembedded-devel-bounces@lists.openembedded.org
> > > > > > > > > > > > [mailto:openembedded-devel-bounces@lists.openembedde
> > > > > > > > > > > > d.or g] On Behalf Of Bian, Naimeng
> > > > > > > > > > > > Sent: Wednesday, June 24, 2015 3:05 PM
> > > > > > > > > > > > To: openembedded-devel@lists.openembedded.org
> > > > > > > > > > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb:
> > > > > > > > > > > > add new recipe
> > > > > > > > > > > >
> > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > From:
> > > > > > > > > > > > > openembedded-devel-bounces@lists.openembedded.org
> > > > > > > > > > > > > [mailto:openembedded-devel-bounces@lists.openembe=
dded.
> > > > > > > > > > > > > or g] On Behalf Of Martin Jansa
> > > > > > > > > > > > > Sent: Tuesday, June 23, 2015 4:05 PM
> > > > > > > > > > > > > To: openembedded-devel
> > > > > > > > > > > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb:
> > > > > > > > > > > > > add new recipe
> > > > > > > > > > > > >
> > > > > > > > > > > > > I don't have access to that build anymore (because
> > > > > > > > > > > > > it's jenkins job using tmpfs for TMPDIR, so after
> > > > > > > > > > > > > the build the TMPDIR is gone), but it's failing
> > > > > > > > > > > > > only in
> > > > > > > > > > > > > qemux86-64 builds, so I assume that it's finding
> > > > > > > > > > > > > host tdb or python directories, because it's
> > > > > > > > > > > > > running on
> > > > > > > > > > > > > 12.04 Ubuntu
> > > > > x86-64.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Try to install tdb on your build host if it allows
> > > > > > > > > > > > > you to reproduce the issue, otherwise I'll try to
> > > > > > > > > > > > > reproduce it again in some
> > > > > > > > > next jenkins build.
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > My host is CentOS6.5 x86-64, and although I
> > > > > > > > > > > > installed tdb.so into my host, i still cannot repro=
duce
> > it.
> > > > > > > > > > > >
> > > > > > > > > > > > And, I have exported
> > > > > > > > > > > > PYTHONPATH=3D${STAGING_DIR_HOST}${PYTHON_SITEPACKAG=
ES_
> > > > > > > > > > > > DIR} in waf-samba.bbclasss which is inherited by
> > > > > > > > > > > > libldb. IMO, it should find modules in PYTHONPATH
> > > > > > > > > > > > firstly.
> > > > > > > > > > > >
> > > > > > > > > > > > Thanks
> > > > > > > > > > > >  Bian
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > On Tue, Jun 23, 2015 at 7:47 AM, Bian, Naimeng
> > > > > > > > > > > > > <biannm@cn.fujitsu.com>
> > > > > > > > > > > > > wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > > > From:
> > > > > > > > > > > > > > > openembedded-devel-bounces@lists.openembedded.
> > > > > > > > > > > > > > > org
> > > > > > > > > > > > > > > [mailto:openembedded-devel-bounces@lists.opene
> > > > > > > > > > > > > > > mbed de d.or g] On Behalf Of Martin Jansa
> > > > > > > > > > > > > > > Sent: Friday, June 19, 2015 11:57 PM
> > > > > > > > > > > > > > > To: openembedded-devel@lists.openembedded.org
> > > > > > > > > > > > > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] lib=
ldb:
> > > > > > > > > > > > > > > add new recipe
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Wed, Jun 17, 2015 at 03:49:09PM +0800, Bian
> > > > > > > > > > > > > > > Naimeng
> > > > wrote:
> > > > > > > > > > > > > > > > libldb is required by samba4
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Signed-off-by: Bian Naimeng
> > > > > > > > > > > > > > > > <biannm@cn.fujitsu.com>
> > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > .../do-not-import-target-module-in-configure
> > > > > > > > > > > > > > > > .pat
> > > > > > > > > > > > > > > > ch
> > > > > > > > > > > > > > > > |
> > > > > > > > > > > > > > > > 32
> > > > > > > > > > > > > > +++++++++++++++
> > > > > > > > > > > > > > > >  meta-oe/recipes-support/libldb/libldb_1.1.=
17.bb
> > |
> > > > > 45
> > > > > > > > > > > > > > > ++++++++++++++++++++++
> > > > > > > > > > > > > > > >  2 files changed, 77 insertions(+)  create
> > > > > > > > > > > > > > > > mode
> > > > > > > > > > > > > > > > 100644
> > > > > > > > > > > > > > > > meta-oe/recipes-support/libldb/libldb/do-not
> > > > > > > > > > > > > > > > -imp
> > > > > > > > > > > > > > > > or
> > > > > > > > > > > > > > > > t-ta
> > > > > > > > > > > > > > > > rget
> > > > > > > > > > > > > > > > -modul
> > > > > > > > > > > > > > > > e- in-c onfigure.patch  create mode 100644
> > > > > > > > > > > > > > > > meta-oe/recipes-support/libldb/libldb_1.1.17
> > > > > > > > > > > > > > > > .bb
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Fails to build in bitbake world:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > | Checking for system tdb >=3D
> > > > > > > > > > > > > > >
> > 1.2.13                                                 :
> > > > > yes
> > > > > > > > > > > > > > > | ERROR: Python module pytdb of version 1.2.13
> > > > > > > > > > > > > > > | not found, and bundling disabled
> > > > > > > > > > > > > > > | WARNING: exit code 1 from a shell command.
> > > > > > > > > > > > > > > | ERROR: Function failed: do_configure (log
> > > > > > > > > > > > > > > | file is located at
> > > > > > > > > > > > > > > | /home/jenkins/oe/world/shr-core/tmp-glibc/wo
> > > > > > > > > > > > > > > | rk/c
> > > > > > > > > > > > > > > | or
> > > > > > > > > > > > > > > | e2-6
> > > > > > > > > > > > > > > | 4-oe
> > > > > > > > > > > > > > > | -linux
> > > > > > > > > > > > > > > | /l
> > > > > > > > > > > > > > > | ibld
> > > > > > > > > > > > > > > | b/1.1.17-r0/temp/log.do_configure.22697)
> > > > > > > > > > > > > > > NOTE: recipe libldb-1.1.17-r0: task do_config=
ure:
> > > > > > > > > > > > > > > Failed
> > > > > > > > > > > > > > > ERROR: Task 25505
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > (/home/jenkins/oe/world/shr-core/meta-openembedd
> > > > > > > > > > > > > > ed/m
> > > > > > > > > > > > > > et
> > > > > > > > > > > > > > a-oe
> > > > > > > > > > > > > > /rec
> > > > > > > > > > > > > > ipes-s
> > > > > > > > > > > > > > up
> > > > > > > > > > > > > > port
> > > > > > > > > > > > > > > /libldb/libldb_1.1.17.bb, do_configure) failed
> > > > > > > > > > > > > > > with exit code
> > > > > > > '1'
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > tdb.so is provided by libtdb which is DEPEND-ed
> > > > > > > > > > > > > > by libldb, I think it should be installed into
> > > > > > > > > STAGING_DIR_HOST/PYTHON_SITEPACKAGES_DIR.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Because I could not reproduce it in my building,
> > > > > > > > > > > > > > would you mind telling me whether does tdb.so
> > > > > > > > > > > > > > exist in
> > > > > > > > > > > > > > STAGING_DIR_HOST/PYTHON_SITEPACKAGES_DIR/ while
> > > > > > > > > > > > > > this error was
> > > > > > > caught.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Thanks
> > > > > > > > > > > > > >  Bian
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > > a/meta-oe/recipes-support/libldb/libldb/do-n
> > > > > > > > > > > > > > > > ot-i
> > > > > > > > > > > > > > > > mp
> > > > > > > > > > > > > > > > ort-
> > > > > > > > > > > > > > > > targ
> > > > > > > > > > > > > > > > et-mod
> > > > > > > > > > > > > > > > ul
> > > > > > > > > > > > > > > > e-in
> > > > > > > > > > > > > > > > -configure.patch
> > > > > > > > > > > > > > > > b/meta-oe/recipes-support/libldb/libldb/do-n
> > > > > > > > > > > > > > > > ot-i
> > > > > > > > > > > > > > > > mp
> > > > > > > > > > > > > > > > ort-
> > > > > > > > > > > > > > > > targ
> > > > > > > > > > > > > > > > et-mod
> > > > > > > > > > > > > > > > ul
> > > > > > > > > > > > > > > > e-in
> > > > > > > > > > > > > > > > -configure.patch new file mode 100644 index
> > > > > > > > > > > > > > > > 0000000..b4d522a
> > > > > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > > > > +++ b/meta-oe/recipes-support/libldb/libldb/
> > > > > > > > > > > > > > > > +++ do-n
> > > > > > > > > > > > > > > > +++ ot
> > > > > > > > > > > > > > > > +++ -imp
> > > > > > > > > > > > > > > > +++ ort-
> > > > > > > > > > > > > > > > +++ target
> > > > > > > > > > > > > > > > +++ -m
> > > > > > > > > > > > > > > > +++ odul
> > > > > > > > > > > > > > > > +++ e-in-configure.patch
> > > > > > > > > > > > > > > > @@ -0,0 +1,32 @@
> > > > > > > > > > > > > > > > +Some module can be loaded while cross
> > > > > > > > > > > > > > > > +compile, we jst check whether the module
> > > > > > > > > > > > > > > > +exist
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +Signed-off-by: Bian Naimeng
> > > > > > > > > > > > > > > > +<biannm@cn.fujitsu.com>
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +---
> > > > > > > > > > > > > > > > +ldb-1.1.17.orig/buildtools/wafsamba/samba_b
> > > > > > > > > > > > > > > > +undl
> > > > > > > > > > > > > > > > +ed
> > > > > > > > > > > > > > > > +.py
> > > > > > > > > > > > 2014-05-05
> > > > > > > > > > > > > > > 17:00:41.000000000 +0900
> > > > > > > > > > > > > > > > ++++ ldb-1.1.17/buildtools/wafsamba/samba_b=
undled.
> > > > > > > > > > > > > > > > ++++ py
> > > > > > > > > > > > 2015-06-15
> > > > > > > > > > > > > > > 10:09:50.210000217 +0900
> > > > > > > > > > > > > > > > +@@ -1,7 +1,7 @@  # functions to support
> > > > > > > > > > > > > > > > +bundled libraries
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > + from Configure import conf -import sys,
> > > > > > > > > > > > > > > > + Logs
> > > > > > > > > > > > > > > > ++import sys, Logs, imp
> > > > > > > > > > > > > > > > + from samba_utils import *
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > + def PRIVATE_NAME(bld, name,
> > > > > > > > > > > > > > > > + private_extension,
> > > > > > > private_library):
> > > > > > > > > > > > > > > > +@@ -222,6 +222,16 @@ def
> > > > > > > > > > > > > > > > +CHECK_BUNDLED_SYSTEM_PYTHON(conf,
> > > > > > > li
> > > > > > > > > > > > > > > > +         m =3D __import__(modulename)
> > > > > > > > > > > > > > > > +     except ImportError:
> > > > > > > > > > > > > > > > +         found =3D False
> > > > > > > > > > > > > > > > ++
> > > > > > > > > > > > > > > > ++        build_arch =3D os.environ["BUILD_=
ARCH"]
> > > > > > > > > > > > > > > > ++        host_arch =3D os.environ["HOST_AR=
CH"]
> > > > > > > > > > > > > > > > ++        if build_arch !=3D host_arch:
> > > > > > > > > > > > > > > > ++            # Some modules maybe can not
> > > > > > > > > > > > > > > > ++ be imported while cross
> > > > > > > > > > > > > > compile
> > > > > > > > > > > > > > > > ++            # We just check whether the m=
odule
> > exist
> > > > > > > > > > > > > > > > ++            stuff =3D
> > > > > > > > > > > > > > > > ++ imp.find_module(modulename,
> > > > > > > > > > > > > > > [os.environ["PYTHONPATH"]])
> > > > > > > > > > > > > > > > ++            if stuff !=3D None:
> > > > > > > > > > > > > > > > ++                Logs.warn('Cross
> > > > > > > > > > > > > > > > ++ module[%s] has been found, but can
> > > > > > > > > > > > > > not
> > > > > > > > > > > > > > > be loaded.' % (stuff[1]))
> > > > > > > > > > > > > > > > ++                found =3D True
> > > > > > > > > > > > > > > > +     else:
> > > > > > > > > > > > > > > > +         try:
> > > > > > > > > > > > > > > > +             version =3D m.__version__
> > > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > > a/meta-oe/recipes-support/libldb/libldb_1.1.
> > > > > > > > > > > > > > > > 17.b
> > > > > > > > > > > > > > > > b
> > > > > > > > > > > > > > > > b/meta-oe/recipes-support/libldb/libldb_1.1.
> > > > > > > > > > > > > > > > 17.b b new file mode 100644 index
> > > > > > > > > > > > > > > > 0000000..17607f7
> > > > > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > > > > +++ b/meta-oe/recipes-support/libldb/libldb=
_1.1.
> > > > > > > > > > > > > > > > +++ 17
> > > > > > > > > > > > > > > > +++ .bb
> > > > > > > > > > > > > > > > @@ -0,0 +1,45 @@
> > > > > > > > > > > > > > > > +SUMMARY =3D "Hierarchical, reference count=
ed
> > > > > > > > > > > > > > > > +memory pool system with
> > > > > > > > > > > > > > > destructors"
> > > > > > > > > > > > > > > > +HOMEPAGE =3D "http://ldb.samba.org"
> > > > > > > > > > > > > > > > +SECTION =3D "libs"
> > > > > > > > > > > > > > > > +LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3=
=2E0+"
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +DEPENDS +=3D "libtdb talloc libtevent libt=
db"
> > > > > > > > > > > > > > > > +RDEPENDS_${PN} +=3D "libtevent popt libtal=
loc"
> > > > > > > > > > > > > > > > +RDEPENDS_pyldb +=3D "python libtdb libtall=
oc"
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +SRC_URI =3D
> > > > > > > > > > > > > > > > +"http://samba.org/ftp/ldb/ldb-${PV}.tar.gz
> > > > > > > > > > > > > > > > +\
> > > > > > > > > > > > > > > > +
> > > > > > > > > file://do-not-import-target-module-in-configure.patch"
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +LIC_FILES_CHKSUM =3D
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > "file://${COREBASE}/meta/files/common-licenses/=
LGPL-3.
> > > > > > > > > > > > > > 0;md
> > > > > > > > > > > > > > 5=3Dbf
> > > > > > > > > > > > > > ccfe95
> > > > > > > > > > > > > > 22
> > > > > > > > > > > > > > 69ff
> > > > > > > > > > > > > > > f2b407dd11f2f3083b \
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > file://${COREBASE}/meta/files/common-licenses/LG
> > > > > > > > > > > > > > PL-2
> > > > > > > > > > > > > > .1
> > > > > > > > > > > > > > ;md5
> > > > > > > > > > > > > > =3D1a6
> > > > > > > > > > > > > > d268fd
> > > > > > > > > > > > > > 21
> > > > > > > > > > > > > > 8675
> > > > > > > > > > > > > > > ffea8be556788b780 \
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > file://${COREBASE}/meta/files/common-licenses/G=
PL-3.
> > > > > > > > > > > > > > 0;
> > > > > > > > > > > > > > md5=3D
> > > > > > > > > > > > > > c79f
> > > > > > > > > > > > > > f39f19
> > > > > > > > > > > > > > df
> > > > > > > > > > > > > > ec6d
> > > > > > > > > > > > > > > 293b95dea7b07891"
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +SRC_URI[md5sum] =3D "7c2ab4e3f2a4186493aa0=
6eabbc61cc0"
> > > > > > > > > > > > > > > > +SRC_URI[sha256sum] =3D
> > > > > > > > > > > > > > >
> > > > > > > > >
> > "b9a312aad19e9463716d257d8f2529fd7fc1a5ef24f6dcdc0c4a1930d7bdb6e6"
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +inherit waf-samba
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +S =3D "${WORKDIR}/ldb-${PV}"
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +EXTRA_OECONF +=3D "--disable-rpath \
> > > > > > > > > > > > > > > > +                 --disable-rpath-install \
> > > > > > > > > > > > > > > > +                 --bundled-libraries=3DNON=
E \
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +--builtin-libraries=3Dreplace \
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +--with-modulesdir=3D${libdir}/ldb/modules
> > > > > > > \
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > + --with-privatelibdir=3D${libdir}/ldb \
> > > > > > > > > > > > > > > > +
> > > > > > > --with-libiconv=3D${STAGING_DIR_HOST}${prefix}\
> > > > > > > > > > > > > > > > +                "
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +PACKAGES +=3D "pyldb pyldb-dbg pyldb-dev"
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +FILES_${PN} +=3D "${libdir}/ldb/*"
> > > > > > > > > > > > > > > > +FILES_${PN}-dbg +=3D "${libdir}/ldb/.debug=
/* \
> > > > > > > > > > > > > > > > +
> > ${libdir}/ldb/modules/ldb/.debug/*"
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +FILES_pyldb =3D
> > > > > > > > > > > > > > > > +"${libdir}/python${PYTHON_BASEVERSION}/site
> > > > > > > > > > > > > > > > +-pac
> > > > > > > > > > > > > > > > +ka
> > > > > > > > > > > > > > > > +ges/
> > > > > > > > > > > > > > > > +*
> > > > > > > > > > > > > \
> > > > > > > > > > > > > > > > +               ${libdir}/libpyldb-util.so.=
1 \
> > > > > > > > > > > > > > > > +               ${libdir}/libpyldb-util.so.=
1.1.17
> > \
> > > > > > > > > > > > > > > > +              "
> > > > > > > > > > > > > > > > +FILES_pyldb-dbg =3D
> > > > > > > > > > > > > > > "${libdir}/python${PYTHON_BASEVERSION}/site-pa
> > > > > > > > > > > > > > > ckag
> > > > > > > > > > > > > > > es
> > > > > > > > > > > > > > > /.de
> > > > > > > > > > > > > > > bug
> > > > > > > > > > > > > > > \
> > > > > > > > > > > > > > > > +
> > > > > ${libdir}/.debug/libpyldb-util.so.1.1.17"
> > > > > > > > > > > > > > > > +FILES_pyldb-dev =3D "${libdir}/libpyldb-ut=
il.so"
> > > > > > > > > > > > > > > > --
> > > > > > > > > > > > > > > > 1.9.1
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > --
> > > > > > > > > > > > > > > > ____________________________________________
> > > > > > > > > > > > > > > > ___ Openembedded-devel mailing list
> > > > > > > > > > > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > > > > > > > > > > http://lists.openembedded.org/mailman/listin
> > > > > > > > > > > > > > > > fo/o
> > > > > > > > > > > > > > > > pe
> > > > > > > > > > > > > > > > nemb
> > > > > > > > > > > > > > > > edde
> > > > > > > > > > > > > > > > d-deve
> > > > > > > > > > > > > > > > l
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > --
> > > > > > > > > > > > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@=
gmail.com
> > > > > > > > > > > > > > --
> > > > > > > > > > > > > > _______________________________________________
> > > > > > > > > > > > > > Openembedded-devel mailing list
> > > > > > > > > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > > > > > > > > http://lists.openembedded.org/mailman/listinfo/o
> > > > > > > > > > > > > > pene
> > > > > > > > > > > > > > mb
> > > > > > > > > > > > > > edde
> > > > > > > > > > > > > > d-de
> > > > > > > > > > > > > > vel
> > > > > > > > > > > > > >
> > > > > > > > > > > > > --
> > > > > > > > > > > > > _______________________________________________
> > > > > > > > > > > > > Openembedded-devel mailing list
> > > > > > > > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > > > > > > > http://lists.openembedded.org/mailman/listinfo/ope
> > > > > > > > > > > > > nemb
> > > > > > > > > > > > > ed
> > > > > > > > > > > > > ded-
> > > > > > > > > > > > > deve
> > > > > > > > > > > > > l
> > > > > > > > > > > > --
> > > > > > > > > > > > _______________________________________________
> > > > > > > > > > > > Openembedded-devel mailing list
> > > > > > > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > > > > > > http://lists.openembedded.org/mailman/listinfo/opene
> > > > > > > > > > > > mbed
> > > > > > > > > > > > de
> > > > > > > > > > > > d-de
> > > > > > > > > > > > vel
> > > > > > > > > > > --
> > > > > > > > > > > _______________________________________________
> > > > > > > > > > > Openembedded-devel mailing list
> > > > > > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > > > > > http://lists.openembedded.org/mailman/listinfo/openemb
> > > > > > > > > > > edde
> > > > > > > > > > > d-
> > > > > > > > > > > deve
> > > > > > > > > > > l
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > > > > > > --
> > > > > > > > _______________________________________________
> > > > > > > > Openembedded-devel mailing list
> > > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-
> > > > > > > > deve
> > > > > > > > l
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
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXTC/IACgkQN1Ujt2V2gBzXwQCffDl+wX8/yYIjtvhVYLmGXGKa
2NcAnA8BVpE2jvQnZfxtTWlweQMpoCGH
=KcAY
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
