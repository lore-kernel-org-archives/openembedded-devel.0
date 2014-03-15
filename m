Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id AE8246F65F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 15:22:36 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id up15so3856953pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 08:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:message-id:mime-version:subject:date:references
	:to:in-reply-to;
	bh=re00h2Q09alBG92gF7Zj12vq04UP9dncoIjxsL36zXA=;
	b=C8hATXCHbPyiWaUqugQKYy5IA0zVaoOb+aJywktieR3lDpPFi3tPHKKF27x144pbDO
	JB3rGv5jNIezWkDJV1myn8e7kLVZ5ZAEToFAkU6Fd+4GFMKBM+hcJPnCI7JYS5dz/gYR
	jgzzuOy8rW7dtGmY92Z1KJ74NhxVm9naXHkK5BloLkuicyJzMDgNIzzL8k+7yevaZypD
	QAjbaDT3ozEpwklliPuO997aBKu6J1j2ysn+IIF2IG710E+CcJfkenUYio8IXeOWSuHD
	mKLCVYiix9UdmMmFTiWeIlspeV6ROrXqoOzhcPvBIS4Q3Sw0m5VkrPgru7v/0JdM/tTk
	YK6g==
X-Received: by 10.68.134.198 with SMTP id pm6mr15507768pbb.9.1394896956962;
	Sat, 15 Mar 2014 08:22:36 -0700 (PDT)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	iv2sm26904925pbc.19.2014.03.15.08.22.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Mar 2014 08:22:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <2D16971D-4F6B-4162-8CD6-E28C34160B11@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Date: Sat, 15 Mar 2014 08:22:33 -0700
References: <1394895279-7276-1-git-send-email-net147@gmail.com>
	<64904C75-41B7-43D4-9ED0-16AB64F12285@gmail.com>
	<20140315152003.GK3759@jama>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20140315152003.GK3759@jama>
X-Mailer: Apple Mail (2.1874)
Subject: Re: [meta-qt5][PATCH] licenses: rename NOKIA-TPLA-2.4 to DIGIA-TPLA-2.4
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
X-List-Received-Date: Sat, 15 Mar 2014 15:22:38 -0000
X-Groupsio-MsgNum: 48697
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0D45B8BA-D1BB-4842-B3ED-DD4C45B16937";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0D45B8BA-D1BB-4842-B3ED-DD4C45B16937
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Mar 15, 2014, at 8:20 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Sat, Mar 15, 2014 at 08:04:14AM -0700, Khem Raj wrote:
>>=20
>> On Mar 15, 2014, at 7:54 AM, Jonathan Liu <net147@gmail.com> wrote:
>>=20
>>> The license agreement doesn't mention Nokia anymore after Qt was
>>> acquired by Digia.
>>>=20
>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>> ---
>>> licenses/{NOKIA-TPLA-2.4 =3D> DIGIA-TPLA-2.4} | 0
>>> recipes-qt/qt5/qt3d.inc                     | 2 +-
>>> 2 files changed, 1 insertion(+), 1 deletion(-)
>>> rename licenses/{NOKIA-TPLA-2.4 =3D> DIGIA-TPLA-2.4} (100%)
>>>=20
>>> diff --git a/licenses/NOKIA-TPLA-2.4 b/licenses/DIGIA-TPLA-2.4
>>> similarity index 100%
>>> rename from licenses/NOKIA-TPLA-2.4
>>> rename to licenses/DIGIA-TPLA-2.4
>>> diff --git a/recipes-qt/qt5/qt3d.inc b/recipes-qt/qt5/qt3d.inc
>>> index 78b9ecc..74c4cad 100644
>>> --- a/recipes-qt/qt5/qt3d.inc
>>> +++ b/recipes-qt/qt5/qt3d.inc
>>> @@ -2,7 +2,7 @@ require qt5.inc
>>>=20
>>> DEPENDS +=3D "qtdeclarative"
>>>=20
>>> -LICENSE =3D "GFDL-1.3 & LGPL-2.1 & NOKIA-TPLA-2.4 | GPL-3.0"
>>> +LICENSE =3D "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0=94
>>=20
>> you need to rename the license file too
>=20
> he did :)
>=20
> sorry it's my mistake, when I was updating license text from newer =
qt3d
> repo I haven't noticed nokia->digia change between whitespace changes
>=20
> should we use the same text for dylan,dora,master even when older qt3d
> revisions have older text? I think it would be better to have
> DIGIA-TPLA-2.4 everywhere.


I think call it QT-TPLA-2.4 and then the name becomes universal

--Apple-Mail=_0D45B8BA-D1BB-4842-B3ED-DD4C45B16937
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMkcDkACgkQuwUzVZGdMxS6dwCeMrOQJn6ab04BhJzMYpm9pOev
gokAnRRY+jFT7j9+0rpu4fk4we7+W1H4
=SS9i
-----END PGP SIGNATURE-----

--Apple-Mail=_0D45B8BA-D1BB-4842-B3ED-DD4C45B16937--
