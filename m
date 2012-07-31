Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwIXV-0001hu-Rv
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 21:55:34 +0200
Received: by wibhm2 with SMTP id hm2so3538965wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vT+FFuD6m17SdX/QzFC/cnJe89T2eyOpWwF9bbKOuVc=;
	b=EYQ7Yzven33f5edAt6F3wV7wtED3HAkgRf8aVB0wdJaVsF01JNo+XGSrrpaDr1wFNu
	48hkboWd7YzovzEOJzcGlnJ4cVFjH12ZW7NbeC+8emSgE0grOvWEx87QcY4BNabdluFU
	rc2REUfpMZueASaqhuKYj1BM7IRUynYWBD6XlnWj+ignij5OqoiPpiG2w3PBlBlvcRSf
	aB3Ig0sdF9+nSGwFXDSpH/4bGez+66sPT0vg0oDXtFHVGOWcRqRMLmR9fkjkgSfVDfh3
	n1q6q2XjFjzxcYRKcuY7ZIex4itUQI3e3SOoU+5X654TmJScYVQVKYOFdDyhotTQL8Co
	3hoQ==
Received: by 10.180.82.39 with SMTP id f7mr9985765wiy.2.1343763836580;
	Tue, 31 Jul 2012 12:43:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ep14sm30500670wid.0.2012.07.31.12.43.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 12:43:55 -0700 (PDT)
Date: Tue, 31 Jul 2012 21:43:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120731194351.GX3261@jama.jama.net>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<1343760977-3290-6-git-send-email-raj.khem@gmail.com>
	<jv9acn$ckm$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jv9acn$ckm$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH V2 6/7] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Tue, 31 Jul 2012 19:55:34 -0000
X-Groupsio-MsgNum: 39974
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aSOv3uy5xJSQbCk1"
Content-Disposition: inline

--aSOv3uy5xJSQbCk1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 09:07:29PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 31-07-12 20:56, Khem Raj schreef:
> > This class is angstrom specific so lets move it to more appropriate
> > layer
>=20
> Ehm, it was put in meta-oe on request so other distros could use it.

SHR is now compatible with oe-core copy too, so fine with me.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aSOv3uy5xJSQbCk1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAYNXcACgkQN1Ujt2V2gBxCSgCfd2Vv+zudo7ACSyKE4jc+wk2v
b3oAoKTdYarsP+GMB21RfT9vgenI8zl5
=6OVT
-----END PGP SIGNATURE-----

--aSOv3uy5xJSQbCk1--
