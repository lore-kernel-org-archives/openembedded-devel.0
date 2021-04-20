Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.8324.1618912787402874595
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 02:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1lYnAX-0002NC-Qh; Tue, 20 Apr 2021 11:59:45 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1lYnAX-00039j-8m; Tue, 20 Apr 2021 11:59:45 +0200
References: <20210419202801.3834-1-u.oelmann@pengutronix.de>
 <CANPvuRnSx6Hy4VNnPk9WcMcyN+1HBu_hji0dGvfw+RsG5-KbbA@mail.gmail.com>
User-agent: mu4e 1.4.13; emacs 28.0.50
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] v4l-utils: fix reproducibility
In-reply-to: <CANPvuRnSx6Hy4VNnPk9WcMcyN+1HBu_hji0dGvfw+RsG5-KbbA@mail.gmail.com>
Date: Tue, 20 Apr 2021 11:59:45 +0200
Message-ID: <6r8s5dqnse.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Jose,

On Tue, Apr 20 2021 at 10:39 +0200, Jose Quaresma <quaresma.jose@gmail.com>=
 wrote:
> Hi Ulrich,
>
> The patches misses the Upstream-Status

thanks for recognizing - I completely forgot to add that information. A
v2 is already sent to the list.

Best regards
Ulrich
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
