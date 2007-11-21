Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IuyrX-0001I0-Fa
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2007 00:20:08 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 432D84D1B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 18:17:50 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 21 Nov 2007 18:17:50 -0500
X-Sasl-enc: CYxmYzwCvac8EPVu8kX70ZTUowYF40735kL/WbqZXl2F 1195687069
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 60CB51EAF8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 18:17:49 -0500 (EST)
Message-ID: <4744BC8B.8020607@whitby.id.au>
Date: Thu, 22 Nov 2007 09:47:31 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>	<4742217C.9060506@whitby.id.au>	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>	<4743201F.8000202@am.sony.com>
	<617697824.20071121042405@gmail.com>	<474471B1.6020101@am.sony.com>
	<1938272464.20071121202938@gmail.com>
In-Reply-To: <1938272464.20071121202938@gmail.com>
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Wed, 21 Nov 2007 23:20:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>   Yes, and it's good question what job is whose. For example, if
> OE should adapt itself to end users, or if rather targetted
> communities using OE should provide Makefiles, scripts, SDKs for
> their end users.

There are currently two targetted communities (nslu2-linux and openmoko)
who very publicly use Makefiles.  But yet, that is publicly scorned by
the OE core team (and Koen in particular) to the extent that it is a
minuted outcome of the last OE core team meeting.

So if the second option is not allowed by the OE core team, then perhaps
we should focus on the first option.  However, various individuals
continue to treat OE users (as opposed to OE developers) with scorn and
derision.

Does the OE core team simply not want people to use OE unless you are a
distribution developer?

-- Rod


