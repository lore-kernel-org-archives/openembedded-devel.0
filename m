Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RSeZT-0003Tn-2S
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 01:50:49 +0100
Received: (qmail invoked by alias); 22 Nov 2011 00:44:16 -0000
Received: from p5B0A17D0.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.208]
	by mail.gmx.net (mp006) with SMTP; 22 Nov 2011 01:44:16 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/my1k+v5vmw41Me4HNJ3hR0+OfxQbL1TH32u87R7
	Wh+hm/IN4PVO8H
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Nov 2011 01:44:15 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1321905239-3527-1-git-send-email-schnitzeltony@gmx.de>
	<jaeia9$bll$1@dough.gmane.org>
	<201111220049.20452.schnitzeltony@gmx.de>
In-Reply-To: <201111220049.20452.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201111220144.15440.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-oe][V2 0/4] libnl and iw updates to make networkmanager work
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
X-List-Received-Date: Tue, 22 Nov 2011 00:50:53 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, November 22, 2011 12:49:20 AM Andreas M=C3=BCller wrote:
> On Monday, November 21, 2011 11:11:22 PM Koen Kooi wrote:
> > Op 21-11-11 20:53, Andreas M=C3=BCller schreef:
> > > V1 -> V2: networkmanager bump PR
> > >=20
> > > Note: It might be required to rebuild wpa-supplicant coming from
> > > oe-core.
> >=20
> > I'll apply this set tomorrow if there are no comments, but could you al=
so
> > push libnl3 into oe-core and then bump PR for wpa-supplicant? If not,
> > could you add a wpa-supplicant bbappend that simply does PR_INC =3D 1 (=
or
> > PRINC, I forget) ?
>=20
> how about:
>=20
> 1st step:
> I'll send V3 in a few minutes with wpa-supplicant PR bump.
>=20
> 2nd step:
> * libnl-3 -> oe-core and remove workarounds for wpa-supplicant (symlink
> include/lib)
> * modify wpa-supplicant so that it works with libnl-3 without workarounds=
 &
> PR bump +2
> * iw -> oe-core?
>=20
> Since I am under pressure in my first life, 2nd step may take a few days.
>=20
> What do you think?
>=20
Sorry for spamming but: how about 2nd step only?

Andreas


