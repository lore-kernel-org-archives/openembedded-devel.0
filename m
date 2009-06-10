Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1MEHQv-0007yM-Rr
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 08:37:15 +0200
Received: from tamarin.localnet (123-192-147-94.dynamic.kbronet.com.tw
	[123.192.147.94])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C4D191B10C1C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 06:29:08 +0000 (UTC)
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jun 2009 06:27:14 +0200
User-Agent: KMail/1.11.90 (Linux/2.6.30-8-generic; KDE/4.2.90; i686; ; )
References: <h0nft3$jso$1@ger.gmane.org>
In-Reply-To: <h0nft3$jso$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200906100627.14809.zecke@selfish.org>
Subject: Re: deduce git revision from mtn revision
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
X-List-Received-Date: Wed, 10 Jun 2009 06:37:18 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 10 June 2009 07:21:37 Rolf Leggewie wrote:
> Hi,
>
> is there any way to know which git revision corresponds to mtn commit
> 53dccbcb3344fa9a96f7f2c544d3dfec1b100fca?  I guess googling for the
> revision and then using git log can eventually yield that info.
> Anything simpler and more straight-forward?

Indirectly... use git log by date...

z.


