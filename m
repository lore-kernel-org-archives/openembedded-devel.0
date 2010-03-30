Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NwRy6-0002Wq-Q7
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 05:18:19 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L02006GAROOV1C2@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	29 Mar 2010 22:14:53 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C8EBD14AF60; Mon,
	29 Mar 2010 23:14:47 -0400 (EDT)
Date: Mon, 29 Mar 2010 23:14:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100330031447.GC4123@denix.org>
References: <1269899607-30980-1-git-send-email-mok@mnet-online.de>
	<4BB1257C.9050606@balister.org>
MIME-version: 1.0
In-reply-to: <4BB1257C.9050606@balister.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] pkgconfig.inc: add missing ${D} when creating	${libdir}/pkgconfig in do_install_append
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
X-List-Received-Date: Tue, 30 Mar 2010 03:18:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 29, 2010 at 06:11:08PM -0400, Philip Balister wrote:
> On 03/29/2010 05:53 PM, mok@mnet-online.de wrote:
>> From: Klaus Kurzmann<mok@fluxnetz.de>
>>
>> Signed-off-by: Klaus Kurzmann<mok@fluxnetz.de>
>
> Thanks. I just hit the same problem. I'll push as soon as my build 
> finished.

Same here. Thanks for fixing it.

-- 
Denys


