Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NEut5-0005ml-MO for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 02:17:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NEurb-0001NJ-Q3
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 02:15:40 +0100
Received: from 68-25-27-139.pools.spcsdns.net ([68.25.27.139])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 02:15:39 +0100
Received: from jerm7861 by 68-25-27-139.pools.spcsdns.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 02:15:39 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Jeremy Williams <jerm7861@yahoo.com>
Date: Mon, 30 Nov 2009 01:15:13 +0000 (UTC)
Message-ID: <loom.20091130T021309-622@post.gmane.org>
References: <4A365C10.8020307@mta.it> <200906172309.40571.raj.khem@gmail.com>
	<4A3A5A84.6090602@mta.it> <200906261759.56663.raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 68.25.27.139 (Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.0.15) Gecko/2009101601 Firefox/3.0.15 (.NET CLR 3.5.30729))
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: nof/libgcc_s.so installed instead of libgcc_s.so on powerpc
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
X-List-Received-Date: Mon, 30 Nov 2009 01:17:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Khem Raj <raj.khem <at> gmail.com> writes:


> 
> Thanks. It might be problem in install section of our recipes.
> Can you post log.do_compile file 
> 
> Thx
> 
> -Khem

This is a bump. I am still seeing this issue. I'm assuming that the OP did not
provide a do_compile log which is why this thread died. I am willing to provide
the necessary information but I have noticed that the problem does not exist in
the image directory when the gcc-sdk package is created. Is this file perhaps
included from some other package that gets installed to the rootfs?

-jeremy





