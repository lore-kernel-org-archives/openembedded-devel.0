Return-Path: <uol@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8587E7D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:56:37 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hgWlK-0007JQ-Eu; Thu, 27 Jun 2019 17:56:38 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hgWlH-00084j-1c; Thu, 27 Jun 2019 17:56:35 +0200
References: <CAP9ODKooyOFZb7fYcLGM8QRaJR2skz-xhWX+Epq1DECzNBQbOQ@mail.gmail.com>
	<20190626232342.9017-1-u.oelmann@pengutronix.de>
User-agent: mu4e 1.1.0; emacs 26.1
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <20190626232342.9017-1-u.oelmann@pengutronix.de>
Date: Thu, 27 Jun 2019 17:56:35 +0200
Message-ID: <6rsgrvvx70.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Cc: Maksim Sisov <msisov@igalia.com>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	=?utf-8?Q?S=C3=B8ren?= Andersen <san@skov.dk>
Subject: Re: [meta-browser][PATCH] README: update list of maintainers
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
X-List-Received-Date: Thu, 27 Jun 2019 15:56:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi there,

to ease the development flow I created a pull request on GitHub for this
subthread's patch as well :)

  https://github.com/OSSystems/meta-browser/pull/279

Best regards
Ulrich


On Thu, Jun 27 2019 at 01:23 +0200, Ulrich =C3=96lmann <u.oelmann@pengutron=
ix.de> wrote:
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>  README | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/README b/README
> index 0a005a8b5ea6..31d361d2ab41 100644
> --- a/README
> +++ b/README
> @@ -23,13 +23,15 @@ revision: HEAD
>  Contributing
>  ------------
>
> -To contribute to this layer you should the patches for review to the
> +To contribute to this layer you should send the patches for review to the
>  OpenEmbedded dev mailing list openembedded-devel@lists.openembedded.org
>  and please cc the maintainers.
>
> -Maintainers: Eric B=C3=A9nard <eric@eukrea.com>
> -             Denis Carikli <denis@eukrea.com>
> +Maintainers: Fabio Berton <fabio.berton@ossystems.com.br>
> +             Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
> +             Khem Raj <raj.khem@gmail.com>
>               Otavio Salvador <otavio@ossystems.com.br>
> +             Maksim Sisov <msisov@igalia.com>
>
>  When sending single patches, please use something like :
>  git send-email -1 -s --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-browser][PATCH'
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

