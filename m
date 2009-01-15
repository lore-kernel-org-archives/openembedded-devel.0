Received: from [206.46.252.42] (helo=vms042pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LNUCs-0002UK-WC
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jan 2009 16:32:31 +0100
Received: from gandalf.denix.org ([71.255.246.155])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0KDI0049OQTOQ7P0@vms042.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	15 Jan 2009 09:25:00 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C8E9C6B83B5; Thu,
	15 Jan 2009 10:24:59 -0500 (EST)
Date: Thu, 15 Jan 2009 10:24:59 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <07FF17F1860B45E8953571020236997C@distantearth.home>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090115152459.GA15943@denix.org>
MIME-version: 1.0
References: <gkn9vn$mh4$1@ger.gmane.org>
	<07FF17F1860B45E8953571020236997C@distantearth.home>
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
X-List-Received-Date: Thu, 15 Jan 2009 15:32:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 15, 2009 at 02:45:23PM -0000, John Willis wrote:
> Hi,
> 
> > There are a lot of OE based projects around that use an overlay to
> > manage their tweaks (e.g. gumstix, openpandora, arago), which has pros
> > and cons. A while ago I was talking to John Willis (of open2x and
> > openpandora fame) and he liked the idea of mirroring the pandora overlay
> > on git.oe.net to make it more visible and to make it easier for OE
> > developers to work on making pieces of it upstream safe.
> > I think a git mirror of poky would fall in this category as well.
> 
> Get's my vote. As I mentioned on IRC the current OpenPandora model uses 3
> overlays. With the 3rd one being a simple user.collection that local Pandora
> specific recipes go into before working there way upwards.

From Arago perspective I'm in favor of this proposal as well. Thanks.

-- 
Denys


