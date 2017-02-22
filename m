Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id E256A72FB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 22:51:12 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id z61so11716237wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=E9CNaXrqaE2s0iWXNMLhzOSyV8n6TGU9NNQg5lf3tTQ=;
	b=HmSkfnIaZdGJLpvtPS6YrbER3NUxx+oadYE7w4bIxxK1uMWVbT+MRNBnnxAMNzLekQ
	SKWz5miVSuPsBYW/SOrtLzo/BR7qvaFf1MNLhJ5QrjJFtmnl9ZvHRRgUPJhJucfPdHAm
	CjxsioC27Jksek1eQklPid/U32S8KpnJEAYviUE520PjiccpTPyYEpZWk9B/Kd4VfoBX
	LNs7horP482VdO53S/CYMV9WFGBydzVz+RJHGdTRnLvtqWvl8mL0cOKikvM6/+TU4dAj
	Z9QbxrLsdcWcoqWXeiueir95cgtS39BYG1YoyNDi4i4HkESE0nGWSqSzAFdJzNZOsxjo
	s6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=E9CNaXrqaE2s0iWXNMLhzOSyV8n6TGU9NNQg5lf3tTQ=;
	b=PJRb1Kr+C5N8eObaz3hbCYaf1QLJa6i6tBx2O1NDpq0Zg/nDO6FJgdfAU86VqDRY5M
	OWPf1pgnijU8ZpSbdMkWRkh7Dn5xFg5hr6vF1NMdSS1KKJH08L+/1UYruMpvX0bo/SIx
	HVJnkcKqmFzKfDi+yIBXTs46puZLWhIwGr7CSrKeY92/r5bnHZlpGdI5tg6HPtYLm16o
	zcvNNPn26VqYmBw0Jd6p1Z3AXZP0AXgpoha3I1Z/NhBpucOVBzGsnzhnuFWlpSVqJxnK
	uiKBMGsWmYQA5fW33dxlROscORYLJtatEh75UDwbqakRmJWGpu2ahfhQfA+XWVC4g9Ce
	3Fhw==
X-Gm-Message-State: AMke39nEmUuY3SugQBncAPhwFaWSdjUq+gDn04OuUXHRVYT45Gn3eX5rF+ZovVc/okwbqQ==
X-Received: by 10.223.129.74 with SMTP id 68mr24728334wrm.183.1487803873069;
	Wed, 22 Feb 2017 14:51:13 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e72sm4261818wma.16.2017.02.22.14.51.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Feb 2017 14:51:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Feb 2017 23:51:12 +0100
To: "MacDonald, Joe" <Joe_MacDonald@mentor.com>
Message-ID: <20170222225112.GI3283@jama>
References: <2fd7334f-118c-44e2-9c17-a4e9f432d506@email.android.com>
MIME-Version: 1.0
In-Reply-To: <2fd7334f-118c-44e2-9c17-a4e9f432d506@email.android.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Before you ping some older patches
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
X-List-Received-Date: Wed, 22 Feb 2017 22:51:13 -0000
X-Groupsio-MsgNum: 65466
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJFRpmOek+ZRSQoz"
Content-Disposition: inline

--IJFRpmOek+ZRSQoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2017 at 10:26:54PM +0000, MacDonald, Joe wrote:
> It might just be me, but the list in general has seemed a bit off since a=
t least Monday. I have good reason to believe it has eaten at least two of =
my posts.

During OEDAM discussion I also had a feeling that both my replies to
"Splitting meta-oe?" thread were eaten by the ML gremlins, but both
appear at:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/th=
read.html
so that wasn't the case.

> On Feb 22, 2017 4:33 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> 1) Make sure they aren't already in master (or master-next), currently
> there is only one change in master-next:
> eb7979113 netcat-openbsd: fix implicit dependency on pkg-config
>=20
> 2) Make sure there weren't some negative feedback comments on our change
>=20
> 3) Make sure the change made it to patchwork, currently there is only
> one "open" change:
> https://patchwork.openembedded.org/patch/137499/
>=20
> Be aware that the changes are usually daily marked as archived, when
> they are sorted to corresponding bundles and included in master-next
> branch for testing, as described here:
> http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_sa=
me_oe_project_on_patchwork
>=20
> I'm writing this, because currently many changes are missing on patchwork,
> because of some unknown issue with it, see:
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/=
111467.html
> once this issue is resolved, please re-send missing changes.
>=20
> Regards,
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IJFRpmOek+ZRSQoz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK4V3wAKCRA3VSO3ZXaA
HMbWAJ47DX2gCwG8+I26vP7kqtkH7oCbVwCgl2Ik6mLXcVSl7d/QnpSSNCL++ho=
=zIFz
-----END PGP SIGNATURE-----

--IJFRpmOek+ZRSQoz--
