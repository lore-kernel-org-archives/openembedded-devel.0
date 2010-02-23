Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NjyvG-0007yd-NY
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 18:51:53 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NjysZ-0007AC-Jl from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 09:49:03 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 23 Feb 2010 09:49:03 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 23 Feb 2010 17:49:02 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Feb 2010 10:49:02 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f96d234e1002230903j24d67bcauca7714045a8d7c77@mail.gmail.com>
References: <f96d234e1002091310h6eb4f93ei67068714adadd017@mail.gmail.com>
	<201002102228.49805.holger+oe@freyther.de>
	<f96d234e1002230903j24d67bcauca7714045a8d7c77@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Tue, 23 Feb 2010 10:49:02 -0700
Message-ID: <1266947342.18176.32.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 23 Feb 2010 17:49:03.0127 (UTC)
	FILETIME=[7C9B3270:01CAB4B0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OE weekly changelog 2010-02-01 to 2010-02-08
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
X-List-Received-Date: Tue, 23 Feb 2010 17:51:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-02-23 at 12:03 -0500, Cliff Brake wrote:
> On Wed, Feb 10, 2010 at 4:28 PM, Holger Hans Peter Freyther
> <holger+oe@freyther.de> wrote:
> > On Tuesday 09 February 2010 22:10:40 Cliff Brake wrote:
> >> OE weekly changelog 2010-02-01 to 2010-02-08
> >
> > Hi Cliff,
> >
> > do you think having the output of `git shortlog holger/staging-branch` =
in the
> > weekly changelog would be a nice addition?
>=20
> Added to the script, thanks.

I kinda meant to say this earlier, and not to pick on holger, really,
but how about we make the script take a few params and let everyone /
anyone cron what they like (going where appropriate) so the shr folks
can log their branches and so on.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


