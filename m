Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OIXQ6-00022X-Ju
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 03:34:31 +0200
Received: from [123.192.240.117] (123-192-240-117.dynamic.kbronet.com.tw
	[123.192.240.117])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 099271B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 01:39:32 +0000 (UTC)
Message-ID: <4C01BFA7.5040800@freyther.de>
Date: Sun, 30 May 2010 09:30:15 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-3.fc13 Lightning/1.0b1
	Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <htqn9k$gvu$1@dough.gmane.org>
	<AANLkTinPePxmIwOptgdFv-4CkJWzixbLvB26pxBw1dec@mail.gmail.com>
In-Reply-To: <AANLkTinPePxmIwOptgdFv-4CkJWzixbLvB26pxBw1dec@mail.gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Faking sign offs is bad
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
X-List-Received-Date: Sun, 30 May 2010 01:34:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/29/2010 07:14 PM, Andrea Adami wrote:
> The patch was sitting since long time (I had no time to test it
> before) and recently udev has been changed. I wanted to give it a bump
> before 'static' recipe renaming.
> 
> I'm sorry if its signature not conform.

Hi,

first of all thank you for your contribution. The issue here is that a
"Signed-off-by:" is not to give credit but at least in the classic sense
gives the origin (route of the patch to the tree).

In case you want to give credit you can use it in the commit message,
lile this patch is based on work of... or if it is fully written by
someone else use the --author on git commit.

happy hacking
	z


