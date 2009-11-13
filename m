Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N8krD-0004nV-5e
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 02:21:50 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 939CE1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 01:31:22 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Nov 2009 02:19:56 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200911120457.39018.holger+oe@freyther.de>
	<1258038869.4924.67.camel@conroy-linux>
	<1258039776.4924.69.camel@conroy-linux>
In-Reply-To: <1258039776.4924.69.camel@conroy-linux>
MIME-Version: 1.0
Message-Id: <200911130219.56218.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: meta-toolchain continues to woe
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
X-List-Received-Date: Fri, 13 Nov 2009 01:21:50 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 12 November 2009 16:29:36 Chris Conroy wrote:
> > I submitted a patch to opkg back in September to fix this error message
> > to be a bit more useful. If you upgrade to opkg >=216 it will save you
> > some headaches whenever this error occurs.
> 
> Apologies. I should have read your error message more closely since it
> looks like you are getting the extra debug information from my patch.
> Feel free to make a patch with more debug info for said error or just
> let me know what you think would be appropriate and I can submit a new


Hi,

Koen recently upgraded opkg* to something above >= 216.

regards
	holger


