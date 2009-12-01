Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NFZYh-0002c5-7Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 21:42:54 +0100
Received: from gandalf.denix.org ([71.255.235.232]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KTZ00HE4NZDKH8O@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	01 Dec 2009 13:40:37 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 50AF114AF60; Tue,
	01 Dec 2009 14:40:25 -0500 (EST)
Date: Tue, 01 Dec 2009 14:40:25 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091201194025.GB11505@denix.org>
References: <4B14BAD9.2060402@fqingenieria.es>
	<20091201072521.GA11505@denix.org> <4B14D2E1.6050506@SSpaeth.de>
MIME-version: 1.0
In-reply-to: <4B14D2E1.6050506@SSpaeth.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Recipes relation tree
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
X-List-Received-Date: Tue, 01 Dec 2009 20:42:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Dec 01, 2009 at 09:25:05AM +0100, Sebastian Spaeth wrote:
> Denys Dmytriyenko wrote:
> > Have you looked at -g option of bitbake?
> > 
> >   -g, --graphviz        emit the dependency trees of the specified packages in
> >                         the dot syntax
> 
> A related question. This generates depends.dot just fine, but I found a
> reference to rdepends.dot in some manual. I would be very much
> interested in an RDEPENDS tree, is there a way to get this?

Actually it does generate both.

-- 
Denys


