Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJQS1-0007aQ-Ib
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 17:01:29 +0200
Received: by weyt44 with SMTP id t44so4347519wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 07:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kDUSzOjUz0p+L11Mr6b45lgDA1BeAshhfN6e6XSU70M=;
	b=aNEOT+zJRV8h53+Dh9rv8nXWxwylLxiLPjBR8XjBIpycAiy+niiCr2iJ6Zi55gal7V
	8wFEswj5/+Y4DZwM4VuMHlvHWMRWlze7nfmq+0N2Qxn7KCpRaQ+1a8aUtzUuwjyBH2Ec
	o+PKECztdBSosvOBpX8LvoZDghxM9ovyp2MXNei5CumLG5t2I9rMC2w8bl9lUSxrsyi/
	Mr6mQwnDzRJFm+bU6dBetoWLRlfyoTbfU2EXpO2Jx+4/13L4SL7Dn/cZhunUJa1M4kfv
	HeWviMKeRyP1gaSbri1Lsf9W2UIjgo5mxtg+W+ci58y0BnyDbaKCIaYNBtv0JXAsaaZw
	6bUA==
Received: by 10.216.232.84 with SMTP id m62mr1291709weq.200.1349275709901;
	Wed, 03 Oct 2012 07:48:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm27222427wiz.4.2012.10.03.07.48.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 07:48:28 -0700 (PDT)
Date: Wed, 3 Oct 2012 16:48:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121003144829.GB29339@jama.jama.net>
References: <1349275482-5904-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1349275482-5904-1-git-send-email-paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] build-appliance-image: Fix spacing in DESCRIPTION
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
X-List-Received-Date: Wed, 03 Oct 2012 15:01:29 -0000
X-Groupsio-MsgNum: 40898
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline

--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 03, 2012 at 03:44:42PM +0100, Paul Eggleton wrote:
> Fixes [YOCTO #2636]

wrong list

Cheers,

>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-core/images/build-appliance-image.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/rec=
ipes-core/images/build-appliance-image.bb
> index 69a4828..49e250d 100644
> --- a/meta/recipes-core/images/build-appliance-image.bb
> +++ b/meta/recipes-core/images/build-appliance-image.bb
> @@ -1,4 +1,5 @@
> -DESCRIPTION =3D "An image you can boot and run using either the VMware P=
layer or VMware Workstation.  For more information, see the<a href=3D'http:=
//www.yoctoproject.org/documentation/build-appliance'>Build Appliance page<=
/a>."
> +DESCRIPTION =3D "An image you can boot and run using either the VMware P=
layer or VMware Workstation.\
> + For more information, see the <a href=3D'http://www.yoctoproject.org/do=
cumentation/build-appliance'>Build Appliance page</a>."
>  IMAGE_INSTALL =3D "packagegroup-core-boot packagegroup-core-ssh-openssh =
packagegroup-self-hosted"
> =20
>  LICENSE =3D "MIT"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBsUD0ACgkQN1Ujt2V2gBzFcwCgug4EfGEybXom9dJotUMsszIF
py0AnjEheAtLbmzrEGdKpB1pMAb/xSwf
=Exv/
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
