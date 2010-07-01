Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OUJIu-0001if-2R
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 14:55:45 +0200
Received: from [123.192.240.117] (unknown [123.192.240.117])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id E7D781B10C0D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jul 2010 12:52:47 +0000 (UTC)
Message-ID: <4C2C8F31.2050107@freyther.de>
Date: Thu, 01 Jul 2010 20:50:57 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.4) Gecko/20100624 Fedora/3.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819743@deimsg40.de.net.world>	<4C2A07C5.9060909@freyther.de>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA50181975A@deimsg40.de.net.world>
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA50181975A@deimsg40.de.net.world>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Creating a Own Tool chain, some referenced packages are not included into the SDK archive
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
X-List-Received-Date: Thu, 01 Jul 2010 12:55:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/29/2010 11:20 PM, Hauser, Wolfgang (external) wrote:
> Hello Holger Freyther,
> 
> here are the diffs for my changes:
> 
> diff of meta-toolchain-qte.bb <> meta-toolchain-xxx.bb

sorry, this diff is not readable, please use a unified diff for the changes.

> 
> The qte toolchain has created properly, my own do not.

So you say bitbake meta-toolchain-qte is working?


