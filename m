Received: from carmex.station51.net ([109.74.206.142] helo=station51.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <butters@station51.net>) id 1OIi39-00034o-7K
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 14:56:32 +0200
Received: from [87.241.107.86] (account butters HELO [192.168.1.201])
	by station51.net (CommuniGate Pro SMTP 5.3.4)
	with ESMTPSA id 1432738 for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 14:51:20 +0200
Message-ID: <4C025F4C.7010305@station51.net>
Date: Sun, 30 May 2010 14:51:24 +0200
From: butters <butters@station51.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <htqn9k$gvu$1@dough.gmane.org>	<AANLkTinPePxmIwOptgdFv-4CkJWzixbLvB26pxBw1dec@mail.gmail.com>
	<4C01BFA7.5040800@freyther.de>
In-Reply-To: <4C01BFA7.5040800@freyther.de>
X-SA-Exim-Connect-IP: 109.74.206.142
X-SA-Exim-Mail-From: butters@station51.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Broken recipes
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
X-List-Received-Date: Sun, 30 May 2010 12:58:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi there,

Can someone tell me the reason for keeping broken recipes in the tree? 
Examples are the maemo task and image, the openmoko task doesn't compile 
because its missing stuff. Are these things going to eventually be 
fixed, or are they there for some other reason that I'm not 
understanding? I'm not trying to be insulting to anyone, but I think 
having broken things that don't even make it to the compile stage in the 
tree will confuse a lot of people.

Thanks,
Bill


