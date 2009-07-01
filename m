Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM0WN-0007sX-Jj
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 16:10:58 +0200
Received: (qmail 20039 invoked by uid 813007); 1 Jul 2009 13:58:52 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 13:58:52 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 1 Jul 2009 15:58:51 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.31-rc1-00272-g404d6df; KDE/4.2.4; x86_64; ;
	)
References: <20090701115959.GA10962@pcimg12.dei.unipd.it>
In-Reply-To: <20090701115959.GA10962@pcimg12.dei.unipd.it>
MIME-Version: 1.0
Message-Id: <200907011558.52497.marcin@juszkiewicz.com.pl>
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
X-List-Received-Date: Wed, 01 Jul 2009 14:11:16 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =C5=9Broda, 1 lipca 2009 o 13:59:59 Ottavio Campana napisa=C5=82(a):

> This time  I need a  small arm with  standard peripherals (UART,  SPI
> or I2C) and ethernet.  The task it has  to do is controlling  a few
> devices with the commands received over TCP/IP.
>
> Since I don't know all the supported machines, can you suggest me a
> cost effective ARM7 or ARM9 board that works well with OE
> stable/2009?

Check FriendlyARM devices on http://friendlyarm.eu/ - they costs 125=E2=82=
=AC=20
for qvga and 160=E2=82=AC for wvga version. You get Samsung s3c2440, 64MB r=
am,=20
ethernet, 3 rs232 ports, usb host/device, audio in/out and extra signals=20
at connectors.

This is one of cheapest solution for embedded devices.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




