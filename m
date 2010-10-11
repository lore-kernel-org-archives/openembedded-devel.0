Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1P5Clr-0006vw-I8
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 09:26:07 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id DD88A1D36170; Mon, 11 Oct 2010 09:25:40 +0200 (CEST)
Date: Mon, 11 Oct 2010 09:25:40 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101011072540.GR28423@ibawizard.net>
References: <4CB2ADA2.7080600@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4CB2ADA2.7080600@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] lua, lua-gtk2: move to obsolete.
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
X-List-Received-Date: Mon, 11 Oct 2010 07:26:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Graham Gower <graham.gower@gmail.com> [2010-10-11 16:54:34]:

> Lua fails to build. There are newer recipes (lua5.1) in tree, only
> lua-gtk2 uses this old recipe and nothing uses lua-gtk2.

I can't give you the ACK, but I totaly agree. Was thinking about the same like
week ago, but forget to send a patch :-)

-- ynezz


