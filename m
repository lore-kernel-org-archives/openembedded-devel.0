Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LL0pv-00065O-6J
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jan 2009 20:46:35 +0100
Received: from andromeda.vanille.de (e180142009.adsl.alicedsl.de
	[85.180.142.9])
	by drlauer-research.com (Postfix) with ESMTP id 610435846FA;
	Thu,  8 Jan 2009 21:00:29 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Thu, 8 Jan 2009 20:40:23 +0100
User-Agent: KMail/1.9.10
References: <20090107081732.GA23843@buddha.tw.openmoko.com>
	<200901081959.52353.mickey@vanille-media.de>
	<20090108192450.GA27680@capricorn.reonsoft.com>
In-Reply-To: <20090108192450.GA27680@capricorn.reonsoft.com>
MIME-Version: 1.0
Message-Id: <200901082040.24105.mickey@vanille-media.de>
Subject: Re: please kill 2 branches...
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
X-List-Received-Date: Thu, 08 Jan 2009 19:46:35 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Thursday 08 January 2009 20:24:51 schrieb John Lee:
> On Thu, Jan 08, 2009 at 07:59:52PM +0100, Michael 'Mickey' Lauer wrote:
> > Am Wednesday 07 January 2009 09:17:35 schrieb John Lee:
> > > The other one is john_lee/openmoko-merges, it's committed to oe.dev
> > > already.
> >
> > Not according to my info. Please doublecheck.
>
> I rebased first then commit, so there's no merge.  The first one is
>
> http://git.openembedded.net/?p=openembedded.git;a=commit;h=83dadf415efc7177
>b3e70c623ecf935c1e0a1dc1
>
> for bigger merges I'll force (git merge --no-ff) a merge commit so it
> could be reverted if necessary.

Ok, thanks for confirming. (git branch -d warned me, so I wanted to check 
back). Deleting it now.

Cheers,

:M:


