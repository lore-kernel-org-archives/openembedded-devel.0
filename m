Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LRPZV-00025v-An
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 12:24:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 86E572C8A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2009 11:16:18 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MdFbYlDLjJ+C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2009 11:16:17 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id BAA162C792
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2009 11:16:16 +0000 (UTC)
Message-ID: <497D9BAC.5070201@gmail.com>
Date: Mon, 26 Jan 2009 12:17:00 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <497D7E2A.8050302@gmail.com>
	<1232966977.23807.3.camel@mill.internal.reciva.com>
In-Reply-To: <1232966977.23807.3.camel@mill.internal.reciva.com>
Subject: Re: Building for i486 based non-FPU device
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
X-List-Received-Date: Mon, 26 Jan 2009 11:24:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Phil Blundell ha scritto:
> On Mon, 2009-01-26 at 10:11 +0100, Marco Cavallini wrote:
>> DISTRO = "angstrom-2008.1"
> 
> It might be worth trying with "minimal" to start with, just to eliminate
> any angstrom-related uncertainties.

Ok, thanks
I tried with bitbake minimal-image too (see pastebin)

>> i486-generic uses TARGET_ARCH = "i486" : build broken
>>
>> No one of the previous tested build give a useful result,
>> what could I change to get a running system?
> 
> It's hard to say what you need to change without knowing what exactly is
> going wrong.  Can you give more details of the breakage that you
> encountered?  What image were you trying to build, what package(s)
> failed, and what were the errors?

http://debian.pastebin.com/m57df2ac9

TIA
--
Marco Cavallini


