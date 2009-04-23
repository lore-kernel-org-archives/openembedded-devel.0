Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lx34s-0000Cp-TI
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 19:51:15 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090423174635.MIBI6112.fed1rmmtao102.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 13:46:35 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id j5mZ1b00C4dMFYL045mZH5; Thu, 23 Apr 2009 13:46:33 -0400
X-Authority-Analysis: v=1.0 c=1 a=MiFO6lDL9BEA:10 a=uwmVMmDI0mQA:10
	a=4HVRqb_MAAAA:8 a=EOo-vP1g58EnqKfw198A:9
	a=KccetLQxkVsxnjMFhb72Thwkwu8A:4 a=k-kO48AawpMA:10
X-CM-Score: 0.00
Date: Thu, 23 Apr 2009 10:46:33 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090423174633.GD12956@smtp.west.cox.net>
References: <1240504230-9936-1-git-send-email-marcin@juszkiewicz.com.pl>
	<gsq885$h7s$1@ger.gmane.org>
	<20090423173155.GB12956@smtp.west.cox.net>
	<200904231937.24327.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <200904231937.24327.marcin@juszkiewicz.com.pl>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [STABLE][PATCH 1/1] task-base: added btusb driver to	list?of recommended BT drivers
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
X-List-Received-Date: Thu, 23 Apr 2009 17:51:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2009 at 07:37:18PM +0200, Marcin Juszkiewicz wrote:
> Dnia czwartek, 23 kwietnia 2009 o 19:31:55 Tom Rini napisa??(a):
> > >> +++ b/recipes/tasks/task-base.bb
> > >> @@ -1,5 +1,5 @@
> > >>   DESCRIPTION = "Merge machine and distro options to create a
> > >> basic machine task/package" -PR = "r80"
> > >> +PR = "r83"
> >
> > So it's OK to just jump PRs like this?  I assume in .dev there's 3
> > changes made to task-base from 80 to 83, including this change.
> 
> Dev tree has r80 -> r82 jump when Raster introduced big change on how 
> splash tools work. This is not a change which was suggested for stable 
> (as it is big and not wide tested). And r83 task-base in stable/2009 
> will be same as r83 task-base from .dev after that patch.

OK.

Acked-by: Tom Rini <trini@embeddedalley.com>

-- 
Tom Rini


