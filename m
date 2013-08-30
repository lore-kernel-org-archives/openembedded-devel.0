Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 128FF6BCE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 09:00:32 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so778691ead.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 02:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p/OUUbVPlwDEB1ScPZQMbuMifhF/r6sOl2TWbSr7Grg=;
	b=Btf2T5ooO+6nzEJZRri/Six0ZqJ5anrrkLtDCr2TxK+K0EOkit1ZqVQK5HZGw28+Je
	7jTfY+34hETInE/M4wl2XACLbUhKgNfrgfaPEU1oG/BS4/rzujaDVePigNHhCPAQ3dM4
	S/Ee92WdPKC+n/TVPLUF9htPWCJXT2vndSv3uE+QqiiuX8AKjxZ8H9+qaZZVomm+DoTc
	rgVzh9rAbfhpyW0b8dTPfgrWrBlisn7CYFK1obfCxSRJWBBbaBsTjMrrC+5z8Qkt/o5V
	eCrLYqfYiHgahPh5O4sSEu9wycVE3ADFhpL6FGd1x5hpZIuqQ54zIC929dVzrs/fBKq1
	diug==
X-Received: by 10.15.54.199 with SMTP id t47mr11031590eew.46.1377853232897;
	Fri, 30 Aug 2013 02:00:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm52897455eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 30 Aug 2013 02:00:32 -0700 (PDT)
Date: Fri, 30 Aug 2013 11:01:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130830090146.GS3544@jama>
References: <1377824151-7538-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1377824151-7538-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] qt-creator: update to 2.8.1
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
X-List-Received-Date: Fri, 30 Aug 2013 09:00:34 -0000
X-Groupsio-MsgNum: 45992
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PyTGrrL9CIKSRohn"
Content-Disposition: inline

--PyTGrrL9CIKSRohn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2013 at 10:55:51AM +1000, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  .../qt-creator/{qt-creator_2.8.0.bb =3D> qt-creator_2.8.1.bb}           =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-qt/qt-creator/{qt-creator_2.8.0.bb =3D> qt-creato=
r_2.8.1.bb} (87%)
>=20
> diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb b/meta-oe/=
recipes-qt/qt-creator/qt-creator_2.8.1.bb
> similarity index 87%
> rename from meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
> rename to meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
> index a95ad5a..21d5264 100644
> --- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
> +++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =3D "file://LGPL_EXCEPTION.TXT;md5=3Deb6=
c371255e1262c55ae9b652a90b5
>  SECTION =3D "qt/app"
> =20
>  SRC_URI =3D "http://download.qt-project.org/official_releases/qtcreator/=
2.8/${PV}/${BP}-src.tar.gz"
> -SRC_URI[md5sum] =3D "5aacdad4491b7dda9758a81384d8da79"
> -SRC_URI[sha256sum] =3D "7ac5d9a36c2f561f74d77378d4eae95a78c7752b323e1df9=
24d6e895e99f45d2"
> +SRC_URI[md5sum] =3D "79ef6c6ece0c00035ef744c9d6e3bd3b"
> +SRC_URI[sha256sum] =3D "d5ae007a297a4288d0e95fd605edbfb8aee80f6788c7a6cf=
b9cb297f50c364b9"

Hi, does it fix build on arm?

One issue was missing cpuid.h
http://lists.openembedded.org/pipermail/openembedded-devel/2013-August/0919=
52.html

and then there were some warning causing build failure with -Werror.

If yes, I'll happily replace my patch with this one :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PyTGrrL9CIKSRohn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIgX3oACgkQN1Ujt2V2gBxylwCfc4hEWamuwurMHrYqXBry/KGW
H3oAoKVqClVJhYVUj/Z88PR6DxM9MoKl
=CFgE
-----END PGP SIGNATURE-----

--PyTGrrL9CIKSRohn--
