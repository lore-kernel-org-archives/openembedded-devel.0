Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NYwaa-0008Tw-6o
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 08:08:55 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KWQ0003NP22IQV3@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 Jan 2010 01:06:15 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3828B14AF60; Sun,
	24 Jan 2010 02:06:02 -0500 (EST)
Date: Sun, 24 Jan 2010 02:06:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100124070602.GA8642@denix.org>
References: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-version: 1.0
In-reply-to: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Official policy to list checksums
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
X-List-Received-Date: Sun, 24 Jan 2010 07:08:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Jan 23, 2010 at 09:06:13PM +0100, Paul Menzel wrote:
> does [1] still describe the official policy to add checksums? Or is

No

> putting them into the recipes preferred nowadays?

Yes

> For example
> 
>         SRC_URI[whois.md5sum] = "18d74a07d711262b75f04a1c319bc833"
>         SRC_URI[whois.sha256sum] = "fb13316c09ff9f98bd9af659d0789c9a09b97757f5c6c3dbfbc790250d5c5abc"

Please read "Death by checksums" thread here:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/27465

-- 
Denys


