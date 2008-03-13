Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1JZbCI-0004zI-Ee
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 01:21:29 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id DD271C52E8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 20:19:19 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 12 Mar 2008 20:19:19 -0400
X-Sasl-enc: rpUxIGxMiEgYOzSbaAyKmU4qIP94sWIZgbUAE7S1l5ot 1205367558
Received: from [172.18.92.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 4FA2D191E9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 20:19:16 -0400 (EDT)
Message-ID: <47D872D7.4060404@whitby.id.au>
Date: Thu, 13 Mar 2008 10:48:31 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803110807.11368.zecke@selfish.org>	<20080311114938.GM30267@ibawizard.net>	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>	<20080311145739.GN30267@ibawizard.net>	<1205250588.4521.111.camel@dax.rpnet.com>	<20080312014945.4783ae6a@widy.localdomain>	<1205280598.16531.26.camel@dax.rpnet.com>	<20080312024408.44d9192e@widy.localdomain>	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>	<fr997r$aat$1@ger.gmane.org>	<c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>
	<1205358843.4530.22.camel@dax.rpnet.com>
In-Reply-To: <1205358843.4530.22.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 66.111.4.28
X-SA-Exim-Mail-From: rod@whitby.id.au
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Thu, 13 Mar 2008 00:21:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> Whilst I've argued against it in the past I would consider a move of
> bitbake from svn to git too.

I'd like to see bitbake made part of the *same* repository, since 
bitbake and OE are so intimately linked, and no-one uses bitbake for 
anything other than OE, and no-one uses OE with anything other than bitbake.

-- Rod


