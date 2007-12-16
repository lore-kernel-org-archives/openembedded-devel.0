Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J3qVw-0001AV-9M
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2007 11:14:28 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 4CA457C36A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2007 05:09:46 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sun, 16 Dec 2007 05:09:46 -0500
X-Sasl-enc: ng87mZ7Bs3nKg4A+9+LkkYA9frOQ/PsnSIYHQzjrcz/5 1197799785
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTP id 63D88DDAE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2007 05:09:45 -0500 (EST)
Message-ID: <4764F92F.3090602@whitby.id.au>
Date: Sun, 16 Dec 2007 20:38:47 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4764EDFB.9000801@whitby.id.au>
	<1323505412.20071216120459@gmail.com>
In-Reply-To: <1323505412.20071216120459@gmail.com>
X-Enigmail-Version: 0.95.5
Subject: Re: [ANN] New 'base-image' created (Was: [RFC] Add ipkg to minimal image)
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
X-List-Received-Date: Sun, 16 Dec 2007 10:14:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> Sunday, December 16, 2007, 11:20:59 AM, you wrote:
>> It is required to always be small enough to fit in the internal flash of
>> an NSLU2 (as an example of the smaller end of flash sizes that OE
>> supports).
> 
>   So, how little size did you achieve?

Not as small as I would like.  I did it using standard task-boot and a
couple of task-base packages, rather than do a custom package set up-front.

I expect it will be a good test case for determining what is appropriate
in task-base-foo packages ...

Be prepared for some packages to be removed - there is still a lot of
fat in there which is not strictly required by the defined image package
inclusion criteria.

-- Rod


