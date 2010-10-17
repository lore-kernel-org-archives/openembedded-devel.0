Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1P7a2l-0005t0-39
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 22:41:23 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id C95A91D3616D; Sun, 17 Oct 2010 22:40:47 +0200 (CEST)
Date: Sun, 17 Oct 2010 22:40:47 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101017204047.GO28423@ibawizard.net>
References: <1287344571-13760-1-git-send-email-ynezz@true.cz>
	<i9flvj$gec$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i9flvj$gec$1@dough.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] lua: use standard prefix for Lua libraries
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
X-List-Received-Date: Sun, 17 Oct 2010 20:41:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Koen Kooi <k.kooi@student.utwente.nl> [2010-10-17 22:23:15]:

[snip]

> LUA_LIB_DIR = "${libdir}/lua/5.1"
> 
> That would even make it work with that crazy micro distro that has no
> /usr :)

Ah, nice. Thanks.

-- ynezz


