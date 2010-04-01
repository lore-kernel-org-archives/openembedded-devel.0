Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NxSu1-0003Ya-Ac
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 00:30:18 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NxSqp-0006hE-HU from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 15:26:59 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 1 Apr 2010 15:26:58 -0700
Received: from 172.30.80.170 ([172.30.80.170]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu,  1 Apr 2010 22:26:05 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Apr 2010 15:26:03 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270154092.6277.132.camel@trini-m4400>
References: <1270135981.4993.128.camel@rex> <hp2mls$3go$1@dough.gmane.org>
	<y2wb6ebd0a51004011303p88039e2bj34a31dd88b2e0ac3@mail.gmail.com>
	<1270154092.6277.132.camel@trini-m4400>
Organization: Mentor Graphics Corporation
Date: Thu, 01 Apr 2010 15:26:02 -0700
Message-ID: <1270160762.6277.145.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 Apr 2010 22:26:58.0852 (UTC)
	FILETIME=[7165A640:01CAD1EA]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Thu, 01 Apr 2010 22:30:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-04-01 at 13:34 -0700, Tom Rini wrote:
> On Thu, 2010-04-01 at 13:03 -0700, Chris Larson wrote:
> > On Thu, Apr 1, 2010 at 10:55 AM, Koen Kooi <k.kooi@student.utwente.nl>w=
rote:
> >=20
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >
> > > On 01-04-10 17:33, Richard Purdie wrote:
> > >
> > > > I could post the patches individually and get Acked lines for each =
one
> > > > but I'm hoping to avoid that and get permission to merge the branch
> > > > directly. We have talked about most of these things in one form or
> > > > another.
> > >
> > > I don't think this will get serious review people other than Tom, Khe=
m
> > > and Chris, so if they don't have huge objections, merge it and we'll
> > > deal with the fallout together if needed.
> >=20
> >=20
> > I agree with Koen on this, it's a definite improvement. Let's get it me=
rged
> > and deal with any fallout from there.
>=20
> Generally yes, and just a few things to hash out over the weekend I
> think.

With my non-blocking questions now, I think I'm good enough with this to
go in Monday.  I'll see about following up, after, with an alternative
way of relocation.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


