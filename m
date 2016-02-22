Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id D74106FFC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:26:44 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id c200so171105656wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lXvI9Gn+0QPhALqOgP7YDqEEIoSeMS8cY4IWPZhWxWU=;
	b=J4robiqlM8tTJPF8QaH8AKaXvtHVzY9kxqM5jCoQQx+ZjAxfoyI0MIADCc210dfP4q
	VG94368pK353oIocKshFf4VnuMAX5/680Mm2N0qUqvVfO/MazuEqdjTICiefagXAnOrZ
	ltsOhFwEI8UpyHPFuSZXe0yU7YEBcOhZv5oycBqXdCI2eZLrj4pHZ/bf9VTNpQsYywXm
	UkwIoo7v2jhjKZzdFYe4TMZrEYPqtmyav3xmG5S5VnQOn62hMoSfquu8li6RQLl6w0Rl
	WsSqxcIM4Uraidoiz7touKFofRnutKHpjHsD7xgjcFII+dVp2fb0f/0xXDtbo8IN8sIc
	5SvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=lXvI9Gn+0QPhALqOgP7YDqEEIoSeMS8cY4IWPZhWxWU=;
	b=Vlz6K4M0esLEMsAxdUZbsGA8XX+9ko9y87b3TozeSDT78NOwF+hPm0ua32wfuzk2ja
	NuuM8RX3Slokxnrl1LhV/vG47D/Ig1q5YqDerE30CL/tYbES5M8xp0E8+hhJTiUYd/Nm
	mdIimWW4zh/x8fUlAOoVTP1vAoq1DIChHux2rTv2cIOVBgoRX4bonC++OfRwSLV0dL1c
	pw9x1SfcgYOcu4+/EgNlGl4VAlNrdxzyMFpeFf6pr8X88k6nqY74kEHZB7XnplE+JuMe
	iiwA086P41zyU553ItAVL6XhFm4yEM1oltDvYsGCNTI26UV+q5qTpMbUKhNMv1Yn4b9q
	fVGA==
X-Gm-Message-State: AG10YOSAaufSweHnaqhXTaY876ZHbS15izyTwdB8MaSNP1iOPY+VVBT7+z0GiOdNDhudkQ==
X-Received: by 10.194.205.8 with SMTP id lc8mr27008971wjc.177.1456147604938;
	Mon, 22 Feb 2016 05:26:44 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c136sm21012140wmd.3.2016.02.22.05.26.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:26:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Feb 2016 14:27:36 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160222132736.GA6329@jama>
References: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 0/4] cn/jp/kr/tw fonts
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
X-List-Received-Date: Mon, 22 Feb 2016 13:26:46 -0000
X-Groupsio-MsgNum: 60097
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 13, 2016 at 02:52:03PM +0100, Andreas M=FCller wrote:
> Did not yet find somebody reading them but to me they look authentic

All these get dependency on fontconfig making them TUNE_PKGARCH not
allarch.

I'll fix that in follow up commit, but keep that in mind when adding
more fonts.

> Andreas M=FCller (4):
>   source-han-sans-cn-fonts: initial add 1.004
>   source-han-sans-jp-fonts: initial add 1.004
>   source-han-sans-kr-fonts: initial add 1.004
>   source-han-sans-tw-fonts: initial add 1.004
>=20
>  .../44-source-han-sans-cn.conf                     | 19 ++++++++++++
>  .../ttf-fonts/source-han-sans-cn-fonts_1.004.bb    | 34 ++++++++++++++++=
++++++
>  .../44-source-han-sans-jp.conf                     | 19 ++++++++++++
>  .../ttf-fonts/source-han-sans-jp-fonts_1.004.bb    | 34 ++++++++++++++++=
++++++
>  .../44-source-han-sans-kr.conf                     | 19 ++++++++++++
>  .../ttf-fonts/source-han-sans-kr-fonts_1.004.bb    | 34 ++++++++++++++++=
++++++
>  .../44-source-han-sans-tw.conf                     | 19 ++++++++++++
>  .../ttf-fonts/source-han-sans-tw-fonts_1.004.bb    | 34 ++++++++++++++++=
++++++
>  8 files changed, 212 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn=
-fonts/44-source-han-sans-cn.conf
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn=
-fonts_1.004.bb
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp=
-fonts/44-source-han-sans-jp.conf
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp=
-fonts_1.004.bb
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr=
-fonts/44-source-han-sans-kr.conf
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr=
-fonts_1.004.bb
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw=
-fonts/44-source-han-sans-tw.conf
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw=
-fonts_1.004.bb
>=20
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbLDMcACgkQN1Ujt2V2gBwwugCgjD4RaoedtWLKpEXfYdqJhIuI
WmQAn3hpPB4zJLV63JMzwZ3ZaVnH6lKi
=dxx5
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
