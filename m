Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UN3Dk-0004KZ-Ad
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Apr 2013 17:34:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r32FGkwo001837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Apr 2013 08:16:47 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 2 Apr 2013 08:16:47 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id F08587FCE;
	Tue,  2 Apr 2013 11:15:50 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 25A9120449; Tue,
	2 Apr 2013 11:16:46 -0400 (EDT)
Date: Tue, 2 Apr 2013 11:16:46 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130402151645.GB6929@windriver.com>
References: <1364567102-6409-1-git-send-email-koen@dominion.thruhere.net>
	<20130401181357.GK10672@windriver.com>
	<23CA3232-CC08-4140-A95E-4B6E1F10186F@dominion.thruhere.net>
	<20130401182131.GL10672@windriver.com>
	<3B6011D6-AA55-4A46-849A-07484DEEA060@dominion.thruhere.net>
	<20130401210320.GA21215@windriver.com>
	<DA93B563-DB94-4BB5-8BE5-9F71295214A3@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <DA93B563-DB94-4BB5-8BE5-9F71295214A3@dominion.thruhere.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add 0.21.1
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
X-List-Received-Date: Tue, 02 Apr 2013 15:34:00 -0000
X-Groupsio-MsgNum: 43853
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline

--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add 0.21.1=
] On 13.04.02 (Tue 08:06) Koen Kooi wrote:

>=20
> Op 1 apr. 2013, om 23:03 heeft Joe MacDonald <Joe.MacDonald@windriver.com=
> het volgende geschreven:
>=20
> > [Re: [oe] [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add 0.=
21.1] On 13.04.01 (Mon 22:33) Koen Kooi wrote:
> >=20
> >>=20
> >> Op 1 apr. 2013, om 20:21 heeft Joe MacDonald <Joe.MacDonald@windriver.=
com> het volgende geschreven:
> >>=20
> >>> [Re: [oe] [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add =
0.21.1] On 13.04.01 (Mon 20:15) Koen Kooi wrote:
> >>>=20
> >>>>=20
> >>>> Op 1 apr. 2013, om 20:13 heeft Joe MacDonald <Joe.MacDonald@windrive=
r.com> het volgende geschreven:
> >>>>=20
> >>>>> Hey Koen,
> >>>>>=20
> >>>>> [[oe] [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add 0.=
21.1] On 13.03.29 (Fri 15:25) Koen Kooi wrote:
> >>>>>=20
> >>>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >>>>>> ---
> >>>>>> ...y-link-in-sysroot-not-in-host-directories.patch | 39 ++++++++++=
++++++++++++
> >>>>>> .../python/python-m2crypto_0.21.1.bb               | 19 +++++++++++
> >>>>>> 2 files changed, 58 insertions(+)
> >>>>>> create mode 100644 meta-oe/recipes-devtools/python/python-m2crypto=
/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> >>>>>> create mode 100644 meta-oe/recipes-devtools/python/python-m2crypto=
_0.21.1.bb
> >>>>>>=20
> >>>>>> diff --git a/meta-oe/recipes-devtools/python/python-m2crypto/0001-=
setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-oe/recipes-de=
vtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-dir=
ectories.patch
> >>>>>> new file mode 100644
> >>>>>> index 0000000..bcbdf24
> >>>>>> --- /dev/null
> >>>>>> +++ b/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.p=
y-link-in-sysroot-not-in-host-directories.patch
> >>>>>> @@ -0,0 +1,39 @@
> >>>>>> +From f11b9c71080513f9b867ba8f40613ba2ebc6e960 Mon Sep 17 00:00:00=
 2001
> >>>>>> +From: Koen Kooi <koen@dominion.thruhere.net>
> >>>>>> +Date: Fri, 29 Mar 2013 15:17:17 +0100
> >>>>>> +Subject: [PATCH] setup.py: link in sysroot, not in host directori=
es
> >>>>>> +
> >>>>>> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >>>>>> +
> >>>>>> +Upstream-status: Unknown
> >>>>>=20
> >>>>> Does this mean you haven't determined if it should be sent upstream=
 yet,
> >>>>> or you did and it's gone off into an apparent black hole of a maili=
ng
> >>>>> list somewhere?
> >>>>=20
> >>>> The former
> >>>=20
> >>> Okay.  Isn't that normally 'Pending' then?  I can make that tweak in =
my
> >>> merge, but I wanted to confirm I had the right information there firs=
t.
> >>=20
> >> If you think 'Pending' reflects the status better than 'Unknown', go f=
or it, but 'Pending' has been the catch-all for Upstream-status fields, so =
anytime you see 'Pending' you know you can't trust the Upstream-status fiel=
d.=20
> >=20
> > Yeah, certainly no argument here, 'Pending' implies something to me that
> > simply isn't so based both on experience and the strict definition on
> > the website.  But that does seem to fit the definition reasonably well.
> >=20
> > So since the meta-networking bit depends on the meta-oe bit being
> > merged, do you want me to merge both at the same time?  Or if you would
> > prefer to do the merge, I'm happy with the meta-networking piece of
> > this, so feel free.
>=20
> Feel free to merge both

Okay, all done.

--=20
-Joe MacDonald.
:wq

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFa9l0ACgkQPN8S4W6ZZnem7ACcCvlRQOf+SIB4oetjNte0Q1Qs
vQkAni2yD8vYbrAn3JKaDAZ+OmDGwIh1
=5y4A
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
