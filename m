Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Nzc8e-0006yH-Tj
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Apr 2010 22:46:17 +0200
Received: from tamarin.localnet (static.233.147.46.78.clients.your-server.de
	[78.46.147.233])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id EFCA51B10C79;
	Wed,  7 Apr 2010 20:47:51 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 7 Apr 2010 22:42:40 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34-rc3-00001-g17459ed; KDE/4.4.2; i686; ; )
References: <p2y46a47f951004071306meb244b2ge55fbff26849ccf@mail.gmail.com>
	<201004072220.23343.holger+oe@freyther.de>
	<w2v46a47f951004071335x58520b7x5207a54dd49e265b@mail.gmail.com>
In-Reply-To: <w2v46a47f951004071335x58520b7x5207a54dd49e265b@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201004072242.40723.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problem with creating an SDK and host libraries
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
X-List-Received-Date: Wed, 07 Apr 2010 20:46:17 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 07 April 2010 22:35:18 Ryan Phillips wrote:

> Thanks for the quick response.
> 
> ldd
> /home/rphillips/sdk/build-cmc-angstrom/tmp/staging/x86_64-linux/usr/lib/li
> bopkg.so.0 linux-vdso.so.1 =>  (0x00007fff2efff000)

Could you also provide the output of objdump -x libopkg.so and then list 
everything as part of SO_NEEEDED?


