Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OqE4y-0005A7-7T
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 01:47:57 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OqE4Q-0006fN-AE from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 16:47:22 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 30 Aug 2010 16:47:22 -0700
Received: from [172.30.80.207] ([172.30.80.207]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 30 Aug 2010 17:47:20 -0600
Message-ID: <4C7C4306.9020902@mentor.com>
Date: Mon, 30 Aug 2010 16:47:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>	<1283027073-12308-6-git-send-email-raj.khem@gmail.com>	<i5dap0$v2$2@dough.gmane.org>	<AANLkTimnfsHbd0sWxGLBfawD9w5M4OLGWbH_gN6_9T-h@mail.gmail.com>
	<20100830220042.GC14561@denix.org>
In-Reply-To: <20100830220042.GC14561@denix.org>
X-OriginalArrivalTime: 30 Aug 2010 23:47:20.0673 (UTC)
	FILETIME=[AFCD6510:01CB489D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 05/23] meta-toolchain-arago-dvsdk.bb: Exclude	from world build.
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
X-List-Received-Date: Mon, 30 Aug 2010 23:47:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
[snip]
> meta-toolchain-arago-dvsdk (and corresponding ti-<blah>-sdk.bb recipes) were 
> used by legacy dvsdk builds early on and never got merged into OE. Moreover, 
> the legacy dvsdk support was deprecated even in the mainline Arago...
> As we don't have necessary ti-<blah>-sdk.bb recipes, this meta recipe can 
> safely be excluded from world or even removed completely.

This sounds like you're an authority here.  Perhaps the best answer is 
for you to go and git rm and push the stuff that doesn't make sense 
anymore?  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


