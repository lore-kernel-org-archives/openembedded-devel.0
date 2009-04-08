Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrLix-00089A-Sq
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 02:33:37 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090408000130.FKPH4363.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Apr 2009 20:01:30 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id co1W1b0074dMFYL04o1Wzo; Tue, 07 Apr 2009 20:01:30 -0400
X-Authority-Analysis: v=1.0 c=1 a=ocDHq2oIfAIA:10 a=4ZlGlGpiBMgA:10
	a=0gcC27t9AAAA:8 a=4HVRqb_MAAAA:8 a=3VB4Cx7Gz1sXiaBWQvsA:9
	a=HHLoeLEsEhiwIQrRwpAA:7 a=_hQtfkW-uAUOer8FRQz6mqDq4zcA:4
	a=LY0hPdMaydYA:10 a=4KgpRpU3nOMA:10 a=k-kO48AawpMA:10
X-CM-Score: 0.00
Date: Tue, 7 Apr 2009 17:01:30 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090408000129.GL2195@smtp.west.cox.net>
References: <20090407222717.GK2195@smtp.west.cox.net>
	<1239146695-28599-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1239146695-28599-1-git-send-email-denis@denix.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.39
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] curl: move PACKAGES and FILES_* from the .inc file
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
X-List-Received-Date: Wed, 08 Apr 2009 00:33:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2009 at 07:24:55PM -0400, Denys Dmytriyenko wrote:

> this resolves the lockfile() trying to access the wrong directory
> when building sdk version after target one was built
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>

Thanks.

Acked-by: Tom Rini <trini@embeddedalley.com>

-- 
Tom Rini


