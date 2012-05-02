Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPeS0-000484-Pu
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 20:38:56 +0200
Received: by wibhj13 with SMTP id hj13so4228127wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 11:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YHnS3zr3q38LqUI+CBbBB2oUruDLS+el7t6qjWGud5A=;
	b=C3CS+0BOABm6OHzwNSxq+BeDXhnpJwiQHAu5Bcf16McJF00pmUXv/ygCgib4mspXCi
	Rui4OM0XbkLddsjniAaNo1ZdL19vvrsM7P7pDaA2EMRlTqquA2kmf05LOxml3HLIFXTp
	PWD8EGGgweQzNoDte83aO84+nP/8jKd0ViInKYL2OZgm0plfqm/oBNmwHfj9QyEu9yG1
	4s6C4WU8t06RRi0oB44QeoatY6VLu99W2H75zpa3uPi8xybt/nL/0PbScaVyThq8Z7/A
	OS/hKGbi2ee+wSJIGVoSIKSy1TDq8RmM8xF4QtsHrN1Mqo/a4B90ZJhucBPG3JBik14y
	VpyA==
Received: by 10.180.102.100 with SMTP id fn4mr8165161wib.1.1335983352437;
	Wed, 02 May 2012 11:29:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex2sm9103550wib.8.2012.05.02.11.29.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 11:29:11 -0700 (PDT)
Date: Wed, 2 May 2012 20:29:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120502182913.GA4658@jama.jama.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
	<20120502095150.GA3682@jama.jama.net>
	<CAMKF1spM9urWo1VBXG=qdWOcC_5_2kw-vBGqWv3Lg0xBPWiADA@mail.gmail.com>
	<788719CB-F74E-4219-85AC-82BE71D2068F@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <788719CB-F74E-4219-85AC-82BE71D2068F@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Wed, 02 May 2012 18:38:56 -0000
X-Groupsio-MsgNum: 38537
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 02, 2012 at 08:26:49PM +0200, Koen Kooi wrote:
>=20
>=20
> Op 2 mei 2012 om 20:14 heeft Khem Raj <raj.khem@gmail.com> het volgende g=
eschreven:
>=20
> > On Wed, May 2, 2012 at 2:51 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >>=20
> >> I'm not using gcc-4.5, but aren't those 3 patches only for master? As
> >> gcc-4.7 and other gcc changes were in oe-core only after release AFAIK.
> >>=20
> >=20
> > Yes they are strictly for master to accomodate basic changes in build s=
equence
> > we did for gcc 4.7 that said, I think now that denzil has released we s=
hould
> > reconsider maintaining gcc 4.5 in toolchain-layer and same goes for oth=
er
> > recipes in the layer. Infact I feel the whole layer can be dropped.
>=20
> I was planning to propose the same, any objections?

I've switched to gcc-4.7, so not from me.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+hfPkACgkQN1Ujt2V2gBz5SQCgh+fFkxyiHMxawccAzmpBLp8a
QoQAoKP+Y4TdAmdVIJ5rGyh1FHU2+Oge
=FdDC
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
