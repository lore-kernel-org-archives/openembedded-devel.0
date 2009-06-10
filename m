Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1MEYqZ-0003be-HA
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 03:12:51 +0200
Received: from tamarin.localnet (123-192-147-94.dynamic.kbronet.com.tw
	[123.192.147.94])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 63FBA1B10C1C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2009 01:04:44 +0000 (UTC)
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Jun 2009 01:02:42 +0200
User-Agent: KMail/1.11.90 (Linux/2.6.30-8-generic; KDE/4.2.90; i686; ; )
References: <h0nft3$jso$1@ger.gmane.org> <200906100627.14809.zecke@selfish.org>
	<h0ol24$79k$1@ger.gmane.org>
In-Reply-To: <h0ol24$79k$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200906110102.42993.zecke@selfish.org>
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
X-List-Received-Date: Thu, 11 Jun 2009 01:12:51 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 10 June 2009 17:55:47 Rolf Leggewie wrote:
> Holger, thank you for your comment.
>
> Holger Freyther wrote:
> > Indirectly... use git log by date...
>
> Two questions
>
> 1) how do I actually do that? "git help log" did not know.
> 2) will that help if I only know the mtn rev id and not its date?

well, you can use mtn to get the date based on the revision and you can use 
git log --since= /--after...

z,


