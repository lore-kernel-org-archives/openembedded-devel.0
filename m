Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NRd0c-0006Yx-Vh
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 03:49:34 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 38FCF1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2010 02:44:43 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 4 Jan 2010 03:47:14 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1262570891.5811.14.camel@dejunliu-desktop>
In-Reply-To: <1262570891.5811.14.camel@dejunliu-desktop>
MIME-Version: 1.0
Message-Id: <201001040347.14305.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: help on angstrom qemu
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jan 2010 02:49:34 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 04 January 2010 03:08:11 Dejun.Liu wrote:

> and the error is shown below:
> =EF=BB=BF> Could not initialize SDL - exiting
>=20
> > SDL error: No available video device

How does this relate to OpenEmbedded? Which qemu did you use? it might not =
be=20
able to connect to your X11 display as you have executed this command on yo=
ur=20
buildserver but did not use ssh -Y to log in?



>=20
> and i hava found that OE provided libSDL does not supported X11.

I don't know what you mean. The libsdl-x11 recipe supports libsdl on X11 ju=
st=20
fine...





> -------------------------------------------------------------------------=
=2D-
> ------------------------ Confidentiality Notice: The information contained
>  in this e-mail and any accompanying attachment(s) is intended only for t=
he
>  use of the intended recipient and may be confidential and/or privileged =
of
>  Neusoft Corporation, its subsidiaries and/or its affiliates. If any read=
er
>  of this communication is not the intended recipient, unauthorized use,
>  forwarding, printing,  storing, disclosure or copying is strictly
>  prohibited, and may be unlawful.If you have received this communication =
in
>  error,please immediately notify the sender by return e-mail, and delete
>  the original message and all copies from your system. Thank you.


^^ remove that garbage when posting to a public mailinglist or do not post =
at=20
all.


