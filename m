Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PtS1D-0003cF-UT
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 22:49:40 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 7A7E91D360AA; Sat, 26 Feb 2011 22:48:13 +0100 (CET)
Date: Sat, 26 Feb 2011 22:48:13 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110226214813.GD10042@ibawizard.net>
References: <1298742255-23389-1-git-send-email-ynezz@true.cz>
	<1298745578.3818.7.camel@lenovo.internal.reciva.com>
	<20110226185959.GC10042@ibawizard.net>
	<1298748041.3818.10.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1298748041.3818.10.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 1/2] micro-uclibc: add xattr to distro features to	fix build failure of libcap2
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
X-List-Received-Date: Sat, 26 Feb 2011 21:49:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Phil Blundell <philb@gnu.org> [2011-02-26 19:20:41]:

> So, absent a compelling usage scenario for libcap2 on micro, please
> don't commit this patch.

Ok, please revert it then and sorry for the noise...

-- ynezz


