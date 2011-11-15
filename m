Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RQJgZ-00087A-Hz
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Nov 2011 15:08:27 +0100
Received: (qmail invoked by alias); 15 Nov 2011 14:02:03 -0000
Received: from p5B0A3A75.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.58.117]
	by mail.gmx.net (mp066) with SMTP; 15 Nov 2011 15:02:03 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19NWOg4tsZNvNiavlX6cTygHl/WnNEXTW5Fxr0sIv
	g9lDaRpYqNQfZ6
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Nov 2011 15:07:09 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201111140105.00784.schnitzeltony@gmx.de>
	<201111142207.50587.schnitzeltony@gmx.de>
	<j9ti41$q4t$1@dough.gmane.org>
In-Reply-To: <j9ti41$q4t$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201111151507.09365.schnitzeltony@gmx.de>
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
X-List-Received-Date: Tue, 15 Nov 2011 14:08:27 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, November 15, 2011 12:23:45 PM Koen Kooi wrote:
> Op 14-11-11 22:07, Andreas M=C3=BCller schreef:
> > On Monday, November 14, 2011 01:05:00 AM Andreas M=C3=BCller wrote:
> >> since
> >>=20
> >> commit 037cb32f99f229c9c55a029bec088ebc7f59d278 Author: Koen Kooi
> >> <koen@dominion.thruhere.net> Date:   Fri Nov 11 12:50:38 2011 +0100
> >>=20
> >> networkmanager: update to 0.9.2.0
> >>=20
> >> wlan connects successfully to my router but *fails* to connect
> >> external locations.
> >>=20
> >> networkmanager / nm-applet set up my network as eth0: IPv4 fixed IP
> >> wlan0: WPA & WPA 2 Personal / IPv4 DHCP
> >>=20
> >> Attached you find the results for networkmanager 0.9.2 and
> >> networkmanager 0.9.0 (reverted
> >> 037cb32f99f229c9c55a029bec088ebc7f59d278)
> >>=20
> >> My suggestion: * revert 037cb32f99f229c9c55a029bec088ebc7f59d278 until
> >> fixed * send a note to gnome bugzilla
> >=20
> > FYI: with network-manager-applet the problem persists
>=20
> I'm seeing the same problem with default route not getting set, but rolli=
ng
> back to the older release won't solve much since binaries are already out
> there :/
>=20
> regards,
>=20
> Koen
So let's see it as another challenge :)

Andreas


