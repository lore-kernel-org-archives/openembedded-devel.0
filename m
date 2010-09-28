Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1P0hXJ-0004Hf-6J
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 23:16:29 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 3CB4A27C030; Tue, 28 Sep 2010 23:16:12 +0200 (CEST)
Date: Tue, 28 Sep 2010 23:16:12 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100928211612.GX28423@ibawizard.net>
References: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>
	<4CA24AC6.9080502@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4CA24AC6.9080502@mentor.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] kernel NOTE messages fix
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
X-List-Received-Date: Tue, 28 Sep 2010 21:16:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Tom Rini <tom_rini@mentor.com> [2010-09-28 13:06:30]:

[snip]

> Did you try implementing this?  Without a few other changes (that I  
> couldn't get 100% right) there's problems with the scripts/ and  
> arch/$ARCH/boot/ tools being the wrong binary format.

Yes, we've tried it as first step with wooglinde, but ended on the same errors
you're experiencing.

-- ynezz


