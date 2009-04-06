Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LqgP9-0000qj-F2
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 06:25:54 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090406042301.ZWXC22254.fed1rmmtao106.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 6 Apr 2009 00:23:01 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id c4P01b00H4dMFYL034P0ty; Mon, 06 Apr 2009 00:23:01 -0400
X-Authority-Analysis: v=1.0 c=1 a=3SGHwq3LWSQA:10 a=OTfRANgV8fkA:10
	a=3Uw2J-4Qhd4nx_qCSLQA:9 a=LcshubguKskVslyLeU_3ICagtOgA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 5 Apr 2009 21:23:00 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090406042300.GS30840@smtp.west.cox.net>
References: <20090403221352.GH30840@smtp.west.cox.net>
	<20090403221721.GI30840@smtp.west.cox.net>
	<20090403221751.GJ30840@smtp.west.cox.net>
	<20090403221813.GK30840@smtp.west.cox.net>
	<20090404192517.GP30840@smtp.west.cox.net>
	<49D97EF8.4040905@dls.net>
MIME-Version: 1.0
In-Reply-To: <49D97EF8.4040905@dls.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.40
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_40,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Re: task-slugos-toolchain-target: Add	libstdc++-dev for C++ headers, bump PR
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
X-List-Received-Date: Mon, 06 Apr 2009 04:25:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 05, 2009 at 11:03:04PM -0500, Mike (mwester) wrote:
[snip]
> Thanks!
> 
> Per our discussion on IRC, I propose the following patch for this, which
> pulls in task-sdk-bare to address the problem you discovered above, as
> well as the other things you pointed out.
> 
> Do you want to commit the change, or should I?

Since this is independant of the main changes I posted (hit this do
compile tests for all SDKs), please go ahead and push your fix.  Thanks!

-- 
Tom Rini


