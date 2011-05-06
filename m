Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1QIGyT-0003Xc-UW
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 11:05:26 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 2B7481D36124; Fri,  6 May 2011 11:02:44 +0200 (CEST)
Date: Fri, 6 May 2011 11:02:44 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110506090243.GE26466@ibawizard.net>
References: <1304243449-12028-1-git-send-email-heroor@ti.com>
	<20110501173015.GI27708@ibawizard.net>
	<BANLkTimKHp5M5VvMR21+C_rSRBiu2M0BKQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTimKHp5M5VvMR21+C_rSRBiu2M0BKQ@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 1/2] zeromq: Add zeromq socket library.
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
X-List-Received-Date: Fri, 06 May 2011 09:05:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Siddharth Heroor <heroor@gmail.com> [2011-05-03 22:18:03]:

> Is the older recipe available somewhere? I didn't have to do this for the
> latest version.

Yes, it's in patchwork[1]. I should've pushed it few weeks ago, but didn't had
time to rebase and test it again yet. Hopefully I'll do it during this
weekend.

AFAIK, libuuid from util-linux-ng is build/run dependency, so it's needed.

1. http://patches.openembedded.org/patch/1885

-- ynezz


