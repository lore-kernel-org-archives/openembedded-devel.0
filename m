Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id EAAD0736C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 02:04:04 +0000 (UTC)
Received: by wizk4 with SMTP id k4so127512wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 19:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SbqISdnBk1q+aV950R7wOyDPmiJh6OH0JISdNIYHRfY=;
	b=gDVzB+8EV6HcDnPJX0tqHY0tB55BMnJCNrel5Oo6Dsk41whIT6cdWFx8C2vMYEAQo2
	j3ODCEMpdHKD3xSAZyJD4Ggba3KrlNJrej/w7LMwImurBu29AEVhxrfjNlY0wRHQaZ2N
	nRnRjhj7+OtN16NKF5a51PmC0WxJ1vxffqZAjNMvhuRyXBTq2V2mGAl96gUdqvktjkVv
	TGQh8bYZ9KsxYo4YBufC4HsO/9ILhzZ6+oMhxeM5lGY6e2M7SkmvVFdp43m65ADxeWh8
	8uz8cLCiCCLDsYa628dVKRLQjl246hO/02eQqes/r1FKNjmkQcYhmV+coUt/d2Jx5U+/
	8AnA==
X-Received: by 10.180.74.40 with SMTP id q8mr19916074wiv.32.1427940245258;
	Wed, 01 Apr 2015 19:04:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id e2sm2595843wij.5.2015.04.01.19.04.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 19:04:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 2 Apr 2015 04:04:28 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150402020428.GM14928@jama>
References: <cover.1427931203.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1427931203.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: otavio@ossystems.com.br
Subject: Re: [PATCH 00/15] Fido add maintainers
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
X-List-Received-Date: Thu, 02 Apr 2015 02:04:05 -0000
X-Groupsio-MsgNum: 54952
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/jvaajy/zP2g41+Q"
Content-Disposition: inline

--/jvaajy/zP2g41+Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2015 at 04:43:34PM -0700, Armin Kuster wrote:
> please consider these maintainers for the meta-openembdded fido branch
>=20
> The following changes since commit df6c7b1279790d27ebfd58fbdfbac89bde5782=
ec:
>=20
>   python-pyopenssl: Upgrade to 0.14 (2015-03-21 16:42:30 +0100)
>=20
> are available in the git repository at:
>=20
>   https://github.com/akuster/meta-openembedded akuster/fido-next
>   https://github.com//tree/akuster/fido-next

Would you mind (me) squashing them together so that it's easier to create t=
he
patch for next release?

> Armin Kuster (15):
>   meta-efl: update maintainers list
>   meta-filesystems: update for fido maintainer
>   meta-gnome: update maintainers list
>   meta-gpe: update maintainers list
>   meta-initramfs: update maintainers list
>   meta-multimedia: update maintainers list
>   meta-networking: update maintainers list
>   meta-oe: update maintainers list
>   meta-perl: update maintainers list
>   meta-python: update maintainers list
>   meta-ruby: update maintainers list
>   meta-systemd: update maintainers list
>   meta-xfce: update maintainers list
>   meta-webserver: updated maintainers list
>   toolchain-layer: update maintainers list
>=20
>  meta-efl/README             | 13 +++++++------
>  meta-filesystems/README     | 14 +++++++++-----
>  meta-gnome/README           | 12 +++++++-----
>  meta-gpe/README             | 13 +++++++------
>  meta-initramfs/README       | 11 ++++++-----
>  meta-multimedia/README      | 14 +++++++-------
>  meta-networking/MAINTAINERS |  8 ++++++--
>  meta-networking/README      |  6 +++---
>  meta-oe/README              | 11 ++++++-----
>  meta-perl/README            | 10 ++++++----
>  meta-python/README          | 11 +++++++----
>  meta-ruby/README            | 12 +++++++-----
>  meta-systemd/README         | 11 +++++++----
>  meta-webserver/README       | 13 ++++++++++---
>  meta-xfce/README            | 11 ++++++-----
>  toolchain-layer/README      |  9 ++++++---
>  16 files changed, 107 insertions(+), 72 deletions(-)
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/jvaajy/zP2g41+Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUco6wACgkQN1Ujt2V2gBwBaQCdEPDyFqNCjLGbFGWjTytupcKp
pVkAnA+oXRJqQYzvq3I9ciA42AMtUvy/
=779N
-----END PGP SIGNATURE-----

--/jvaajy/zP2g41+Q--
