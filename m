Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKRbI-00081c-P5
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 10:50:28 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1023340fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 01:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=UQ6zYUl/tP4O7+Tt3Wtmz6wF7C81GbXXaF8Gg9oNROs=;
	b=v8CiPRmt5FBPOT+Y496Wi4oXZCSg+wSlURtDwc6JFsExbLTRUbTyEWXOLlh9JPYZWR
	05LCjxZAbf3ZXzvAchp32QLHFBQIWUXhkAfJUDgoa0B7oEWco5xHnKRVTlwhVyI/mJKs
	4mkm7lz1lBtrt5jjZEWta+cYPLJW8+XYKhpmU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rHqsWv5Ztl+aV9U+CwrXtFj2saeO8X/8XMOOhd/pV4QtbNPVMC1pJA8kK3r+usYbjt
	EdYhTxAFgeZbwHOx64P7gCUFpWy9KS84Ho5Lm9rM7gwNEI+I+NGraJXaJOBQzR1wRD7c
	XRgPCp2HJNfFheR6lCcFmu2+2a0d9m9/j9/vI=
Received: by 10.223.2.205 with SMTP id 13mr2622447fak.138.1305190062999;
	Thu, 12 May 2011 01:47:42 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id p16sm371102fax.21.2011.05.12.01.47.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2011 01:47:42 -0700 (PDT)
Date: Thu, 12 May 2011 10:47:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20110512084735.GB3423@jama.jama.net>
References: <1305145805-14609-1-git-send-email-eric@eukrea.com>
	<1305145805-14609-6-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1305145805-14609-6-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 5/6] shr: prefer qt 4.7.3
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
X-List-Received-Date: Thu, 12 May 2011 08:50:28 -0000
X-Groupsio-MsgNum: 31934
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline

--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2011 at 10:30:04PM +0200, Eric B=E9nard wrote:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  conf/distro/include/preferred-shr-versions.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro=
/include/preferred-shr-versions.inc
> index 35a4ecd..5cb6e09 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -28,7 +28,7 @@ PREFERRED_VERSION_perl =3D "5.10.1"
>  PREFERRED_VERSION_perl-native =3D "5.10.1"
>  UDEV_GE_141 =3D "1"
> =20
> -ANGSTROM_QT_VERSION ?=3D "4.7.2"
> +ANGSTROM_QT_VERSION ?=3D "4.7.3"
>  PREFERRED_VERSION_qt4-tools-native =3D "${ANGSTROM_QT_VERSION}"
>  PREFERRED_VERSION_qt4-tools-sdk =3D "${ANGSTROM_QT_VERSION}"
>  PREFERRED_VERSION_qt4-embedded =3D "${ANGSTROM_QT_VERSION}"

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3LnqcACgkQN1Ujt2V2gBxe/gCggqowsxU25MDc+U0qT1eXye2j
fPQAnR/ok806daAWQWI2rHG+lpPCuzDz
=vqGh
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
