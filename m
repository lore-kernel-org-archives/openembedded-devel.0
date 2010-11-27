Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PMLN2-0005HB-Lc
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 15:03:59 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 417D81D36171; Sat, 27 Nov 2010 15:02:00 +0100 (CET)
Date: Sat, 27 Nov 2010 15:02:00 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101127140200.GH10755@ibawizard.net>
References: <1290768432-13366-1-git-send-email-ynezz@true.cz>
	<AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>
	<ico56o$f8$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ico56o$f8$2@dough.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: bump uclibc to 0.9.30.3 which	unbreaks x264
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
X-List-Received-Date: Sat, 27 Nov 2010 14:03:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Koen Kooi <k.kooi@student.utwente.nl> [2010-11-26 12:20:56]:

> An upgrade of binutils is out of the question for angstrom 2008.

Ok, what do you suggest to fix that uclibc breakage which happens with
angstrom-2008 and angstrom-2010[1] (it's with mesa fix applied). Thanks.

1. http://tinderbox.openembedded.net/packages/1099789/

-- ynezz


