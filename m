Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2fuZ-000094-JI
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 11:38:01 +0100
Received: by mail-wi0-f182.google.com with SMTP id hi18so2726783wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 02:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WVAZTDaurvz8DyG+fKXS+qu7bfqOpN96+caCJU8IIQc=;
	b=yX99j//uqBya9GgBZ2+umWOJtd2YSrWTR+xkQVkWMFlM7DA+mWZGYeTDcx+fhARQ9u
	4D2EZbfbkFJpyV4jVKZW+iLIooAIMcq74drMPfAp92QRQZmVmdR4qqne5gN/uk2G4COF
	uVGt87BJLWw8OV/kbXkubwLKur7RCve/IA0VUYILHdjUSWys5K+zQMWYvDK1dPR0uey6
	PDFDUPJ6Q+y9P7BRo/tOXyvRz34RvbcTJgvherLRGuF2Rj6lBaweLykGAk3zgALsoRs8
	btM6IpTRYOT/KeU57AtUm0v7PPbVBHshA/mAZBBzDEujvqaJYiH+1R1oNoccSa+iGkjW
	dSBg==
X-Received: by 10.180.93.41 with SMTP id cr9mr15913524wib.19.1360059729740;
	Tue, 05 Feb 2013 02:22:09 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w5sm5485787wif.11.2013.02.05.02.22.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 02:22:08 -0800 (PST)
Date: Tue, 5 Feb 2013 11:22:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130205102208.GM3271@jama>
References: <1359937872-26028-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1359937872-26028-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-xfce 0/4] further plugins
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
X-List-Received-Date: Tue, 05 Feb 2013 10:38:02 -0000
X-Groupsio-MsgNum: 42999
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AwgMNpd3VkAVXjS"
Content-Disposition: inline

--7AwgMNpd3VkAVXjS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2013 at 01:31:08AM +0100, Andreas M=FCller wrote:
> The following changes since commit 74ec0813562525d02da6ac45eb0237382e98a7=
2f:
>=20
>   xchat: add libsexy to DEPENDS (2013-02-01 17:44:22 +0100)

All 4 merged, thanks

>=20
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git xfce-pa=
tches
>=20
> Andreas M=FCller (4):
>       xfce4-mount-plugin: initial add 0.6.4
>       packagegroup-xfce-extended: add xfce4-mount-plugin
>       packagegroup-xfce-extended: add xfce4-brightness-plugin
>       orage: initial add 4.8.4
>=20
>  meta-xfce/recipes-apps/orage/orage_4.8.4.bb        |   16 ++++++++++++++=
++
>  .../mount/xfce4-mount-plugin_0.6.4.bb              |   10 ++++++++++
>  .../packagegroups/packagegroup-xfce-extended.bb    |    4 +++-
>  3 files changed, 29 insertions(+), 1 deletions(-)
>  create mode 100644 meta-xfce/recipes-apps/orage/orage_4.8.4.bb
>  create mode 100644 meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plu=
gin_0.6.4.bb
>=20
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7AwgMNpd3VkAVXjS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEQ3VAACgkQN1Ujt2V2gBzvzwCeMs8HFlJxTHEnjqyvdWyNetlt
Sy4An13P2k1l7j63//kGM2ppr+srCJ0G
=n+Je
-----END PGP SIGNATURE-----

--7AwgMNpd3VkAVXjS--
