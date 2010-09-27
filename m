Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P0IQu-0003vp-La
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 20:28:13 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9F00LKS4M3ZLI3@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	27 Sep 2010 13:27:40 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 06D7A14AF64; Mon,
	27 Sep 2010 14:27:39 -0400 (EDT)
Date: Mon, 27 Sep 2010 14:27:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100927182738.GA12985@denix.org>
References: <AANLkTimJj=8JDVsumZDSzNrpWcf6t1t4FA5WrGgWofDX@mail.gmail.com>
	<20100921195156.GF11562@denix.org>
	<AANLkTinxRAz245hPk4tGx_Q51+kN440pUFpBTYZC53jG@mail.gmail.com>
	<AANLkTinkXLi3_nwbT02XOyjZ=N2xEGhS7wbQJgc7NPGW@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTinkXLi3_nwbT02XOyjZ=N2xEGhS7wbQJgc7NPGW@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SRC_URI_arch override. error?
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
X-List-Received-Date: Mon, 27 Sep 2010 18:28:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 21, 2010 at 10:47:43PM +0200, Frans Meulenbroeks wrote:
> Denys, I still have the issue.
> As explained in the original thread the problem is the bb.fetch.init call.
> 
> Chris, appreciate it if you could look into it.
> Don't have time to test a change right away though as I will be afk
> for the next few days.

Frans, Chris,

Please take a look at the patch I just sent to fix this:

http://thread.gmane.org/gmane.comp.handhelds.openembedded/37448

-- 
Denys


