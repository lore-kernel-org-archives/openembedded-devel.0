Return-Path: <jlu@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3437F896
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 12:28:54 +0000 (UTC)
Received: from rettich.hi.pengutronix.de ([2001:67c:670:100:1d::c3]
	helo=rettich) by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iY83S-00016J-TJ; Fri, 22 Nov 2019 13:28:54 +0100
Received: from jlu by rettich with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iY83S-0000YG-Do; Fri, 22 Nov 2019 13:28:54 +0100
Message-ID: <5ac6d881cb97b2c4faf0f209793d5409d3d45222.camel@pengutronix.de>
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Nov 2019 13:28:54 +0100
In-Reply-To: <CAMKF1spBXDw5R42U0JT-kmQhFZvFUQp9vLvSXaJtV7gfvdST4A@mail.gmail.com>
References: <20191121120913.23013-1-jlu@pengutronix.de>
	<20191121120913.23013-5-jlu@pengutronix.de>
	<CAMKF1spBXDw5R42U0JT-kmQhFZvFUQp9vLvSXaJtV7gfvdST4A@mail.gmail.com>
Organization: Pengutronix
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c3
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 5/6] libp11: add support for native builds
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
X-List-Received-Date: Fri, 22 Nov 2019 12:28:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-11-21 at 10:49 -0800, Khem Raj wrote:
> > +
> > +BBCLASSEXTEND=3D"native"
>=20
> nitpick but space around =3D is preferred in such assignments

Of course. If there are no further issues, do you want to fix-up that
while applying or should I resend (this patch or the series)?

Regards,
Jan
--=20
Pengutronix e.K.                        | Dipl.-Inform. Jan L=C3=BCbbe     =
|
Steuerwalder Str. 21                    | https://www.pengutronix.de/ |
31137 Hildesheim, Germany               | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686        | Fax:   +49-5121-206917-5555 |

