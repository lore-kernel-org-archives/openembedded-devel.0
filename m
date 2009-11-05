Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N5v1V-0000rS-Bx
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 06:36:44 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSM000BGFIBDIZI@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	04 Nov 2009 23:34:59 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1673A14AF60; Thu,
	05 Nov 2009 00:34:59 -0500 (EST)
Date: Thu, 05 Nov 2009 00:34:59 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091105053459.GC30116@denix.org>
References: <alpine.LFD.2.00.0911050014240.6944@localhost>
MIME-version: 1.0
In-reply-to: <alpine.LFD.2.00.0911050014240.6944@localhost>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: where is the canonical OE web site these days?
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
X-List-Received-Date: Thu, 05 Nov 2009 05:36:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Nov 05, 2009 at 12:15:09AM -0500, Robert P. J. Day wrote:
> 
>   if one goes to openembedded.org these days, one gets to
> linuxtogo.org.  but there's also the site openembedded.net, which
> takes you to a fairly useful wiki (even if some of the info seems a
> bit out of date).  and the linuxtogo wiki definitely doesn't take one
> over to the openembedded.net wiki.
> 
>   so where's the official portal these days?

Try http://www.openembedded.org or http://wiki.openembedded.org. I believe 
there is a misconfiguration (in DNS?) where openembedded.org points to the IP 
address of linuxtogo.org, hence opening http://openembedded.org opens 
http://linuxtogo.org
Not sure if there was a reason for that, as linuxtogo.org handles the mailing 
list, but that would require an MX record, not IN...

openembedded.net is an older and different zone, which has no such issue. 
AFAIK, there is a move to deprecate openembedded.net in favor of 
openembedded.org...

Current infrastructure is documented here:
http://wiki.openembedded.net/index.php/Infrastructure

-- 
Denys


