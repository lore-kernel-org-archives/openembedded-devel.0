Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O80LU-0005dn-TD
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 May 2010 02:14:14 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O80Hs-0001XN-LJ from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 17:10:28 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 30 Apr 2010 17:10:28 -0700
Received: from 172.30.80.14 ([172.30.80.14]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Sat,  1 May 2010 00:10:27 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	30 Apr 2010 17:10:17 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1272552574.3865.814.camel@trini-m4400>
References: <hrbmd4$mng$1@dough.gmane.org>
	<1272552574.3865.814.camel@trini-m4400>
Organization: Mentor Graphics Corporation
Date: Fri, 30 Apr 2010 17:10:14 -0700
Message-ID: <1272672614.21120.100.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 May 2010 00:10:28.0329 (UTC)
	FILETIME=[B4836590:01CAE8C2]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Merging RPs branch, help needed for dealing with possible fall-out
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
X-List-Received-Date: Sat, 01 May 2010 00:14:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-04-29 at 07:49 -0700, Tom Rini wrote:=20
> On Thu, 2010-04-29 at 12:18 +0200, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >=20
> > Hi,
> >=20
> > I've been talking to RP and we both like to merge his branch as soon as
> > the last problem (the cross lamanger) has been addressed. RP estimates
> > that will happen early next week.
> > But after it has been merged there might be some fallout, which we woul=
d
> > like to have some help with. If you don't want to help out and and don'=
t
> > want the possible breakage: don't git pull for the time being.
>=20
> Related, do we have people signing up for building ___ targets?  I'll
> assume angstrom + beagleboard + beagleboard-demo will be covered :)

OK, now that I've found a building set, I'll make sure minimal +
{qemux86, qemumips, qemuarm, db1200, calamari, mpc8313e-rdb} +
minimal-image and minimal + {qemux86, qemumips, qemuarm} + x11-image
build, and if the qemu targets end up being easy enough to fire up and
boot, I'll do that too.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation



