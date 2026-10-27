Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14616.1793092733217650316
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=HfBNxEhB;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: james@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793092730;
	bh=bii/el56DWgP2kxhKoMg0eg5K09tgZief+9Ye7gGDC8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HfBNxEhB7L7YsHH/J1Ze26faXO/hHFM3nqAmVjXjed3uO+nAoF42hPxc8NyoLuJ6C
	 tZrAdZg0np7e7wRr5Ovw7RG6LeSjw/Z10WtR05sKkC4+CV+ie3fbR60NiNCGboGq+8
	 q7Y0RrWBr66t3VmEFkctM7F8W2G6GvwlYe/c2QzkqX90IbJ5kAaPBnp67jRKSxyIUd
	 zdGd1VaGE1Xmmf3BDzvf83Tw5x33flVpa6Vu/xFH28Uu4pdE8KCkbHpFoE4XArdG0b
	 I/eMXDpU9P9Q5PgDY2/7OTBzqERCZWv2r47tdp0KUtZA6gNbYXXRc48HMO3+x3vgXT
	 ht4+wke72CTEA==
Received: from [192.168.72.170] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CB71C64AA9;
	Tue, 27 Oct 2026 17:18:50 +0800 (AWST)
Message-ID: <7ca6f13e92076999779165bbdd3a6f2298f6fdbc.camel@codeconstruct.com.au>
Subject: Re: [oe] [blacksail][meta-networking][PATCH] mctp: upgrade 2.6 ->
 2.6.1
From: James Lee <james@codeconstruct.com.au>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, jk@codeconstruct.com.au
Date: Tue, 27 Oct 2026 17:18:50 +0800
In-Reply-To: <CADySD0F3PJ3eVNkSW0nWBXP0Z5V95wVLAB3gneXo4zVsz+4V3A@mail.gmail.com>
References: <20261027081632.2560647-1-james@codeconstruct.com.au>
	 <CADySD0F3PJ3eVNkSW0nWBXP0Z5V95wVLAB3gneXo4zVsz+4V3A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131464

Hi Ankur,

On Tue, 2026-10-27 at 22:15 +1300, Ankur Tyagi wrote:
>=20
> Please send v2 with updated SRCREV
>=20
> cheers
> Ankur

Thanks for catching that, will send immediately.
All the best,=20
James
