Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Ooxyk-0001r1-Dh
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 14:24:24 +0200
Received: from [192.168.1.15] (e180147188.adsl.alicedsl.de [85.180.147.188])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id AE274584116
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 14:28:10 +0200 (CEST)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1282834554-16358-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1282834554-16358-1-git-send-email-fransmeulenbroeks@gmail.com>
Organization: Vanille-Media
Date: Fri, 27 Aug 2010 14:23:49 +0200
Message-ID: <1282911829.1860.6.camel@jupiter>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] minimal.conf: added ivp4 and ipv6 as distro features
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
X-List-Received-Date: Fri, 27 Aug 2010 12:24:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 26.08.2010, 16:55 +0200 schrieb Frans Meulenbroeks:
> minimal.conf has nfs as distro feature but not ip4 or ipv6.
> This makes that busybox does not generate networking applets
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Acked-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>

Well spot, thanks!

:M:





