Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 613B760107
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 16:59:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i5so8462259wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HS7yPr/7uDald6tmO5A9ToPUh7ItPqgec9u15F12WFk=;
	b=TIXGZihL5NGy5DpukVOn8k5mH5N6bGEFFUMUlQFHS5r7Idb/FjbbRLnna1LycKTCJf
	NUkwUOoeAmbqYq0nszrX4Eo8+ZS3bkswZB92Vz9bDIkVOkRH/1FXkfAoh34Zg2/SANTs
	qQx+Ugo8jn057ELUzN6JpdHhx/QejcNO1wO/DSu+QhXm/hNf7CTk+evcYc8u8TTaD9Qv
	nsOhO8HCgtWqomcb4Pc9OYAM23zf9mPDkSjMSZ8rKPqoHrIW5ohvpRYHNpfNrgKw6ZJL
	KZIGr1nToQGouq1NIS1ANEwZxu//UbhHP272+D0TpAKkS/aJ/ccW4BhqRfHM5wSyZ12Q
	Ebrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HS7yPr/7uDald6tmO5A9ToPUh7ItPqgec9u15F12WFk=;
	b=W22ubN6ZsHM24ucNPVZwVxV979wrp2JuOE9BeXkw6CABzNj1KDEY0trJJUsrDIcB8R
	6Z5Wf4Rs38gN/5Xl+1mEn53D74hyXQ5OkZn91dPrFy4wV1kbSHuV5lVjq+Rl2TBifI0k
	/qGfB/EYMcfitJGSl+yCN1P2qdj1HaSXVTU7hUsQ7EcyUULNUtXu3xcGw2GiSebtazQq
	E5EMcQ9O5GQOPh1YrIwx5Fmj9hcsrT/huhzyMeZmjkPv95ZPXTi4JWRy+J8nFjU4YVpA
	VRBXLJ3ukqp+ZqlcT8lZOKWAxMXekhrPqW5wp/9o5gaiHfQ5MLGvmOdTAceGWsnKupyp
	+A8g==
X-Gm-Message-State: AE9vXwPTsI857XA3DqmpZzkLfSfl6kW2I91v/C2NgXdMcBV16u5dHp50QRi0lDGNC/FEQg==
X-Received: by 10.194.173.35 with SMTP id bh3mr9190929wjc.86.1472662768034;
	Wed, 31 Aug 2016 09:59:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id f4sm24582079wmf.8.2016.08.31.09.59.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Aug 2016 09:59:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 31 Aug 2016 18:59:27 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160831165927.avndwnl5mr7yp53l@jama>
References: <1472292547-1742-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1472292547-1742-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-networking][PATCH] radvd: 2.11 -> 2.14
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
X-List-Received-Date: Wed, 31 Aug 2016 16:59:29 -0000
X-Groupsio-MsgNum: 62910
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6ly54cpo6fyxsdp3"
Content-Disposition: inline

--6ly54cpo6fyxsdp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 27, 2016 at 06:09:07AM -0400, Wang Xin wrote:
> Upgrade radvd from 2.11 to 2.14.

This is already in master since 14 days ago:

commit af7893c4df3a2728e26de6621ee4b6047bedb2df
Author: Kai Kang <kai.kang@windriver.com>
Date:   Tue Aug 16 14:57:10 2016 +0800
Commit:     Joe MacDonald <joe_macdonald@mentor.com>
CommitDate: Tue Aug 16 21:26:15 2016 -0400

    radvd: 2.11 -> 2.14

Please rebase and test your changes in recent master(-next) before
sending them.

>=20
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  meta-networking/recipes-daemons/radvd/radvd_2.11.bb | 5 -----
>  meta-networking/recipes-daemons/radvd/radvd_2.14.bb | 5 +++++
>  2 files changed, 5 insertions(+), 5 deletions(-)
>  delete mode 100644 meta-networking/recipes-daemons/radvd/radvd_2.11.bb
>  create mode 100644 meta-networking/recipes-daemons/radvd/radvd_2.14.bb
>=20
> diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.11.bb b/meta-n=
etworking/recipes-daemons/radvd/radvd_2.11.bb
> deleted file mode 100644
> index c0b7532..0000000
> --- a/meta-networking/recipes-daemons/radvd/radvd_2.11.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -
> -require radvd.inc
> -
> -SRC_URI[md5sum] =3D "57fc6021f6a5e5472e455937685472a3"
> -SRC_URI[sha256sum] =3D "80ad60b15689e9591a5af393a57a1d93304deeff2e46482f=
0fd98046c00622f8"
> diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.14.bb b/meta-n=
etworking/recipes-daemons/radvd/radvd_2.14.bb
> new file mode 100644
> index 0000000..2525249
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/radvd/radvd_2.14.bb
> @@ -0,0 +1,5 @@
> +
> +require radvd.inc
> +
> +SRC_URI[md5sum] =3D "acd3883dece2c7888d15596b05c9fae4"
> +SRC_URI[sha256sum] =3D "46d31c05daea11c3d1e3dc092997d3631b3bc72b20a4f279=
b05304b83dbd7aa8"
> --=20
> 2.7.4
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6ly54cpo6fyxsdp3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfHDOsACgkQN1Ujt2V2gBx3YwCdFlI6zAgVm1W48UCUX07b7Bcy
8AoAn1rgmboaHs30XSOTXmown/6QpUQ6
=gFNT
-----END PGP SIGNATURE-----

--6ly54cpo6fyxsdp3--
