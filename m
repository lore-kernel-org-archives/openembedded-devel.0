Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N8WGq-0002hi-4M
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 10:47:19 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 2A7A21B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 09:56:50 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2009 10:45:36 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <4AFBA741.6090207@techsol.ca>
In-Reply-To: <4AFBA741.6090207@techsol.ca>
MIME-Version: 1.0
Message-Id: <200911121045.36412.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: curl-native doesn't install includes
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
X-List-Received-Date: Thu, 12 Nov 2009 09:47:19 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 12 November 2009 07:12:17 Dallas Foley wrote:
> Pretty sure curl-native doesn't install it's includes, because from a clean
> build opkg-native cant' find curl includes.
> 
> $ git show-ref org.openembedded.dev
> 0462985d8af5e8d2a71f548abe29c6e3bbaa2d2a refs/heads/org.openembedded.dev
> 
> I'm not really sure if this patch is correct, but seems to work.

Is this a recent breakage? Could you attempt to build from a weeks older OE 
metadata?


