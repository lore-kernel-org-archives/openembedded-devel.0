Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LNWJi-0008Ip-Hz
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jan 2009 18:47:42 +0100
Received: from gandalf.denix.org ([71.255.246.155]) by vms173009.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KDI00K1JW6J5Y90@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	15 Jan 2009 11:20:50 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B60836B83B5; Thu,
	15 Jan 2009 12:25:26 -0500 (EST)
Date: Thu, 15 Jan 2009 12:25:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <gkn9vn$mh4$1@ger.gmane.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090115172526.GD15943@denix.org>
MIME-version: 1.0
References: <gkn9vn$mh4$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [RFC] Overlay hosting and mirroring on git.oe.net
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
X-List-Received-Date: Thu, 15 Jan 2009 17:47:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 15, 2009 at 01:25:27PM +0100, Koen Kooi wrote:
> Hi,
>
> There are a lot of OE based projects around that use an overlay to manage 
> their tweaks (e.g. gumstix, openpandora, arago), which has pros and cons. A 
> while ago I was talking to John Willis (of open2x and openpandora fame) and 
> he liked the idea of mirroring the pandora overlay on git.oe.net to make it 
> more visible and to make it easier for OE developers to work on making 
> pieces of it upstream safe.
> I think a git mirror of poky would fall in this category as well.
>
> What do you think of this?

Will those be read-only mirrors or read-writeable branches/forks?

-- 
Denys


