Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4209473166
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 11:05:54 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id n3so126888647wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 04:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=T8XYRi4IrHAV371lzrFNGHuC2DIHo5rTJKmZX5SsXXY=;
	b=ZfkPwR5YReYNBvU7NR6+u1Fg3YQ0x+J5wWZpHDQmKPbt6wSOC6usTSNCZwFmgKkmGz
	+muJQ3Tx72YKmlTZ0njQuqMqp2AIaq5Cx5SS0syLu9zOJw4gamO73kANBFBOng/HB60g
	8IvbFdAxw3YJa2z/vb7ElcH1afB7C17NeH8gix6R9oswEvjHCO1KQJScPQQ2Ho6C63NL
	s4nGviIX8VtfSUP4Kw2uuuQiWutbp2mO43Csk60kPVKmSwRQvAcVxst+zH8WjCZUBDXL
	hb0V4nX98zUBnat9nbjzT2l2M8K4g6P3UMu9so6RVNze3f5s5qawX1DUkQXJPQCjjP+K
	E42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=T8XYRi4IrHAV371lzrFNGHuC2DIHo5rTJKmZX5SsXXY=;
	b=IJLSA4HyxFhqND3NAHvFUlQGX+1ioeewJgFH4zsL5XB/ueFZVlYPkgcfO6JP4BALAl
	xgRAgpqt2WNYkp/xiwdOiiegeOvSSbFqvoRh5gS89oN8VnZZVgLZiyQnLwBn4/DCdhkH
	LlXD0/9INmQEJs3ifxE/x/Gz7PeYtLwSbUwyANEDT7dvNWIm8inRMfGg2ibRWKdctU27
	M0oRGiycYUhUYpdUs9uyNup/1OmxzvUD9Wj8F8gAVVH5Ld1H7xXeagJQI86Yc2cLIwsd
	/Kx5VrgQJrYmhkNG2gxIpfNss5/D3GiyQSf9FfuJKcFOetgt7zV7CQH+ssdQHxCUoumB
	50YA==
X-Gm-Message-State: AOPr4FWRF+lExqvG3x73CEBMO527J+Z6dmWlfifhV/VpUTYAmTVY5gijjjGSAl3qjchsAw==
X-Received: by 10.194.116.103 with SMTP id jv7mr14732184wjb.22.1461236754837; 
	Thu, 21 Apr 2016 04:05:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ys9sm2271580wjc.35.2016.04.21.04.05.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Apr 2016 04:05:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 21 Apr 2016 13:08:19 +0200
To: ZHOU Yanxin <y.zhou@staubli.com>
Message-ID: <20160421110819.GA2240@jama>
References: <0495a539e9944301a10365a96225ad2a@FAV151WIN.staubli.pri>
MIME-Version: 1.0
In-Reply-To: <0495a539e9944301a10365a96225ad2a@FAV151WIN.staubli.pri>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: fsl-community-bsp + meta-qt5
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
X-List-Received-Date: Thu, 21 Apr 2016 11:05:57 -0000
X-Groupsio-MsgNum: 61097
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2016 at 02:46:29AM +0000, ZHOU Yanxin wrote:
> Dear Martin,

Hi Zhou,

> I have built the cross toolchain for qt5 and the rootfs  using: bitbake m=
eta-toolchain-qt5 and bitbake fsl-image-multimedia-full.
> Fsl-community-bsp and meta-qt5 both use Jethro branch.

Use ML for generic questions like this. I'm not actively using FSL

> Following are some of my questions:
>=20
>=20
> 1.       In the rootfs which I put in the "riotboard", is qt5 library alr=
eady in it? Do I need to compile the source of qt5 and copy it to the board
>=20
> Separately?

I don't know what fsl-image-multimedia-full image contains, but you
probably need to add it to the image like any other packages.

> 2.       I have set up the qtcreator: device, kit, qt version, compiler, =
debugger, also ssh connection, but when I run the application, qt says
>=20
> "This application failed to start because it could not find or load the q=
t platform plugin xcb, available platform plugin are: eglfs, minimal, minim=
alegl, offscreen".

Have you tried to set the correct platform?

> 3.       In the Jethro branch of meta-qt5, the qtbase.inc is missing, cor=
rect? I found on the internet, that I can modify the PACKAGECONFIG[gles] va=
lue, add -qpa eglfs.

qtbase.inc was integrated into qtbase_git.bb.

> 4.       I also found that in the Jethro branch, the serialport is also m=
issing, but in our application, we need this function to handle the serial =
keyboard.

Why you think it's missing? I see it there.

> Looking forward to your reply.
>=20
> Best regards!
>=20
> Yanxin ZHOU
> Electronic Product Engineering
> STAUBLI HANGZHOU LTD.
> No 123 Weiken Street Hangzhou Economic & Technological Development Zone
> 310018 Hangzhou / CN
> Phone: +86 40066 70066
> Mobile: +86 18605811677
> mailto: y.zhou@staubli.com<mailto:y.zhou@staubli.com>
> www.staubli.com<http://www.staubli.com>
> This e-mail and any attachment (the 'message') are confidential and privi=
leged and intended solely for the person or the entity
> to which it is addressed. If you have received it in error, please advise=
 the sender by return e-mail and delete it immediately.
> Any use not in accordance with its purpose, any dissemination or reproduc=
tion, either whole or partial, by entities other than
> the intended recipient is strictly prohibited.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcYtKIACgkQN1Ujt2V2gBy7lgCdFZqaWg93977GDrRHbIfelLqR
ENwAn2NkEmCJEDuAlpYjh9RyIkJsTQC5
=kiBX
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
