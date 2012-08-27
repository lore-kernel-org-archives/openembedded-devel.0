Received: from gravedo.de ([85.214.79.159] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1T61Dj-00056X-Du
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Aug 2012 17:27:19 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id D1AB6204001; Mon, 27 Aug 2012 17:09:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=6.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from [192.168.178.27] (dslb-088-070-142-200.pools.arcor-ip.net
	[88.70.142.200]) by gravedo.de (Postfix) with ESMTPSA id 85A5F3B34015
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 17:09:53 +0200 (CEST)
Message-ID: <503B8DC7.3050909@gravedo.de>
Date: Mon, 27 Aug 2012 17:09:59 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.5a1pre
Subject: [meta-oe] udev without initscript
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
X-List-Received-Date: Mon, 27 Aug 2012 15:27:19 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hey everybody,

recently I discovered that the udev version provided by meta-oe doesn't
ship an initscript for sysvinit anymore where oe-core's version of udev
still does. Is there a specific cause for this or is it just as
everybody uses systemd theses days with meta-oe instead of sysvinit?

If there is not specific cause I will provide a patch to the initscript
back for the versions of udev in meta-oe.

regards,
Simon

-- 
Simon Busch - http://mm.gravedo.de/blog/


