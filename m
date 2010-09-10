Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ou7yw-00025A-Hm
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 20:05:52 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L8J00CHUM816TK5@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	10 Sep 2010 13:04:55 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A619614AF64; Fri,
	10 Sep 2010 14:04:49 -0400 (EDT)
Date: Fri, 10 Sep 2010 14:04:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100910180449.GD28148@denix.org>
References: <1282924252-22046-1-git-send-email-chase.maupin@ti.com>
	<AANLkTik_1G5-zR7CXWnho4nfkFJAap4OkRp10iKphL2t@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310753C8F@dlee06.ent.ti.com>
MIME-version: 1.0
In-reply-to: <131E5DFBE7373E4C8D813795A6AA7F080310753C8F@dlee06.ent.ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] jpeg_8b: Allow using older versions of automake
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
X-List-Received-Date: Fri, 10 Sep 2010 18:05:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Aug 30, 2010 at 08:24:30AM -0500, Maupin, Chase wrote:
> Khem,
> 
> I'd be happy to make the patch but in this case the resulting differences in 
> configure appear to be just changes to line numbers in the script because my 
> patch caused a new comment line to be inserted.  I'm not sure if this patch 
> to configure would add anything but clutter.  However, if you still want it 
> I'll add it to the patch and resend.  The changes to configure would be (and 
> sorry for any outlook mangling):

Ping.

While the patch is not required, but it's nice to have. I'd vote to apply the 
original version w/o changes to configure script, but with change proposed by 
Enrico.

Acked-by: Denys Dmytriyenko <denis@denix.org>

-- 
Denys


