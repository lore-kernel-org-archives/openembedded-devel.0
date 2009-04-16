Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LuXc1-00084I-PH
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 21:51:10 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090416194709.KKII16134.fed1rmmtao104.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 15:47:09 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id gKn71b00P4dMFYL03Kn8vX; Thu, 16 Apr 2009 15:47:08 -0400
X-Authority-Analysis: v=1.0 c=1 a=0F8IrYsiqkQA:10 a=lq8wqtCCg6QA:10
	a=J0Tn2xNtAAAA:8 a=tnsjkNfMAAAA:8 a=d3wyLJHGPQ4IecE4gGEA:9
	a=rq8hfP8KkyTh1_rFOXRWctAm_uIA:4
X-CM-Score: 0.00
Date: Thu, 16 Apr 2009 12:47:07 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090416194707.GK17629@smtp.west.cox.net>
References: <20090402005356.GN14278@smtp.west.cox.net>
	<200904071021.20322.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <200904071021.20322.marcin@juszkiewicz.com.pl>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.42
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox 1.13.2: Add more upstream patches, bump PR
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
X-List-Received-Date: Thu, 16 Apr 2009 19:51:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2009 at 10:21:19AM +0200, Marcin Juszkiewicz wrote:
> Dnia czwartek, 2 kwietnia 2009 o 02:53:56 Tom Rini napisa??(a):
> > This adds the awk, killall, printf, syslogd, top24, unzip and wget
> > patches from http://busybox.net/downloads/fixes-1.13.2/
> 
> Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> 
> I will also Ack it for stable/2009 branch.

Looking for 1 more ack.  The awk patch is needed to fix problems that
are seen on MIPS/FPU systems (for example, malta).

-- 
Tom Rini


