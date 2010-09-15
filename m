Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1OvxYx-0000vs-OU
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 21:22:52 +0200
Received: from home.lan (unknown [81.57.214.146])
	by smtp5-g21.free.fr (Postfix) with ESMTP id E63FED48148;
	Wed, 15 Sep 2010 21:21:43 +0200 (CEST)
Received: from yann by home.lan with local (Exim 4.72)
	(envelope-from <ydirson@free.fr>)
	id 1Ovxg2-00029d-2s; Wed, 15 Sep 2010 21:29:54 +0200
Date: Wed, 15 Sep 2010 21:29:54 +0200
From: Yann Dirson <ydirson@free.fr>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20100915192954.GK4983@home.lan>
References: <1284494173-30471-1-git-send-email-ydirson@altern.org>
	<AANLkTi=dPVmm5iB8mzpTvYSv17uiHcM5rx8z7LX02Z2C@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=dPVmm5iB8mzpTvYSv17uiHcM5rx8z7LX02Z2C@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: ydirson@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] gnugo_3.8: initial packaging.
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
X-List-Received-Date: Wed, 15 Sep 2010 19:22:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 15, 2010 at 11:07:29AM -0700, Khem Raj wrote:
> > +
> > +S = "${WORKDIR}/gnugo-${PV}"
> 
> you might not need to set S here

Right - probably at some point an error somewhere else made that
necessary, but I can't remember the context - that was 1 month ago
before leaving on holiday :)

> > +PR = "r1"
> > +
> 
> PR starts with r0 for initial recipes

Is there some useful convention that can be used locally when
developping, that would sort lower than r0 ?  I used r0.X fo my dev
build attempts, so it would seem r0 would prevent automatic upgrades ?

Best regards,
-- 
Yann


