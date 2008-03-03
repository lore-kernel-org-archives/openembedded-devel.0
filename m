Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1JWCtY-0001Wd-5M
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Mar 2008 16:49:07 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 9F18CACEE1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2008 10:46:53 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Mon, 03 Mar 2008 10:46:53 -0500
X-Sasl-enc: UyRKS+33uCirdN5S3Ms0rtpOrC0RaVKKnGsPfjAI5sbE 1204559213
Received: from [192.168.248.18] (98.mue2.phnx.la6ca01r1.dsl.att.net
	[12.102.2.98])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 43A96106B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2008 10:46:53 -0500 (EST)
Message-ID: <47CC1D49.3000605@whitby.id.au>
Date: Tue, 04 Mar 2008 02:16:17 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1204303564.8126.38.camel@dax.rpnet.com>	<200803030207.40083.zecke@selfish.org>	<1204537079.8095.19.camel@dax.rpnet.com>	<200803031312.15859.zecke@selfish.org>
	<fqgs03$f44$1@ger.gmane.org>
	<1204554867.8095.61.camel@dax.rpnet.com>
In-Reply-To: <1204554867.8095.61.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 66.111.4.27
X-SA-Exim-Mail-From: rod@whitby.id.au
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
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
X-List-Received-Date: Mon, 03 Mar 2008 15:49:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> I know angstrom is doing some kind of autobuilds but I don't know to
> what extent or what policies govern what is built. I also know the nslu2
> people maintain lists of packages to build and not to build. If we could
> somehow pool this information that would be ideal.

The NSLU2-Linux people would be happy to participate in a pooling of 
marking broken and working packages.

Our current list is at packages/meta/slugos-packages.bb and that list is 
continually incrementally autobuilt on the nslu2-linux autobuilder.

-- Rod


