Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MdE6u-0004Uj-Kp
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 04:07:40 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id A4BBD1B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 01:54:22 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Aug 2009 03:50:02 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <E1Md2kK-0008Uz-Fd@melo.openembedded.org>
	<20090817152407.GA2227@smtp.west.cox.net>
In-Reply-To: <20090817152407.GA2227@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200908180350.02392.holger+oe@freyther.de>
Subject: Re: [oe-commits] Holger Hans Peter Freyther : site: Add ac value	for mipsel-linux and mipsel-linux-uclibc
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
X-List-Received-Date: Tue, 18 Aug 2009 02:07:40 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 17 August 2009 17:24:08 Tom Rini wrote:

> Given that the answer is the same for mipsel-linux and
> mipsel-linux-uclibc, this is probably the wrong place.  The right place
> is either a mips common one or a linux common one (if it's also the same
> for every other linux platform).

To be honest CONFIG_SITE is always a bit of black magic to me. Can I just 
create mipsel-common and it will be picked up? Actually I should just try it.

z.


