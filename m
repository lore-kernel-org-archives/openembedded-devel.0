Received: from [61.31.233.98] (helo=smtp.anet.net.tw)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LL0at-0005ej-1y
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jan 2009 20:31:03 +0100
Received: from capricorn.reonsoft.com (124-10-82-105.static.tfn.net.tw
	[124.10.82.105])
	by smtp.anet.net.tw (Postfix) with ESMTP id 69D4ED7C06;
	Fri,  9 Jan 2009 03:24:48 +0800 (CST)
Received: from john by capricorn.reonsoft.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>)
	id 1LL0Ut-0007FS-DB; Fri, 09 Jan 2009 03:24:51 +0800
Date: Fri, 9 Jan 2009 03:24:51 +0800
From: John Lee <john_lee@openmoko.org>
To: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Message-ID: <20090108192450.GA27680@capricorn.reonsoft.com>
Mail-Followup-To: Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openembedded-devel@lists.openembedded.org
References: <20090107081732.GA23843@buddha.tw.openmoko.com>
	<200901081959.52353.mickey@vanille-media.de>
MIME-Version: 1.0
In-Reply-To: <200901081959.52353.mickey@vanille-media.de>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 08 Jan 2009 19:31:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 08, 2009 at 07:59:52PM +0100, Michael 'Mickey' Lauer wrote:
> Am Wednesday 07 January 2009 09:17:35 schrieb John Lee:
> > The other one is john_lee/openmoko-merges, it's committed to oe.dev
> > already.
> 
> Not according to my info. Please doublecheck.

I rebased first then commit, so there's no merge.  The first one is

http://git.openembedded.net/?p=openembedded.git;a=commit;h=83dadf415efc7177b3e70c623ecf935c1e0a1dc1

for bigger merges I'll force (git merge --no-ff) a merge commit so it
could be reverted if necessary.


- John


