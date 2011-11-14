Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RQ4Kv-0002Hl-4w
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 22:45:06 +0100
Received: (qmail invoked by alias); 14 Nov 2011 21:38:43 -0000
Received: from p5B0A3A75.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.58.117]
	by mail.gmx.net (mp050) with SMTP; 14 Nov 2011 22:38:43 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/SjUxC3rPSiZzDjB21yeU20d5NVTSx1hz6ZWCpdq
	Gsux42dhFyl9Cj
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Nov 2011 22:43:48 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201111140105.00784.schnitzeltony@gmx.de>
	<201111142207.50587.schnitzeltony@gmx.de>
In-Reply-To: <201111142207.50587.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201111142243.48373.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: networkmanager: update to 0.9.2.0 causes trouble
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
X-List-Received-Date: Mon, 14 Nov 2011 21:45:06 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday, November 14, 2011 10:07:50 PM Andreas M=FCller wrote:
> On Monday, November 14, 2011 01:05:00 AM Andreas M=FCller wrote:
> > since
> >=20
> > commit 037cb32f99f229c9c55a029bec088ebc7f59d278
> > Author: Koen Kooi <koen@dominion.thruhere.net>
> > Date:   Fri Nov 11 12:50:38 2011 +0100
> >=20
> >     networkmanager: update to 0.9.2.0
> >=20
> > wlan connects successfully to my router but *fails* to connect external
> > locations.
> >=20
> > networkmanager / nm-applet set up my network as
> > eth0: IPv4 fixed IP
> > wlan0: WPA & WPA 2 Personal / IPv4 DHCP
> >=20
> > Attached you find the results for networkmanager 0.9.2 and networkmanag=
er
> > 0.9.0 (reverted 037cb32f99f229c9c55a029bec088ebc7f59d278)
> >=20
> > My suggestion:
> > * revert 037cb32f99f229c9c55a029bec088ebc7f59d278 until fixed
> > * send a note to gnome bugzilla
>=20
=46YI: with network-manager-applet 0.9.2.0 the problem persists

Andreas


