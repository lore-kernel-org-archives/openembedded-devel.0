Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROWSl-0004jd-5x
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 16:22:47 +0100
Received: by faat2 with SMTP id t2so3060498faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uxixmGd7qbuyP5lHcFD4hGDKy8dpr5ttqxYhPCgl9iQ=;
	b=rd7N7HHQgi8qW36QmjePKmhg3YEOrbnsypw2QeqjVKMLnDIZ+iv8kIG/O+6hTz2HLl
	sB9NpafMhX7l4iO6NfH06F2BNFBBRATU9uLml+uW4fUbZN/hynpyRsHOgeaxflnQ8xUV
	KE7cV4R/Is41uWtFKXAxHtsX92gg0jAaFajAo=
Received: by 10.223.30.149 with SMTP id u21mr12683799fac.18.1320938186300;
	Thu, 10 Nov 2011 07:16:26 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y2sm11427941fag.12.2011.11.10.07.16.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 07:16:25 -0800 (PST)
Date: Thu, 10 Nov 2011 16:16:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111110151613.GJ21022@jama.jama.net>
References: <4EBBE67F.20300@freyther.de>
MIME-Version: 1.0
In-Reply-To: <4EBBE67F.20300@freyther.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: RFC Creation of a meta-telephony repository
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
X-List-Received-Date: Thu, 10 Nov 2011 15:22:47 -0000
X-Groupsio-MsgNum: 35297
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cDtQGJ/EJIRf/Cpq"
Content-Disposition: inline

--cDtQGJ/EJIRf/Cpq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2011 at 03:58:07PM +0100, Holger Freyther wrote:
> Hi all, sysadmins,
>=20
> could someone create a meta-telephony repository for me? In this reposito=
ry I
> would like to maintain OpenBSC, osmocomBB, TETRA, mISDN, LCR, Asterisk (a=
nd
> probably more in the future).

osmocomBB already exists in meta-smartphone
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dtree;f=3Dmeta-o=
smocombb;h=3Ddcf02e515d1dd8dc9aa10a6411615ad2a2186db3;hb=3DHEAD

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cDtQGJ/EJIRf/Cpq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk676r0ACgkQN1Ujt2V2gBy/zgCgusyVAOK61Rl5eeEesV0T+4mG
Ht8AoKU3wdYSLNDBzSEJBtrBjZw8/kVJ
=GXMd
-----END PGP SIGNATURE-----

--cDtQGJ/EJIRf/Cpq--
