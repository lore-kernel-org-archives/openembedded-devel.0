Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NaG7i-000409-Tp
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 23:12:34 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KWX00KP2EVJOQO0@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	27 Jan 2010 16:09:32 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 890F614AF60; Wed,
	27 Jan 2010 17:09:19 -0500 (EST)
Date: Wed, 27 Jan 2010 17:09:19 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100127220919.GA30195@denix.org>
References: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100124070602.GA8642@denix.org> <hjh7f3$6v0$2@ger.gmane.org>
	<20100125015636.GA9855@denix.org> <hjjk5q$rmc$1@ger.gmane.org>
	<20100125084340.GA18489@denix.org>
	<20100125085246.GA2670@xora-build.xora.org.uk>
MIME-version: 1.0
In-reply-to: <20100125085246.GA2670@xora-build.xora.org.uk>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
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
X-List-Received-Date: Wed, 27 Jan 2010 22:12:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jan 25, 2010 at 08:52:46AM +0000, Graeme Gregory wrote:
> On Mon, Jan 25, 2010 at 03:43:40AM -0500, Denys Dmytriyenko wrote:
> > This way we won't get anywhere... :) I thought (maybe I'm wrong) everybody 
> > agrees at least with the fact that central checksums.ini is not the best 
> > approach. Keeping checksums in the metadata inside SRC_URI seemed like a 
> > viable solution. Are there any fundamental flaws with this method, besides 
> > lacking some tools?
> 
> I dont think there is any fundamental flaws, but there is still quite
> a lot of cleanup work. Patches like
> 
> http://www.xora.org.uk/cgi-bin/cgit.cgi/openembedded/commit/?h=xora/gnome-update&id=d2074190e711eb70a0bd26d2ac5b89b4988044b5
> 
> Will need to be applied in some places.

Hmm, I haven't noticed there were SRC_URIs in classes... On the other hand, 
the same needs to be done for .inc files.

BTW, I have applied the first patch - let me know when we are ready for the 
second part. :)

-- 
Denys


