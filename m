Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N3Uyz-0002D7-Od
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Oct 2009 14:24:08 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 5E8CD1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2009 13:32:42 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Oct 2009 14:22:49 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <4AE992C4.4040802@dresearch.de>
In-Reply-To: <4AE992C4.4040802@dresearch.de>
MIME-Version: 1.0
Message-Id: <200910291422.50013.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to use patchwork?
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
X-List-Received-Date: Thu, 29 Oct 2009 13:24:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 29 October 2009 14:04:04 Steffen Sledz wrote:
> In the last days i had to patch suggestions concerning common recipes
> (glibc and busybox). That's why i planned to introduce them via the
> patchwork queue.
> 
> I prepared them with "git format-patch" and sent them using "git
> send-email" to openembedded-devel@lists.openembedded.org. They were
> sent to the list but did not reach patchwork. :(
> 
> So i believe i did something wrong. But what? Unfortunately the wiki
> is not very helpful here.

Did you have a "Signed-off-by: " line in it?

z.


