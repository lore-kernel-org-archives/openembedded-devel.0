Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NWVFZ-0008CP-6h
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 14:33:08 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id F3DCE1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 13:29:12 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jan 2010 14:30:39 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <> <1263733818-32111-1-git-send-email-camelguo@gmail.com>
In-Reply-To: <1263733818-32111-1-git-send-email-camelguo@gmail.com>
MIME-Version: 1.0
Message-Id: <201001171430.39964.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Set preferred glibc to 2.10.1 in conf/distro/micro.conf
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
X-List-Received-Date: Sun, 17 Jan 2010 13:33:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 17 January 2010 14:10:18 Guo Hongruan wrote:
> * the preferred version of binutils of conf/distro/micro.conf is 2.19.51
> * the preferred version of glibc is 2.6.1 which is defined in
>  sane-toolchain.inc * the ld produced by binutils-2.19.51 reports that it
>  can not find the __begin symbol when linking with glibc-2.6.1

It would be really great if you could start to read emails too.

So now we now two ways to cure the symptoms but we have no idea about the 
underlying root cause.

Is it too much to ask what the actual error is? The __begin reminds me of a 
bug in the linker script Khem was pointing out?


