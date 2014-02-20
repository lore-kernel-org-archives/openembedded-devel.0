Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 235396F22C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 14:42:42 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id f15so959890eak.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 06:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+T7BlPY5HA1ektvITp9RUEj//2qo4cIhlmfyiCmBYGU=;
	b=L/VsIJMrfjoeLL1eLHdpPh4Sc4jp+MZn7v3lfy7+CbyHynMuDFvF3nsEkYP9gUHl5q
	9mcRKUd6h/gE1akccUtGrpsl1+rcj2DTqn1guTWxS+sO+XDPeCfyfQVFvy8DaKSqCbyV
	sjnx1+blj1GDDegFRyyjxGeHdNfJzSsOPgn/FgCzFLi67UCpDjS880LOYVOD9RnnP4ej
	2M7ZgIlWhVjOT+oTx3NK23K8CjS2eB1TYZnJCNlfbBRvTQvMwSbwe5+UCDVytR0k3Wm4
	vx7MHwfn7eDneXxVP1nQCsnUcmY41Ojlz+wSix/YVTQG+OC+mbBPDFM4h+MIk/QHCjdz
	hfSw==
X-Received: by 10.14.95.134 with SMTP id p6mr2223326eef.73.1392907362513;
	Thu, 20 Feb 2014 06:42:42 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k41sm14513606een.19.2014.02.20.06.42.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Feb 2014 06:42:40 -0800 (PST)
Date: Thu, 20 Feb 2014 15:43:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Tobias Blom <tobias@blom.org>
Message-ID: <20140220144314.GF3854@jama>
References: <94BAA6DD-BBE2-46CE-8248-E8432BE9F242@blom.org>
MIME-Version: 1.0
In-Reply-To: <94BAA6DD-BBE2-46CE-8248-E8432BE9F242@blom.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: python-netifaces in oe?
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
X-List-Received-Date: Thu, 20 Feb 2014 14:42:43 -0000
X-Groupsio-MsgNum: 48241
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Content-Disposition: inline

--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2014 at 03:35:19PM +0100, Tobias Blom wrote:
> Hi Martin,

Hi Tobias,

> I=E2=80=99m working with a yocto-project and needed a python module (neti=
faces). I now have a recipe for this, and I just wonder if it=E2=80=99s of =
any interest push this upstream?

Better to ask in openembedded-devel@lists.openembedded.org

Generally good recipes are always welcome.

> I=E2=80=99m pretty new to Yocto / OE, so I don=E2=80=99t really know how =
things works. Saw your name in the logs, and thought I=E2=80=99d just send =
an email and ask=E2=80=A6
>=20
> By the way, thanks for your work!

You're welcome

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMGFIIACgkQN1Ujt2V2gBxtTQCfViyZK5jT8uM8NUcJ+5KBx5I1
DtsAni2hQZx7lNSDO/cc49MXqOVCbXUY
=7NWR
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--
