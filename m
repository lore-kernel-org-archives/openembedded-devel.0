Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 100DA71A87
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 07:42:59 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id xy5so7852179wjc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 23:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=azuqHLO9zqja+1O6q98SoB2g2d3gyT68pDQQmBUjMKA=;
	b=CXGYwrZazsnAvV0/mMbOTTOPcseh/0MwX9pGeAB01xlyovOJf4OT5J+EsasbuYJBw8
	L+L/dAspZ/RIVXa7bbU1P3TO5x1kObS2/lQ7a23Ky+/P5NruYlUJZM92rbvrJxSUYm9e
	IM0oSfi5+0TXX3b8+igHsVaMRYJDcH/fyhCJJxp9KLjAXkU52vD4fS27wn5Swb+Ycd+k
	i7/RD+qUenpuOLD6NdyfnLj6KKNey5v2EpTsSMqfw/K3YvoJvDq4SOiV2BMYXW4k2ksu
	o0/aRzVUnjRJ377uVcoDD+W23LNYkoDaN6RWZo4HGht+a9FPcNBu+gV/Rr4RhHQqrOYK
	U3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=azuqHLO9zqja+1O6q98SoB2g2d3gyT68pDQQmBUjMKA=;
	b=CDWFNmC6l2CwM9VJBx+az3JsT1k7micgzUEM1R/JvTe6soiUuRwdFdhhFXfnLeGuH1
	NHhPBsbVvYC+WrzDoI64s/SxNdvnpwrmoxM95U6NULXq4s/LyQR/O/iJs6Bcghsjdacq
	uFiIr4XjQZ+f+yU9Yj1icPl32IbkPrjowZv9MYs6a9bA+q7uXwzCrZMVfrIS3QDp8ivW
	MghFFsUtDnqdaw9c7+bhrL2YPWnaUEaXccYYZpnjTBQ4aH41FR2kaitFNHyspG2T5vhv
	E7qyQ46hjLsSyIuV5VkRGDyGPG9sD/n/XQ1ZK9JxeV1g7UAVUo0JwGkKaihgl3PJzXNr
	aCQQ==
X-Gm-Message-State: AKaTC016TgyVvg/F35NrnfOeOe7EKJ7Z0l/1c/w/A33FbkfBiMHN2rcmyXBtTpMsj4Kdhg==
X-Received: by 10.194.8.226 with SMTP id u2mr10687908wja.91.1480146180827;
	Fri, 25 Nov 2016 23:43:00 -0800 (PST)
Received: from [172.20.0.13] (ip4da29576.direct-adsl.nl. [77.162.149.118])
	by smtp.gmail.com with ESMTPSA id
	d184sm17369908wmd.8.2016.11.25.23.42.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 23:42:59 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20161126001515.GB8369@jama>
Date: Sat, 26 Nov 2016 08:42:58 +0100
Message-Id: <A6D1B2BE-C658-4114-AF39-FAC0249D4F98@dominion.thruhere.net>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-8-raj.khem@gmail.com>
	<20161126001515.GB8369@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH 08/49] kodi: Add krypton/17.x Jarvis/16.x recipes
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
X-List-Received-Date: Sat, 26 Nov 2016 07:43:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 26 nov. 2016, om 01:15 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:
>=20
> On Wed, Nov 23, 2016 at 01:21:28AM -0800, Khem Raj wrote:
>> 16.x is the default since its the latest released version
>>=20
>> remove obsoleted xbmc recipes
>> rename to recipes-mediacenter
>> +S =3D "${WORKDIR}/git"
>> +
>> +# breaks compilation
>> +ASNEEDED =3D ""
>> +
>> +ACCEL ?=3D ""
>> +ACCEL_x86 =3D "vaapi vdpau"
>> +ACCEL_x86-64 =3D "vaapi vdpau"
>> +
>> +PACKAGECONFIG ??=3D "${ACCEL}"
>> +PACKAGECONFIG_append +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'x11', ' x11', '', d)}"
>> +PACKAGECONFIG_append +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'opengl', ' opengl', ' openglesv2', d)}"
>> +
>> +PACKAGECONFIG[opengl] =3D "--enable-gl,--enable-gles,"
>> +PACKAGECONFIG[openglesv2] =3D =
"--enable-gles,--enable-gl,virtual/egl"
>> +PACKAGECONFIG[vaapi] =3D "--enable-vaapi,--disable-vaapi,libva"
>> +PACKAGECONFIG[vdpau] =3D "--enable-vdpau,--disable-vdpau,libvdpau"
>> +PACKAGECONFIG[mysql] =3D "--enable-mysql,--disable-mysql,mysql5"
>> +PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,libxinerama =
libxmu libxrandr libxtst"
>> +PACKAGECONFIG[pulseaudio] =3D =
"--enable-pulse,--disable-pulse,pulseaudio"
>=20
> Did I overlook libva recipe somewhere?
>=20
> It doesn't even start building for qemux86* because of this libva and
> for qemuarm it fails to configure:
> =
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/1=
10050.html

libva is in meta-intel, meta-amd and meta-kodi. I guess we should =
consider moving it to OE-core or meta-oe.

regards,

Koen


