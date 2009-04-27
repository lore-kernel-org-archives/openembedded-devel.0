Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LyWy6-0006Kt-Jx
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 21:58:22 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIR00BI4Z7VMX0O@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	27 Apr 2009 14:52:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C376E6B800D; Mon,
	27 Apr 2009 15:52:42 -0400 (EDT)
Date: Mon, 27 Apr 2009 15:52:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090427195242.GA13914@denix.org>
References: <c384c5ea0904271240p7450829fn26a7a7f6bf6752c3@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <c384c5ea0904271240p7450829fn26a7a7f6bf6752c3@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: TARGET_CC_ARCH += "${LDFLAGS}" ??
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
X-List-Received-Date: Mon, 27 Apr 2009 19:58:22 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 27, 2009 at 09:40:53PM +0200, Leon Woestenberg wrote:
> Hello,
> 
> I just came across this fix:
> 
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=413cc98aa563c9e6104d1104d5b24987ab9d12f8
> 
> which does:
> 
> +TARGET_CC_ARCH += "${LDFLAGS}"
> 
> to fix LDFLAGS QA(GNU-hash).
> 
> but doesn't this approach abuse TARGET_CC_ARCH?

http://thread.gmane.org/gmane.comp.handhelds.openembedded/22670/focus=22703

-- 
Denys


