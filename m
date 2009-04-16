Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LuZqX-0005Ly-Rp
	for openembedded-devel@openembedded.org; Fri, 17 Apr 2009 00:14:18 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090416221015.TBIO27308.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 18:10:15 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id gNAF1b00C4dMFYL04NAFyL; Thu, 16 Apr 2009 18:10:15 -0400
X-Authority-Analysis: v=1.0 c=1 a=C1szGUHcE44A:10 a=PGPu3ob2VHUA:10
	a=pH0z2AzLDBw6gkfL90sA:9 a=exgkHinxXVp4AV1WsyQKvuSJfL0A:4
X-CM-Score: 0.00
Date: Thu, 16 Apr 2009 15:10:15 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090416221015.GP17629@smtp.west.cox.net>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
	<1239798960-3586-3-git-send-email-khimov@altell.ru>
	<1239798960-3586-4-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1239798960-3586-4-git-send-email-khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.45
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 04/11] gcc 4.2.4: add gcc-multilib64dir.patch
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
X-List-Received-Date: Thu, 16 Apr 2009 22:14:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2009 at 04:35:53PM +0400, Roman I Khimov wrote:

> ---
>  recipes/gcc/files/gcc-multilib64dir.patch |   43 +++++++++++++++++++++++++++++
>  recipes/gcc/gcc-4.2.4.inc                 |    1 +
>  2 files changed, 44 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/gcc/files/gcc-multilib64dir.patch

Does this apply as-is to 4.1 and 4.3 too?  If not, lets name it
gcc-4.2.x-multilib64dir.patch.

-- 
Tom Rini


