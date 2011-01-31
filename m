Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1Pk2B0-0004Fh-TP
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 23:24:51 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 945D21D366D1; Mon, 31 Jan 2011 23:23:54 +0100 (CET)
Date: Mon, 31 Jan 2011 23:23:54 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110131222354.GC10042@ibawizard.net>
References: <4D47307B.4040504@atmel.com>
MIME-Version: 1.0
In-Reply-To: <4D47307B.4040504@atmel.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Sorry about the recent mess
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
X-List-Received-Date: Mon, 31 Jan 2011 22:24:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ulf Samuelsson <ulf.samuelsson@atmel.com> [2011-01-31 22:58:19]:

> git format-patch -8 --start-at=16

Something like that? git format-patch HEAD~16..HEAD~8

-- ynezz


