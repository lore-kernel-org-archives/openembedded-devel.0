Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NFa2C-0004IV-GA for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 22:13:23 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NFa0g-00049P-6w
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 22:11:46 +0100
Received: from 167.225.107.17 ([167.225.107.17])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 22:11:46 +0100
Received: from jerm7861 by 167.225.107.17 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 22:11:46 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Jeremy Williams <jerm7861@yahoo.com>
Date: Tue, 1 Dec 2009 21:11:22 +0000 (UTC)
Message-ID: <loom.20091201T221001-531@post.gmane.org>
References: <loom.20091201T214744-304@post.gmane.org>
	<hf3vuv$db3$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 167.225.107.17 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.5) Gecko/20091105 Fedora/3.5.5-1.fc11 Firefox/3.5.5)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: opkg-sdk svn r420 build failure
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
X-List-Received-Date: Tue, 01 Dec 2009 21:13:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi <k.kooi <at> student.utwente.nl> writes:
> 
> Could try bumping it to r413? That should have a fix for the TRUE/FALSE 
> issue. Next time I'll check opkg-sdk as well when bumping SRCREV.
> 

Thanks Koen, r413 is the permanent fix. 

I should have checked the opkg repo first!

-jeremy



