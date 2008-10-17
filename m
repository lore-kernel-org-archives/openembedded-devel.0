Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KqthL-0007zi-Jz
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 20:05:15 +0200
Received: from andromeda.vanille.de (e180149157.adsl.alicedsl.de
	[85.180.149.157])
	by drlauer-research.com (Postfix) with ESMTP id 5E31A584C4E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2008 20:18:14 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Oct 2008 20:05:07 +0200
User-Agent: KMail/1.9.10
References: <1224184795.4235.133.camel@lenovo.internal.reciva.com>
	<200810171755.28288.mickey@vanille-media.de>
	<gdagrg$8l5$1@ger.gmane.org>
In-Reply-To: <gdagrg$8l5$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200810172005.08029.mickey@vanille-media.de>
Subject: Re: xserver-xorg rdepends
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
X-List-Received-Date: Fri, 17 Oct 2008 18:05:18 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Friday 17 October 2008 19:09:04 schrieb Koen Kooi:
> On 17-10-2008 17:55, Michael 'Mickey' Lauer wrote:
> > Phil wrote:
> >> Historically, the general policy for RDEPENDS has been that it should
> >> list only those packages which are absolutely required for the software
> >> in question to do anything useful.  For example, shared libraries
> >> without which you can't run the binary at all; interpreters without
> >> which you can't invoke the script; supporting datafiles without which
> >> the program will immediately crash, that kind of thing.  If the program
> >> can run and do at least something useful without a given package being
> >> installed, we have not usually considered it to be a hard dependency.
> >> These kinds of "soft dependencies" have traditionally been a matter of
> >> DISTRO and/or MACHINE policy, being handled either through task
> >> packages, PACKAGE_INSTALL, RRECOMMENDS, or some similar mechanism.
> >
> > I agree. Consider this a vote for turning this into a RRECOMMENDS or
> > dropping it completely.
>
> You're a bit behind the times :)

Heh, thanks for confirming, I've built up a massive backlog :)

-- 
:M:


