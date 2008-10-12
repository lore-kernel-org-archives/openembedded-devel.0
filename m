Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KpASs-0007np-FQ
	for openembedded-devel@openembedded.org; Mon, 13 Oct 2008 01:35:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9CNUC8E019747
	for <openembedded-devel@openembedded.org>;
	Mon, 13 Oct 2008 00:30:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19585-05 for <openembedded-devel@openembedded.org>;
	Mon, 13 Oct 2008 00:30:06 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9CNU4en019740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 13 Oct 2008 00:30:04 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200810130034.18105.zecke@selfish.org>
References: <200809031554.52267.zecke@selfish.org>
	<200810130034.18105.zecke@selfish.org>
Date: Mon, 13 Oct 2008 00:30:06 +0100
Message-Id: <1223854206.5230.6.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Hash based SCMs and OpenEmbedded/Bitbake
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
X-List-Received-Date: Sun, 12 Oct 2008 23:35:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, 2008-10-13 at 00:34 +0200, Holger Freyther wrote:
> On Wednesday 03 September 2008 15:54:52 Holger Freyther wrote:
> > Hey guys,
> 
> okay, I merged these patches now.

Hmm, that will teach me to take my eye off the mailing lists. So we do
git checkouts now when parsing?

Richard



