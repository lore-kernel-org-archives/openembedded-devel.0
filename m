Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1Pk1Cc-00025L-Hk
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 22:22:26 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 609BF1D366D1; Mon, 31 Jan 2011 22:21:30 +0100 (CET)
Date: Mon, 31 Jan 2011 22:21:30 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110131212130.GB10042@ibawizard.net>
References: <1296220046-14636-1-git-send-email-sujak.marek@gmail.com>
	<20110129140758.GM2466@ibawizard.net>
	<AANLkTikMy0Hw9Yi3B1fHoDbF5jq_J8DaS3vPT+bGs=6h@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikMy0Hw9Yi3B1fHoDbF5jq_J8DaS3vPT+bGs=6h@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH v2] barebox: added recipe for barebox v 2010.10
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
X-List-Received-Date: Mon, 31 Jan 2011 21:22:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Marek Sujak <sujak.marek@gmail.com> [2011-01-31 09:43:58]:

> > Duplicate DP=-1 and you can drop the comment also, it's wrong anyway.
> 
> Done.  Should be removed in Patch v3. I was unable to git cherry-pick ... so
> i rather cloned whole repository and make patch again.

And that's why you've made it wrong again :-)

Yes, you've sent two patches, but with wrong content. It should be two patches,
but first one should add generic support for Barebox 2010.10 as Eric suggested
and the second one should contain support for your vmx25 machine for Barebox:

[patch v4] barebox: add recipe for 2010.10 release
[patch v4] barebox: add support for vmx25 machine

-- ynezz


