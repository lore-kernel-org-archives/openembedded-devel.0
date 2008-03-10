Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JYfAl-0008TH-2B
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Mar 2008 11:24:03 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 385D062805D;
	Mon, 10 Mar 2008 11:22:08 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47D375BD.6010009@gmail.com>
References: <47D375BD.6010009@gmail.com>
Date: Mon, 10 Mar 2008 11:22:07 +0100
Message-Id: <1205144527.3728.16.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-SA-Exim-Connect-IP: 82.119.242.94
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: htcuni.patch generic for all devices?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Mar 2008 10:24:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Junqian Gordon Xu wrote:
> htcuni.patch is not clean in .dev and breaks linux-rp_2.6.24 for all 
> devices. My questions is why this patch was applied to all devices in 
> thefirst place. Shouldn't this patch be put under the htcuniversal 
> section, regardless if it's broken or not?

I am not a HTC Universal user, so I cannot test its function, but from
aspect of other devices, it looks clean and does not break my Zaurus
kernel.

Consequent reject in another patch sharpsl-rc is another problem,
trivial to fix.

Richard, what is your opinion? Do you prefer device specific patch sets
or making all clean enough patches generic?

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



