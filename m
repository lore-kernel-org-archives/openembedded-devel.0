Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JULcH-0001Kt-Nm
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2008 13:42:35 +0100
Received: from andromeda (e180175164.adsl.alicedsl.de [85.180.175.164])
	by drlauer-research.com (Postfix) with ESMTP id 38B3E584C77
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2008 13:48:02 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Feb 2008 13:42:12 +0100
User-Agent: KMail/1.9.9
References: <1203793457.8255.5.camel@dax.rpnet.com>
	<200802232241.01317.openembedded@haerwu.biz>
	<20080224000031.363e2031@widy.localdomain>
In-Reply-To: <20080224000031.363e2031@widy.localdomain>
MIME-Version: 1.0
Message-Id: <200802271342.12423.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Uppercase overrides and parsing speed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2008 12:42:35 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 23 February 2008 23:00:31 Paul Sokolovsky wrote:
> Hello,
>
> On Sat, 23 Feb 2008 22:40:59 +0100
>
> Marcin Juszkiewicz <openembedded@haerwu.biz> wrote:
> > Dnia Saturday, 23 of February 2008, Paul Sokolovsky napisa=C5=82:
> > > Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> > > > Didn't we also agree that variable names shouldn't include '_' at
> > > > all?
> > >
> > > How is that achievable? LETSUSEITLIKETHIS? Maybe exclude 'A'
> > > too? ;-)
> >
> > LETS-USE-IT-LIKE-THIS was one of suggestions.
>
> And still, rethinking the override marker is another choice, with a dot
> being obvious candidate.

Agreed. I like that idea. Richard, is there an obvious reason why we didn't=
=20
consider this instead?

=2D-=20
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


