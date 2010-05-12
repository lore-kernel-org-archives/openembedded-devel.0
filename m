Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OC8Xu-0003fe-9I
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 11:48:06 +0200
Received: from [192.168.1.2] (e180154083.adsl.alicedsl.de [85.180.154.83])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 4A662584111
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 11:50:12 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinrTuitVH__A-t7tjdit9HLCf7AYFyl1w4vFLIo@mail.gmail.com>
References: <20100510232720.GA13708@gmail.com>
	<201005111239.57770.khimov@altell.ru>
	<AANLkTinrTuitVH__A-t7tjdit9HLCf7AYFyl1w4vFLIo@mail.gmail.com>
Organization: Vanille-Media
Date: Wed, 12 May 2010 11:44:10 +0200
Message-ID: <1273657450.1773.43.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Move gcc 4.4.3 recipes in favour of 4.4.4
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
X-List-Received-Date: Wed, 12 May 2010 09:48:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 12.05.2010, 11:39 +0200 schrieb Martin Jansa:
> On Tue, May 11, 2010 at 10:39 AM, Roman I Khimov <khimov@altell.ru> wro=
te:
> > =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 11 =D0=BC=D0=B0=D1=8F 2010=
 03:27:20 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB:
> >> 4.4.3 is not so widely used in distributions unlike 4.4.2
>=20
> Hi,
>=20
> My guess: just because it's not preferred by sane-toolchain.inc?
>=20
> >> I can also just add 4.4.4 and leave 4.4.3 as it is if someone wants
> >> to keep using 4.4.3
> >
> > Using 4.4.3 here, think it'd be nice to move to 4.4.4.
>=20
> what about updating
> conf/distro/include/sane-toolchain.inc
> to 4.4.4 if we don't find any new issue with it?

Sounds good.

--=20
:M:



