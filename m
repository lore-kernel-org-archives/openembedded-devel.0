Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JQ3Ac-0000Lg-I7
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 17:12:26 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JQ3AL-0001Bk-8C
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 16:11:57 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 15 Feb 2008 16:11:57 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 15 Feb 2008 16:11:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 15 Feb 2008 17:11:47 +0100
Message-ID: <fp4dk4$kgh$1@ger.gmane.org>
References: <E1JPfb1-0006hO-Ll@linuxtogo.org>	<74d0deb30802140817g153c4fe3if16cd9eabe67c9f3@mail.gmail.com>	<200802151245.30040.mickey@vanille-media.de>	<fp48t2$i8$1@ger.gmane.org>
	<47B5A9A4.3040400@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <47B5A9A4.3040400@dls.net>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: RFD: is bitbake 1.8.10 minimum supported standard? (was: [oe-commits] org.oe.dev anki: fix parse error)
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
X-List-Received-Date: Fri, 15 Feb 2008 16:12:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mike (mwester) wrote:
> Requiring a bitbake upgrade to accommodate a 
> single-line in a single recipe that can easily be expressed in a fashion 
> compatible with the existing bitbake versions installed, well that just 
> seem to fly in the face of that earlier discussion.

Well, seen from that angle that seems to hold.  But that was not my
angle and I hope I was not being mistaken in this regard.

IIRC bitbake 1.8.10 has quite many bug fixes as well (RP?).  So, that is
more what I was getting at.  AFAIK, .dev and bitbake were meant to be
closely coupled.  IOW, don't run bleeding edge .dev with an old bitbake
and expect things to work.

I am open to extend the time until 1.8.8 is officially dead for .dev
What do others think about this question of timing?



