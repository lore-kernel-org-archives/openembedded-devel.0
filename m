Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1N2jCL-0006cv-6Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 11:22:45 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1N2jB7-0008HM-Rs
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 10:21:25 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1N2jB5-00054m-3H
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 10:21:23 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hc6f2q$qum$2@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>
	<hc6f2q$qum$2@ger.gmane.org>
Date: Tue, 27 Oct 2009 10:21:19 +0000
Message-Id: <1256638879.23985.35.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Tue, 27 Oct 2009 10:22:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-10-27 at 10:38 +0100, Koen Kooi wrote:
> No real discussion on this the past few days, so I pushed my branch into 
> .dev that basically boils down to a revert and fixes the issues raised 
> by Phil.

That sounds good to me.  If there are any remaining issues then
presumably we can fix them incrementally.

p.




