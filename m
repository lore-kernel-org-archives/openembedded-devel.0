Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 930496FD16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 04:05:13 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id d1so2449557wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 21:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hDjbqEv6HlOeLgaGuWzaV6eVyTC9NxTZdM0I9CerjP4=;
	b=afaRfjZbJdG8LoplL5h5/JT2k936W/GFz5BRzjwqPCvNIXaNI3F/rkesw92firro3h
	B5gAtIMUAQ9w2I/lwDYQM6Skr2ban3bEeDlOWM/a+PBMXYlDqI7/jXFGXjxin4VtadV+
	Pu3x1y4A5zAwKQivEtb2c3JVtUYgGP+QI8pFIbYyLgeGWQtX7GdDGKbigpgEDo4qKLRx
	uy8n3mMCmuNk6wo4KHR6NgS7rwMTYlDgh6cunOUIKj6YyuJlD/nqvHKerEcSH2b6fAc4
	zeLPcxZhBCCuYeKqT6k+FLeKp51R5nQR6QEb5pOf2KGzW03UBNPnKkAlv+INOhQ6cU1Q
	AL1g==
X-Received: by 10.194.209.207 with SMTP id mo15mr47519500wjc.6.1412049914769; 
	Mon, 29 Sep 2014 21:05:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dc9sm13694309wib.5.2014.09.29.21.05.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Sep 2014 21:05:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 30 Sep 2014 06:06:05 +0200
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Message-ID: <20140930040605.GY25706@jama>
References: <1411985350-20322-1-git-send-email-jackie.huang@windriver.com>
	<20140930003037.GW25706@jama>
	<1B858668EC6A94408DCA5225FDFA85AABD50F355@ALA-MBB.corp.ad.wrs.com>
	<20140930021351.GX25706@jama>
	<1B858668EC6A94408DCA5225FDFA85AABD50F470@ALA-MBB.corp.ad.wrs.com>
	<1B858668EC6A94408DCA5225FDFA85AABD50F5A6@ALA-MBB.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AABD50F5A6@ALA-MBB.corp.ad.wrs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openldap: update version to 2.4.39
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
X-List-Received-Date: Tue, 30 Sep 2014 04:05:14 -0000
X-Groupsio-MsgNum: 52292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YG0IFkGWIt6MbjRk"
Content-Disposition: inline

--YG0IFkGWIt6MbjRk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2014 at 02:58:12AM +0000, Huang, Jie (Jackie) wrote:
>=20
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:openemb=
edded-devel-
> > bounces@lists.openembedded.org] On Behalf Of Huang, Jie (Jackie)
> > Sent: Tuesday, September 30, 2014 10:28 AM
> > To: Martin Jansa
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to 2.4.39
> >=20
> >=20
> >=20
> > > -----Original Message-----
> > > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > > Sent: Tuesday, September 30, 2014 10:14 AM
> > > To: Huang, Jie (Jackie)
> > > Cc: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to 2.4.39
> > >
> > > On Tue, Sep 30, 2014 at 02:07:06AM +0000, Huang, Jie (Jackie) wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > > [mailto:openembedded-devel- bounces@lists.openembedded.org] On
> > > > > Behalf Of Martin Jansa
> > > > > Sent: Tuesday, September 30, 2014 8:31 AM
> > > > > To: openembedded-devel@lists.openembedded.org
> > > > > Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to
> > > > > 2.4.39
> > > > >
> > > > > On Mon, Sep 29, 2014 at 06:09:10AM -0400, jackie.huang@windriver.=
com wrote:
> > > > > > From: Jackie Huang <jackie.huang@windriver.com>
> > > > > >
> > > > > > Changed:
> > > > > >  * Move slapd from ${libexecdir} to ${sbin}:
> > > > > >    Installing slapd under ${sbin} is more FHS and LSB compliance
> > > > > >  * Manage init script by inheriting update-rc.d, than postinst
> > > > > >  * Add status for initscript
> > > > > >  * Rename the patch named with commit id to
> > > > > >    gnutls-Avoid-use-of-deprecated-function.patch
> > > > > >  * Add a patch for CVE-2013-4449
> > > > > >  * Add a patch to use /dev/urandom for entropy
> > > > > >  * Allow tls obtains random bits from /dev/urandom:
> > > > > >    The URANDOM_DEVICE is undefined for cross-compiling, define =
it as
> > > > > >    /dev/urandom to allow tls obtains random bits from /dev/uran=
dom.
> > > > > >  * Add PACKAGECONFIG for mdb, ndb, relay and sock
> > > > > >  * Remove unsupported config for ldbm
> > > > > >  * Add license file
> > > > >
> > > > > Can you please resolve:
> > > > > WARNING: QA Issue: openldap: Files/directories were installed but=
 not shipped
> > > > >   /run [installed-vs-shipped]
> > > >
> > > > Could you show me how to reproduce this? I don't see this warning (I
> > > > set installed-vs-shipped in ERROR_QA in fact, so it should be an
> > > > error), and I checked that there is no /run directory generated for=
 openldap.
> > >
> > > You can try to configure your builds like world builds are:
> > > http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> Sorry I couldn't find configure infos in this page, could you show me a l=
ocal.conf or
> or something like that?

http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.20140929_053035.lo=
g/world_fixes.inc

> > > My guess would be systemd in DISTRO_FEATURES (if you don't have it al=
ready).
> >=20
> > Yeah, it should be the case, I will check and fix it.
>=20
> I added system in DISTRO_FEATURES but still can't reproduce it.

Do you have some PACKAGECONFIG changes in your setup or just default?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YG0IFkGWIt6MbjRk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQqLC0ACgkQN1Ujt2V2gBzsDQCdFeomfMJU8m78/sJDD7VXjv3L
9V0An3p1DJmbtzbld/R0kyJMjYWElcGQ
=pTnC
-----END PGP SIGNATURE-----

--YG0IFkGWIt6MbjRk--
