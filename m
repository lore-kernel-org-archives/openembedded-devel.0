Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1GbpJB-0008Tv-4C
	for openembedded-devel@openembedded.org; Mon, 23 Oct 2006 04:12:57 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1GbpBy-000282-LG
	for openembedded-devel@openembedded.org; Mon, 23 Oct 2006 04:05:30 +0200
Received: from cm30.sigma248.maxonline.com.sg ([218.212.248.30])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 23 Oct 2006 04:05:30 +0200
Received: from robk by cm30.sigma248.maxonline.com.sg with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 23 Oct 2006 04:05:30 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Mon, 23 Oct 2006 10:07:49 +0800
Message-ID: <ehh80o$7dl$1@sea.gmane.org>
References: <eh4jbk$29v$1@sea.gmane.org> <eh4kc9$63q$1@sea.gmane.org>
	<1161432655.6643.2.camel@localhost.localdomain>
	<ehemhq$f0s$1@sea.gmane.org>
	<1161538860.5545.7.camel@localhost.localdomain>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: cm30.sigma248.maxonline.com.sg
User-Agent: KNode/0.10.2
Sender: news <news@sea.gmane.org>
Subject: Re: Bitbake-1.6 crashes on 'which'.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Oct 2006 02:12:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Richard Purdie wrote:
> I can't seem to reproduce that. Can you give a sequence of commands
> which result in the failure?

Hmm, it seems to happen rare enough not to be a problem. I was trying to get
a new version of a package visible to a running bitbake by doing reparses,
but I think that doesn't work (i.e, it doesn't want to switch to the newest
version). After it crashed out and was restarted, it selected my new
version properly.

Cheers,

    Rob



