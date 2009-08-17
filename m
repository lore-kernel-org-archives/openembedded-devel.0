Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mcza4-0000Xx-1k
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 12:36:48 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id D0B031B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 10:23:30 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 12:19:14 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A892A41.6070702@cam.ac.uk>
In-Reply-To: <4A892A41.6070702@cam.ac.uk>
MIME-Version: 1.0
Message-Id: <200908171219.14115.holger+oe@freyther.de>
Subject: Re: [PATCH] glibc 2.9: Remove unnecessary asm/page.h include, not present in recent headers
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
X-List-Received-Date: Mon, 17 Aug 2009 10:36:48 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 17 August 2009 12:00:33 Jonathan Cameron wrote:
> Only applies to arm.  The bug may also exist for alpha.
> The include doesn't appear to be necessary anyway.
>
> Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
> ---
> First oe patch. Please tell me if I got any of the patch formatting
> wrong etc. Lots more to follow ;)


In the future we will ask us why is this patch necessary. So to ease answering 
the question the patch itself should include the build error you are seeing, a 
post to a mailinglist or even better a ticket in the glibc bugzilla.

thanks
	z.


