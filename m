Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N82Pi-0007cw-S9
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 02:54:29 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 605251B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 02:03:55 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2009 02:52:48 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <DIIE.000005E3001861E8@192.168.11.6>
In-Reply-To: <DIIE.000005E3001861E8@192.168.11.6>
MIME-Version: 1.0
Message-Id: <200911110252.48370.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: question meta-toolchain on x86_64 for armv5te
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
X-List-Received-Date: Wed, 11 Nov 2009 01:54:30 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 10 November 2009 17:03:06 Johannes Maier wrote:
> Hi@all,
> 
> I'm new to openembedded and I didn't find any answers to my questions so I
>  hope to find here some help.
> 
> I get an error while building the meta-toolchain on x86_64 for armv5te.
> 
> So I wanted to ask if it is in general better to use a 32bit system for
>  such tasks since I don't get any error there?

This is not 32 vs 64 bits... more likely if fortify is enabled during 
compile.. The error looks like something I had fixed... so what are you 
building, using which OE revision?

z.




