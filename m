Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PsFuI-0000FA-G8
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 15:41:34 +0100
Received: by fxm8 with SMTP id 8so3641247fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 06:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=UIn10hLIeBPm43XklY8BFn6tw7QDn+uS8ZvtRqr4syY=;
	b=dJnvqERMqCQXSIbzwfog6NgUhxpO7LoSZ/wc3rKWyj/JayQ0b192nOYdlbQA5s2BgG
	ziQnn9NcdBQkjcDyh9sasFZ59utWa7GxVm8fJfkHWbiIJVB9pcwvVEdsSDs7/fk36d1Y
	E5Z+hV+uHVNqqTAMq/I2M1vRB6X5zwJFi/Bro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nLqBP3Ccpib/u9ltQYqj7c4/C7TwEFE9/tyrW5S5v/fuQiyb3eLxPmey+pR+1suoGA
	tRuSUuukxNzmsqFMLx8F/s6CdRIoDkjbEmM/84h24w5WjR+4/fu1gAz3u0NOTXvTNKz0
	bGeOgUEcXnJQkZyyFTy/tJpCQtaLLsYuC9/R0=
Received: by 10.223.86.16 with SMTP id q16mr5227403fal.58.1298471649948;
	Wed, 23 Feb 2011 06:34:09 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n1sm3662027fam.40.2011.02.23.06.34.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 06:34:08 -0800 (PST)
Date: Wed, 23 Feb 2011 15:34:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110223143402.GD3478@jama.jama.net>
References: <1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-7-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-8-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-9-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-10-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-11-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-12-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-13-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-14-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1298466445-16486-14-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 13/14] linux (2.6.37): add 2.6.37.1 stable patch
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
X-List-Received-Date: Wed, 23 Feb 2011 14:41:34 -0000
X-Groupsio-MsgNum: 29624
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Content-Disposition: inline

--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2011 at 01:07:24PM +0000, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  recipes/linux/linux_2.6.37.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/linux/linux_2.6.37.bb b/recipes/linux/linux_2.6.37.bb
> index 39c0c08..e11af81 100644
> --- a/recipes/linux/linux_2.6.37.bb
> +++ b/recipes/linux/linux_2.6.37.bb
> @@ -1,6 +1,6 @@
>  require linux.inc
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  # Mark archs/machines that this kernel supports
>  DEFAULT_PREFERENCE =3D "-1"
> @@ -20,6 +20,7 @@ DEFAULT_PREFERENCE_visstrim_m10 =3D "1"
>  # DEFAULT_PREFERENCE_om-gta01 =3D "1"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2;name=3Dkernel \
> +           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.1.bz2;a=
pply=3Dyes;name=3Dstablepatch \
>             file://defconfig "
> =20
>  SRC_URI_append_om-gta02 =3D " \
> @@ -33,3 +34,5 @@ SRC_URI_append_om-gta01 =3D " \
> =20
>  SRC_URI[kernel.md5sum] =3D "c8ee37b4fdccdb651e0603d35350b434"
>  SRC_URI[kernel.sha256sum] =3D "edbf091805414739cf57a3bbfeba9e87f5e74f97e=
38f04d12060e9e0c71e383a"
> +SRC_URI[stablepatch.md5sum] =3D "7693d1d32ed39346cc988e0f027e5890"
> +SRC_URI[stablepatch.sha256sum] =3D "c33bfa59828a9ff6916993ec008967a8c1d7=
1a18b743ee15f4280e773ef4baaf"

I'll push mine then :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1lGtkACgkQN1Ujt2V2gBx06QCdGcIhI+LdOfvYAmZPZv1Gx6Cw
yL4An1MO7rZikBclG0beWQmj9fxL6g6l
=D6pn
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
