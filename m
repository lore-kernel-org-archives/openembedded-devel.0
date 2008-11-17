Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1L23t1-0005YI-Iw
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 14:11:27 +0100
Received: from imp050244.vpn.mi.fu-berlin.de ([130.133.50.244]
	helo=tamarin.localnet) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1L23ql-0003cn-UD
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 14:09:07 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Nov 2008 14:08:26 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27-7-generic; KDE/4.1.2; i686; ; )
References: <20081115233908.1158D189341@amethyst.openembedded.net>
	<200811160133.01482.mickey@vanille-media.de>
In-Reply-To: <200811160133.01482.mickey@vanille-media.de>
MIME-Version: 1.0
Message-Id: <200811171408.26298.zecke@selfish.org>
Subject: Re: [oe-commits] Holger Hans Peter Freyther : u-boot-openmoko: Remove AUTHOR line, this was meant to be the recipe author line
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
X-List-Received-Date: Mon, 17 Nov 2008 13:11:27 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


>
> No, that's wrong. AUTHOR refers to the package author -- since day one of
> OE :)

Mental note: AUTHOR != MAINTAINER :)

still the AUTHOR line is most of the time not correct. The best example is 
OpenStreetmap and and the creative commons license. It is not practicable to 
list all authors.

did you already revert that particual commit? or should i?

z. 


