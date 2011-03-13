Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pyt7Q-0006ii-Tk
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 22:46:32 +0100
Received: by bwz10 with SMTP id 10so3737739bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Mar 2011 14:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=z64kp/NieZpzHasZw/cnZb4e0TOV20K/Rr7c3Exse3A=;
	b=kL4lXU8Y993uOYXG7GADBgJFdxl5tyPiogwFrWjoWNZLaomrn7RWIOvBR6YcoEOPuz
	Wqdz8VN7vQfXglzVj0KGaHwmbVczCT8TbhCD/N6TPe+4C4VHGQ4YSApZq9ef8UUxELv8
	BPPgDMhItqpI43Fy617zf4hqwy+XAwx/YfFPk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=T3dF1xolGrQJ55fDHzbQAsfLFKyjjsFE8x/49abHxT4zj/IAj5gdpCNmCgJl8W7v5i
	y5qMd9sGDBCdzEh8iMb+CKizyaCLX1ifickMvqWv4eziqZoZQU5CLPfPXO6WM3ax+mcM
	/GIEh6XUPxuHYce4wM0FXBNcLIIizvM7MvqDQ=
Received: by 10.204.26.200 with SMTP id f8mr3987547bkc.210.1300052692693;
	Sun, 13 Mar 2011 14:44:52 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b6sm4690653bkb.22.2011.03.13.14.44.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Mar 2011 14:44:51 -0700 (PDT)
Date: Sun, 13 Mar 2011 22:44:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20110313214444.GB3871@jama.jama.net>
References: <1299879658-10136-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1299879658-10136-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] shr: prefer qt 4.7.2
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
X-List-Received-Date: Sun, 13 Mar 2011 21:46:33 -0000
X-Groupsio-MsgNum: 30171
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline

--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 11, 2011 at 10:40:56PM +0100, Eric B=E9nard wrote:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> Cc: Martin.Jansa@gmail.com
> ---
>  conf/distro/include/preferred-shr-versions.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro=
/include/preferred-shr-versions.inc
> index 662f366..ce4ea82 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -28,7 +28,7 @@ PREFERRED_VERSION_perl =3D "5.10.1"
>  PREFERRED_VERSION_perl-native =3D "5.10.1"
>  UDEV_GE_141 =3D "1"
> =20
> -ANGSTROM_QT_VERSION ?=3D "4.7.1"
> +ANGSTROM_QT_VERSION ?=3D "4.7.2"
>  PREFERRED_VERSION_qt4-tools-native =3D "${ANGSTROM_QT_VERSION}"
>  PREFERRED_VERSION_qt4-tools-sdk =3D "${ANGSTROM_QT_VERSION}"
>  PREFERRED_VERSION_qt4-embedded =3D "${ANGSTROM_QT_VERSION}"
> --=20
> 1.7.0.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk19OswACgkQN1Ujt2V2gBxPhgCeMRuf3O4KHgKC+PsW6GutfD4x
QPUAoLiIT5vxmkaFqupy7JF8B+N15LNt
=e3xw
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
