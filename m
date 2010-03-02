Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NmV4Y-0000tz-Lq
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 17:35:51 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYN00E30XXZHFA0@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	02 Mar 2010 10:32:28 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5FC5014AF60; Tue,
	02 Mar 2010 11:32:23 -0500 (EST)
Date: Tue, 02 Mar 2010 11:32:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <201003021250.41664.khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100302163223.GG15391@denix.org>
MIME-version: 1.0
References: <1267478308.4739.245.camel@trini-m4400>
	<201003021236.04862.khimov@altell.ru>
	<201003021042.51552.marcin@juszkiewicz.com.pl>
	<201003021250.41664.khimov@altell.ru>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Cleanup / update QEMU related checks
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
X-List-Received-Date: Tue, 02 Mar 2010 16:35:51 -0000
Content-type: text/plain; charset=koi8-r
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Tue, Mar 02, 2010 at 12:50:41PM +0300, Roman Khimov wrote:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=D4=CF=D2=CE=C9=CB 02 =
=CD=C1=D2=D4=C1 2010 12:42:50 =C1=D7=D4=CF=D2 Marcin Juszkiewicz=20
> =CE=C1=D0=C9=D3=C1=CC:
> > Dnia wtorek, 2 marca 2010 o 10:36:04 Roman Khimov napisa??(a):
> > > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=D4=CF=D2=CE=C9=CB 02=
 =CD=C1=D2=D4=C1 2010 00:18:28 =C1=D7=D4=CF=D2 Tom Rini =CE=C1=D0=
=C9=D3=C1=CC:
> > > > (aside: When can qemu-0.9.x die?).
> > >
> > > IMHO, it just about time to kill it, almost a year past since 0=
.10.x
> > > introduction and with all those changes 0.9.x is not working pr=
operly for
> > > locale generation anyway.
> >=20
> > I think that we need to upgrade to qemu 0.12.x and kill all previ=
ous
> >  versions.
>=20
> IMHO, adding 0.12.x, killing 0.9.x and leaving 0.10.x for some tran=
sition time=20
> is a bit better. If no one is in a hurry for that, I'll try to cook=
 up some=20
> patches this week.

Thanks a lot! As we've been talking about killing 0.9.x for some time=
 now w/o=20
much progress...

--=20
Denys



