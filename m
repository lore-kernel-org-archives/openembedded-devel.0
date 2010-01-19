Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1NXFFU-0000Nt-Pr
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 15:40:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 8ED132C820
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 14:34:54 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0HcAdsseA1v
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 14:34:50 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 2489D2C7D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 14:34:49 +0000 (UTC)
Message-ID: <4B55C3E1.2070505@gmail.com>
Date: Tue, 19 Jan 2010 15:38:25 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B54F654.4000500@atmel.com>
	<4B55B26C.5040706@gmail.com>	<023001ca9911$809fa3c0$81deeb40$@Willis@Distant-earth.com>
	<023d01ca9913$3cddd600$b6998200$@Willis@Distant-earth.com>
In-Reply-To: <023d01ca9913$3cddd600$b6998200$@Willis@Distant-earth.com>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Angstrom: x11-gpe-image : Calibration of Screen ?
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
X-List-Received-Date: Tue, 19 Jan 2010 14:40:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

John Willis ha scritto, Il 19/01/2010 15:25:
>> I started to work on a fresh reimplementation of that code to return
>> calibration information that could be fed into either xinput evtouch o=
r
>> xinput evdev (if you use a recent version of either driver that
>> supports calibration for TS devices). I never finished the
>> reimplementation work so a lot of the code is still the original un-
>> credited code.
>=20
> Typical,
>=20
> All the funky work in http://www.freedesktop.org/wiki/Software/xinput_c=
alibrator make any 2bit hacky code rather irrelevant. Time to get xinput_=
calibrator into OE :).=20
>=20
> Thanks for the pointers to this app guys.
>=20

John,
I appreciated your comment about it because looks like a general-purpose
calibration tool useful with any kind of recent xorg server.

Let's wait Petr (ynezz) recipe and I am going to send back my results ;-)

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


