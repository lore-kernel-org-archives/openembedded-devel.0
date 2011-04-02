Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1Q63l4-0007DJ-BF
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 18:33:06 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 3C63C1D360AD; Sat,  2 Apr 2011 18:31:02 +0200 (CEST)
Date: Sat, 2 Apr 2011 18:31:01 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110402163101.GA23489@ibawizard.net>
References: <1301753930-32581-1-git-send-email-ynezz@true.cz>
	<1301753930-32581-6-git-send-email-ynezz@true.cz>
	<in7hmh$og5$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <in7hmh$og5$1@dough.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 5/6] linux-2.6.36: remove ts72xx support because	2.6.38 is now default
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
X-List-Received-Date: Sat, 02 Apr 2011 16:33:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Koen Kooi <koen@dominion.thruhere.net> [2011-04-02 18:08:48]:

> Is it really necessary to remove it from .36 instead of DP+1;ing .38?

It's not, but wouldn't it be better to remove the patches from the unsupported
kernel version? It's just a start, RFC and if it's ok I would like to remove
the references of ts72xx in all older and unsupported kernel versions. What's
a point of keeping them in oe-dev branch, anyway?

-- ynezz


