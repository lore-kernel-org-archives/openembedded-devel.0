Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NeVlk-0001eT-SO
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 16:43:27 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 626CC1D360E2; Mon,  8 Feb 2010 16:40:50 +0100 (CET)
Date: Mon, 8 Feb 2010 16:40:50 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100208154050.GZ24852@ibawizard.net>
References: <4B701EA0.5090304@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4B701EA0.5090304@dresearch.de>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: configure failes for mc-4.6.2-r4
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
X-List-Received-Date: Mon, 08 Feb 2010 15:43:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Steffen Sledz <sledz@dresearch.de> [2010-02-08 15:24:32]:

> Is anybody familar with autotools able to fix this?
> | configure.ac:104: required file `config/config.rpath' not found

You mean something like 'touch config.rpath' ? :)

-- ynezz


