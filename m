Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2B0F6777B7
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 11:44:16 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id i17so11818456wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Mar 2017 03:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eGdpwX8fUzsyE4lZgI/c0wXmZFTpjn4g0mmM3PZU/cc=;
	b=uT98ijz28Vz3TAUcodR0LuJa6EabMfYRkgeZ4ZgldHIOsUERhCGrAXLXOo7dkb99fd
	2GHXl5/I/KBhzCr7tPnEfgwdpWMeEig2tYKd+r5Qtw6WWODiRCjKz/sjzISO6i45HB6Y
	87C4Xj9WyDRVDW9I0anhTlBJ1B3GkxyLs4+mGZQkTIqhu/T+uETL7eQfxs4/mu2IhWWc
	0CovLkCt3lmLz0vbORxo4DUQR379ezP7jRdlLdJAZP1jlslCP8t0UE5toTLR6/IzVexf
	43X+Ht9qqVStqkivYqlnvUriGrzu6pa7IQvwBh2bKM1PEvwVtBXWDy0cdx3tazPBOhQy
	jCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eGdpwX8fUzsyE4lZgI/c0wXmZFTpjn4g0mmM3PZU/cc=;
	b=NmkDcO0fwJq+VndRoI6leFx/zb1Lx5AFNlbUYPLPF5YaUyb4g+TRbGOT7tqZ8fMEIH
	/lLXX9dcNM3UN85Y17LN+BR0cCJHMmZhljn1wielITLfiNdFczP/ia08bQeIw5/KHUqS
	GMp4k1sgnQ1zLxJfE9/MsGDQL13HavbrNWNZkBrHDbAj4TuHnjQnTNFADOeSPVriY/KU
	sp70VHurND5Z99pP5NE7asRLSpPcQ0LT/AjM9hFotubaOAMDzg/9weqRmZ/w+7+gBi1Y
	IuhTXM2R5DuLsBFuw3Lh74ATK1TEJrxaiE56f5qremAWtEfktgze6bk4nu6gQ8sgfpOl
	Y8Pw==
X-Gm-Message-State: AMke39mmq6/Qf0JLYembIwZtr8isBZ2glx36T2My6cpl+GRP391tRtAZm9PcB0NENaViFA==
X-Received: by 10.28.30.79 with SMTP id e76mr6579092wme.96.1488627857202;
	Sat, 04 Mar 2017 03:44:17 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id q4sm2687244wme.17.2017.03.04.03.44.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 04 Mar 2017 03:44:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 4 Mar 2017 12:44:18 +0100
To: David Cako <dc@cako.io>
Message-ID: <20170304114418.GA3025@jama>
References: <1488585123-46482-1-git-send-email-dc@cako.io>
MIME-Version: 1.0
In-Reply-To: <1488585123-46482-1-git-send-email-dc@cako.io>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] increment pyyaml setup.py version number
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Mar 2017 11:44:17 -0000
X-Groupsio-MsgNum: 65672
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2017 at 04:52:03PM -0700, David Cako wrote:
> I was getting dependency issues on my target machine due to an incorrect =
version number in setup.py.

Missing SOB and I don't see this file in repository. It was removed some
time ago:

commit 1161ab8f8dda272eb5d09917446cc5b971be1335
Author: Pascal Bach <pascal.bach@nextrem.ch>
Date:   Thu Jan 5 18:12:31 2017 +0100

    python-yaml: provide both python2 and python3 package
   =20
    Further the recipe is simplified by using the pypi and setuptools
class.
    The custom setup.py is no onger necessary.

Please test your changes in recent master, before sending them to ML.

>=20
> ---
>  meta-python/recipes-devtools/python/python-pyyaml/setup.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-pyyaml/setup.py b=
/meta-python/recipes-devtools/python/python-pyyaml/setup.py
> index 2ed1c94..50318d5 100644
> --- a/meta-python/recipes-devtools/python/python-pyyaml/setup.py
> +++ b/meta-python/recipes-devtools/python/python-pyyaml/setup.py
> @@ -1,5 +1,5 @@
>  NAME =3D 'PyYAML'
> -VERSION =3D '3.10'
> +VERSION =3D '3.12'
>  DESCRIPTION =3D "YAML parser and emitter for Python"
>  LONG_DESCRIPTION =3D """\
>  YAML is a data serialization format designed for human readability and
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLqokgAKCRA3VSO3ZXaA
HEtYAJ99pBvlLzEJ3AZAkkWtFY6b3uA8HwCgn13sAUFMjrDujjG5sU4R0ikxD3g=
=oJVM
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
