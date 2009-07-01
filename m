Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MLzCt-0000Na-Pz
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 14:46:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 8059E2C825
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2009 12:34:26 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3VXyGbCBEFY
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2009 12:34:25 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 97D1B2C81E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2009 12:34:24 +0000 (UTC)
Message-ID: <4A4B5804.705@gmail.com>
Date: Wed, 01 Jul 2009 14:35:16 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090701115959.GA10962@pcimg12.dei.unipd.it>
In-Reply-To: <20090701115959.GA10962@pcimg12.dei.unipd.it>
Subject: Re: looking for an arm-based board
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
X-List-Received-Date: Wed, 01 Jul 2009 12:46:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ottavio Campana ha scritto:
> Hi,
>=20
> I'm starting  a new  project based  on linux embedded.  This time  I ca=
n
> choose the platform to  use, and I'd like to use  an arm based solution=
,
> because I previously used TI davinci soc  and I was satisfied by the ar=
m
> (a bit less by montavista...).
>=20
> This time  I need a  small arm with  standard peripherals (UART,  SPI o=
r
> I2C) and ethernet.  The task it has  to do is controlling  a few device=
s
> with the commands received over TCP/IP.
>=20
> Since I don't know all the supported machines, can you suggest me a cos=
t
> effective ARM7 or ARM9 board that works well with OE stable/2009?
>=20
> Thank you,
>=20

Ottavio,
we at KOAN are currently supporting Ronetix' board PM9263 with in OE
main tree and stable/2009 with KaeilOS distro.

http://www.ronetix.at/pm9263.html
http://www.kaeilos.com/?q=3Ddownload

Further supported boards from other producers are on the way, stay tuned =
;-)

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com





