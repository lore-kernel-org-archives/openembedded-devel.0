Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KvAC8-0001m9-4v
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 13:30:40 +0100
Received: from andromeda.vanille.de (e180189017.adsl.alicedsl.de
	[85.180.189.17])
	by drlauer-research.com (Postfix) with ESMTP id 24A4E584C7E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2008 13:43:45 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Oct 2008 13:29:41 +0100
User-Agent: KMail/1.9.10
References: <1225195813.9866.33.camel@mill.internal.reciva.com>
	<87skqgq1xf.fsf@neumann.lab.ossystems.com.br>
	<1225208144.9866.44.camel@mill.internal.reciva.com>
In-Reply-To: <1225208144.9866.44.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200810291329.41929.mickey@vanille-media.de>
Subject: Re: [oe-commits] Otavio Salvador : xorg-xserver-common.inc: set	userid to allow Xorg to be run by users
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
X-List-Received-Date: Wed, 29 Oct 2008 12:30:40 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Tuesday 28 October 2008 16:35:43 schrieb Phil Blundell:
> On Tue, 2008-10-28 at 11:33 -0200, Otavio Salvador wrote:
> > I somewhat understand your complains. Debian usea a wrapper for that
> > propouse. I like this idea and I believe it might be a way to go.
> >
> > http://git.debian.org/?p=pkg-xorg/debian/xorg.git;a=blob;f=debian/local/x
> >server-wrapper.c;hb=HEAD
> >
> > What do you think about it?
>
> Yes, this sounds like the right solution to that problem.  However, I
> think even this ought to be a DISTRO opt-in rather than the default,
> since for many people it will probably be unnecessary.

I agree. I'd rather have it opt-in as well.

-- 
:M:


