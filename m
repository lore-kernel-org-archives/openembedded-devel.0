Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ou9ju-0007tf-8j
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 21:58:27 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L8J00AGOONB1FB3@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	10 Sep 2010 13:57:17 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A136314AF60; Fri,
	10 Sep 2010 14:57:11 -0400 (EDT)
Date: Fri, 10 Sep 2010 14:57:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <AANLkTik599XZfY1Abq+gdDqGSOOLnqHUiqL1VVK9Rh87@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100910185711.GG28148@denix.org>
MIME-version: 1.0
References: <20100903111210.GA17702@game.jcrosoft.org>
	<1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
	<AANLkTim57opnM=fn47pQ-GeNsNbSyydHd3TKSWhdD5z5@mail.gmail.com>
	<AANLkTikyFRQskds_P9AH+=_km46KEf1cPm-Vq1+MhdhC@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFA4A2@dlee06.ent.ti.com>
	<AANLkTik599XZfY1Abq+gdDqGSOOLnqHUiqL1VVK9Rh87@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make	it global
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
X-List-Received-Date: Fri, 10 Sep 2010 19:58:27 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Wed, Sep 08, 2010 at 07:58:39AM +0200, Frans Meulenbroeks wrote:
> 2010/9/7 Maupin, Chase <chase.maupin@ti.com>:
>=20
> >> Forgot about this, but a variable should go with documentation.
> >> This already has been raised with the orginal patch, but was ign=
ored
> >> by the submitters.
> >
> > Frans, Are you counting me as one of the original submitters? =
=A0I mainly=20
> > use the SOC_FAMILY, I didn't create it. =A0That being said, if yo=
u have a=20
> > recommended section of the usermanual that this should be documen=
ted in=20
> > I'll try to add something.
>=20
> Hi Chase,
> I see you indeed as the submitter. The commit carries your name and
> there is no reference in the commit message of another author.
>=20
> Wrt the manual: actually I thought we had a section for this, but a=
s
> it stands i cannot find it. Guess I saw it somewhere else.
> I'm not really sure where it would fit. I guess there are others wh=
o
> have a better view on the manual and its structure.

Frans,

I guess then you haven't read the original discussion closely enough.=
 Chase=20
only made a change to add existing SOC_FAMILY override into COMPATIBL=
E_MACHINE=20
variable... I keep repeating myself - SOC_FAMILY feature is about a y=
ear old.=20
It was introduced as part of a large merge from Arago. Here is the or=
iginal=20
commit and some description:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Db7884=
99815bfc1974d4277c0a261b9a7c24aa816

--=20
Denys



