Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1OjpUT-0005KM-Dy
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 10:20:05 +0200
Received: (qmail 24238 invoked from network); 13 Aug 2010 10:19:22 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 13 Aug 2010 10:19:22 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id LaWMKirNcGPo
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 10:19:20 +0200 (CEST)
Received: (Qmail 24195 invoked from network); 13 Aug 2010 10:19:20 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 13 Aug 2010 08:19:20 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1OjpTz-0002Lp-SX
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 10:19:19 +0200
Date: Fri, 13 Aug 2010 10:19:19 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100813081919.GB7328@mi.fu-berlin.de>
References: <4C64A5DE.8010603@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4C64A5DE.8010603@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-SA-Exim-Connect-IP: 160.45.40.10
X-SA-Exim-Mail-From: heinold@mi.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,
	UNPARSEABLE_RELAY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gnome-doc-utils: Add dependency upon gettext-native.
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
X-List-Received-Date: Fri, 13 Aug 2010 08:20:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

normaly inherit gettext should work, unfornatly gome stuff is missusing
the gettext m4 macros and made crappy one. Which furthermost dont let you
disable nls at all. So the fix is okay.

Bye Henning


