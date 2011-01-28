Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PirUj-0004tF-17
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 17:48:21 +0100
Received: by bwz10 with SMTP id 10so3437231bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 08:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=d5OXF5lDjUggprXZlXPNzsC/4ImZRZwXhLWdM0UC4lw=;
	b=RTL8Xxzx9KLUImQe6S3urywWgcz2rXujXWeiSo4vVwWzbbPz2Uk67KCkIszhzpd8Dr
	g6dYmo+iqwgpMSPfcNahyr6/wTDJ3W3xYfYX8X4Zpb1DyYRuh15vQoFFcXReoi8eAeg1
	xG1rc8AvwjjY9vq0aYXf+/+96OEG20GlMYAzM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hH4ci7MSxFhCrsH30nduzW+IvE+OrfJD/QqOa0mxJi73pPNV7drPXZnua4/Pd2VA8X
	/SP52tLqKQPZDCvFOO1qTKOkrnVzB8wW1P7twXnkBK3+zEwxu1iUEDYTCurYJ7GKtkKA
	LNELSxka4p8QaW9Ut3Xs7NtOncJ+jVsxoiBP4=
Received: by 10.204.115.147 with SMTP id i19mr2646717bkq.162.1296233250815;
	Fri, 28 Jan 2011 08:47:30 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q18sm8818369bka.15.2011.01.28.08.47.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 28 Jan 2011 08:47:29 -0800 (PST)
Date: Fri, 28 Jan 2011 17:47:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110128164728.GA3265@jama>
References: <E1Piqw5-0004kv-3P@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1Piqw5-0004kv-3P@melo.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Andrea Adami : MAINTAINERS: add committer's entry.
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
X-List-Received-Date: Fri, 28 Jan 2011 16:48:21 -0000
X-Groupsio-MsgNum: 28574
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2011 at 04:12:33PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 07530194621001e9fbea33e3a094beceef606e48
> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=
=3D07530194621001e9fbea33e3a094beceef606e48
>=20
> Author: Andrea Adami <andrea.adami@gmail.com>
> Date:   Fri Jan 28 17:11:26 2011 +0100
>=20
> MAINTAINERS: add committer's entry.
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>=20
> ---
>=20
>  MAINTAINERS |   11 ++++++++++-
>  1 files changed, 10 insertions(+), 1 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f1e20dd..4d05c59 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16,6 +16,16 @@ Recipes:    Maintained recipes (should match package n=
ames, can include wildcard
> =20
>  ------------------------------------------------------------------------=
-----
> =20
> +Person:     Andrea Adami
> +Mail:       andrea.adami@gmail.com
> +Machines:   Zaurus family (direct testing only on c7x0 and spitz)
> +Recipes:    zaurus-updater, zaurus-installer, nandlogical
> +Recipes:    linux, linux-kexecboot (Zaurus kernels)
> +Recipes:    kexecboot, kexec-tools, initramfs-kexecboot-image
> +Recipes:    klibc, klcc-cross
> +Classes:    klibc.bbclass
> +Interests:  Early boot, initramfs, klibc-static binaries, kernel, sysadm=
, networking
> +
>  Person:     Andreas Holzer
>  Mail:       a.holzer@cheese.at
>  Website:    http://members.cheese.at/woody/zaurus/
> @@ -218,7 +228,6 @@ Interests:  OE Eclipse plugins, x86, ARM, wxWidgets, =
xorg, xinput, xinput-calibr
>  Person:     Martin 'JaMa' Jansa
>  Mail:       Martin.Jansa@gmail.com
>  Machines:   spitz, om-gta02
> -Distros:    SHR, =C5ngstr=F6m
>  Interests:  xorg
>  Recipes:    shr/*, xorg-*/*, linux/*openmoko*

I still like SHR and =C5ngstr=F6m and I want them back! :)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1C8yAACgkQN1Ujt2V2gByv4gCfUvuNafOWQfkkQNJC03k2bBNT
YpEAnj8styibNr1vtJ3SfDJupAC8SL39
=juMj
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
