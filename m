Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NMI0N-0002Qq-3I
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 10:23:14 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 429871B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2009 09:17:22 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Dec 2009 10:21:14 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1261261596-19241-1-git-send-email-raj.khem@gmail.com>
	<200912200422.50437.holger+oe@freyther.de>
	<19c1b8a90912200101i4fa53a20q5f8f75c5e809827c@mail.gmail.com>
In-Reply-To: <19c1b8a90912200101i4fa53a20q5f8f75c5e809827c@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200912201021.14646.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 3/3] minimal: Add 'mplt' to DISTRO_FEATURES.
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
X-List-Received-Date: Sun, 20 Dec 2009 09:23:14 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Sunday 20 December 2009 10:01:40 Khem Raj wrote:

> I tried to use oe_filter_out but I did not succeed, I guess distro
> conf files are too early for in place evaluation
> and if I had to do lazy evaluation then it has to be done somewhere
> later which I did not know what it could be

did you try with := ?



