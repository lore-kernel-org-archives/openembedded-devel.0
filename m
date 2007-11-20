Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IuaY1-0003aI-NO
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 22:22:21 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id D7ED84C701
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 16:20:10 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Tue, 20 Nov 2007 16:20:10 -0500
X-Sasl-enc: uoGITx2Qu03rbAUkyiEuhxtGxva9A9XZgMxANVvvveRC 1195593610
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 2BEF71C2F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 16:20:09 -0500 (EST)
Message-ID: <47434F78.3040205@whitby.id.au>
Date: Wed, 21 Nov 2007 07:49:52 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>	<4742217C.9060506@whitby.id.au>	<4742AFCC.1060000@student.utwente.nl>	<4742C0FB.1010101@whitby.id.au>
	<4742D2C0.7090805@student.utwente.nl>
In-Reply-To: <4742D2C0.7090805@student.utwente.nl>
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
X-List-Received-Date: Tue, 20 Nov 2007 21:22:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Rod Whitby schreef:
>> Isn't the creator of the OpenMoko build environment an OE core team
>> member?  Does the OpenMoko build environment setup documentation follow
>> your prescription for TMPDIR and multimachine?
> 
> Mickey was and is an OE core developer, but all the other core members
> have been appalled by the implementation of the OM env described in
> their wiki (to mention a few: hardcoding BUILD_ARCH and replacing
> /usr/bin/svn with a script).

So are you saying that the very first OM wiki how-to-build documentation
(which predated any MokoMakefile) was written by someone other than
Mickey, and that Mickey did not agree with the public release of the
description of how to build OpenMoko using OE?  I find that incredulous.

> As proven multiple times on the OE-devel list, the OM wiki has bad
> practices for using OE. At the last OEDEM we coined 'Mo(c)kumentation'
> to describe it.

Yes, and you continue to disparage the OpenMoki wiki documentation,
instead of helping to fix it.

-- Rod


