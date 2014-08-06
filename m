Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from rediffmail.com (unknown [202.137.235.223])
	by mail.openembedded.org (Postfix) with SMTP id B7BF365E2E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 08:10:52 +0000 (UTC)
Received: (qmail 15256 invoked by uid 510); 6 Aug 2014 08:10:44 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=KVcuN8xY2DqS9Psm1D5cWmeK8QtK5VAG1eN6MHyGzhpLFVHt1af4uP+Ugd3QHzQXyonVCLgMkcHH/ZZnkbQovnVmkrdW1vVLAg9nURRZtvhiJ0iSdsTdLxBYCiD6DGz2iSp3b5EUNeMnCVK1H+djWo93WLjISNKN2zXhHmdGulQ=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160205.53E1E302.0225, ss=1, re=-2.300, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 6 Aug 2014 08:10:42 -0000
Message-ID: <20140806081042.15013.qmail@f4mail-235-223.rediffmail.com>
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Received: from unknown 103.25.205.2 by rediffmail.com via HTTP;
	06 Aug 2014 08:10:42 -0000
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Regarding net-snmp
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
X-List-Received-Date: Wed, 06 Aug 2014 08:10:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

Please help me rectify the following error:

ERROR: QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmpnetstat
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmpdelta
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmpusm
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmpbulkget
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmpstatus
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/agentxtrap
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmpwalk
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmpget
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmptranslate
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmpgetnext
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmptest
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmpdf
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmptable
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmpbulkwalk
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmptrap
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/encode_keychange
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmpvacm
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/bin/snmpset
ERROR:
 QA Issue: non -staticdev package contains static .a library: snmp path 
'/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmpagent.a'
ERROR:
 QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: snmp 
path 
'/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmp.so'
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmpmibs.so.30.0.2
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmpagent.so.30.0.2
ERROR:
 QA Issue: non -staticdev package contains static .a library: snmp path 
'/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmptrapd.a'
ERROR:
 QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: snmp 
path 
'/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmptrapd.so'
ERROR:
 QA Issue: non -staticdev package contains static .a library: snmp path 
'/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmphelpers.a'
ERROR:
 QA Issue: non -staticdev package contains static .a library: snmp path 
'/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmpmibs.a'
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmptrapd.so.30.0.2
ERROR:
 QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: snmp 
path 
'/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmpagent.so'
ERROR:
 QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: snmp 
path 
'/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmphelpers.so'
ERROR:
 QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: snmp 
path 
'/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmpmibs.so'
ERROR:
 QA Issue: non -staticdev package contains static .a library: snmp path 
'/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/libnetsnmp.a'
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/sbin/snmptrapd
ERROR:
 QA Issue: package snmp contains bad RPATH 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/image/opt/net-snmp/lib
 in file 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/sbin/snmpd
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR:
 Logfile of failure stored in: 
/home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/temp/log.do_package.6586
ERROR: Task 466 (/home/yocto/poky-dora-10.0.0/meta-msc/recipes-msc/msc/snmp.bb, do_package) failed with exit code '1'
From martin.jansa@gmail.com  Wed Aug  6 08:17:18 2014
Return-Path: <martin.jansa@gmail.com>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C6A8B65D57
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 08:17:10 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id b13so2131235wgh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 01:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WImSvJ4ecKtpVg8R8n1Y+U1+5Zm8zMI3MCxZjFg0GuQ=;
	b=WILdEtPumRv6ZQt7iCkuag7Dh8eFNb6+OI+Gn2hHRv8jmh9KIYGcdR5e54MGa0ACS5
	SZ2SIOJjQhIU4ydkrzi1dDxornYvVHuh8E6vbsiW4T+Haz/YX+o0r7liQmE7t5o45J7M
	V0aqjsJ6oLYIJp53sxBvRo8zbi5mh69mtGwPDzJxVlL3M+iQychI/FfyJC6vc+wwBBk2
	6eg8mkzLN/KMPS66Tqg+XZCuAVSNNzNZgwqKrgFa762P/phEypiGg5oB3LNlyaS0jM4H
	u2BnKkPIWk3nftdDPiSaSl5SgjHEMaFu+cIYTi5juxRU0A8iHsvWM8BViQSe9Xusy2aL
	NAAQ==
X-Received: by 10.180.221.133 with SMTP id qe5mr7324227wic.17.1407313031285;
	Wed, 06 Aug 2014 01:17:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q2sm3698416wia.19.2014.08.06.01.17.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 01:17:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 10:17:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140806081740.GA14848@jama>
References: <1406316789-27514-1-git-send-email-akuster@mvista.com>
	<53E1DC2A.5040903@windriver.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <53E1DC2A.5040903@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [oe] [meta-networking][PATCH] V4 wireshark: fix build depends
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
X-List-Received-Date: Wed, 06 Aug 2014 08:17:19 -0000


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 03:41:30PM +0800, Rongqing Li wrote:
>=20
>=20
> On 07/26/2014 03:33 AM, Armin Kuster wrote:
> > This should address issues found in test-dependencies 2014-07-25
> >
> > wireshark/wireshark/latest lost dependency on  libcap libnl libnl-genl =
libnl-nf libnl-route portaudio-v19 sbc
> >
> > Signed-off-by: Armin Kuster <akuster@mvista.com>
> > ---
> >   meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb | 2=
 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0=
-rc2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> > index 5d6df40..b965fdf 100644
> > --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> > +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> > @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.wireshark.org"
> >   SECTION =3D "network"
> >   LICENSE =3D "GPL-2.0"
> >
> > -DEPENDS =3D "perl-native libpcap pcre expat glib-2.0 libsmi"
> > +DEPENDS =3D "perl-native libcap libpcap pcre expat glib-2.0 libsmi lib=
nl portaudio-v19 sbc"
> >
> >   inherit autotools pkgconfig
> >
>=20
> 1. I can not download wireshark-1.12.0-rc2.tar.bz2, seems it has been=20
> removed
>=20
> wget=20
> http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2=
=2Etar.bz2
> --2014-08-06 15:00:13--=20
> http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2=
=2Etar.bz2
> Resolving wiresharkdownloads.riverbed.com=20
> (wiresharkdownloads.riverbed.com)... 69.4.231.52
> Connecting to wiresharkdownloads.riverbed.com=20
> (wiresharkdownloads.riverbed.com)|69.4.231.52|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2014-08-06 15:00:14 ERROR 404: Not Found.
>=20
>=20
> 2. which layers do I found the libsmi/portaudio recipes?

both are in meta-oe
http://layers.openembedded.org/layerindex/recipe/23397/
http://layers.openembedded.org/layerindex/recipe/1080/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPh5KQACgkQN1Ujt2V2gBwPYgCfa3/lNh8lqSjt60TNMd7Oz5nH
nG8AnjMXcH5CR6rOdTbnSc/VqeWWcVvt
=Wnyd
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--

