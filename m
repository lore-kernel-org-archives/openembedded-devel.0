Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RpKmW-0004uv-UO
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 15:22:03 +0100
Received: (qmail invoked by alias); 23 Jan 2012 14:14:16 -0000
Received: from ip-95-222-156-232.unitymediagroup.de (EHLO
	zera-git-ew.localnet) [95.222.156.232]
	by mail.gmx.net (mp068) with SMTP; 23 Jan 2012 15:14:16 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/mcxs4dxbmi0+jEPlvjQ72kk9uoUcETx3D9sy2pQ
	7P/8mKPb0Np6gn
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 15:14:16 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.41.9-1.fc15.x86_64; KDE/4.6.5; x86_64; ; )
References: <1327304731-4251-1-git-send-email-schnitzeltony@gmx.de>
	<1327304731-4251-3-git-send-email-schnitzeltony@gmx.de>
	<jfjocm$edq$1@dough.gmane.org>
In-Reply-To: <jfjocm$edq$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201201231514.17050.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-oe 3/3] gimp: initial add 2.6.11
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
X-List-Received-Date: Mon, 23 Jan 2012 14:22:03 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday, January 23, 2012 02:47:02 PM Koen Kooi wrote:
> Op 23-01-12 08:45, Andreas M=FCller schreef:
> > * based on oe-classic [1]-[2] * build tested incremental & from scratch
> > in angstrom environment * run tested on overo
> >=20
> > [1] http://cgit.openembedded.org/openembedded/tree/recipes/gimp/gimp.inc
> > [2]
> > http://cgit.openembedded.org/openembedded/tree/recipes/gimp/gimp_2.6.8.=
bb
>=20
> I
>=20
> get the following error when building from arm:
>=20
>=20
> /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/l=
ib
> /libpangocairo-1.0.so: file not recognized: File format not recognized
>=20
If I understand that correct, something tries to access (link against?) nat=
ive=20
lib (in task compile?).=20
Can you paste the log files somewhere to see when this error exactly occure=
s=20
and to compare with my logs?

Andreas


