Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LRRMZ-0003t1-9J
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 14:18:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 06CB12C8A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2009 13:11:04 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQXniqfqaDu5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2009 13:11:02 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 6E9052C792
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2009 13:11:02 +0000 (UTC)
Message-ID: <497DB692.1040100@gmail.com>
Date: Mon, 26 Jan 2009 14:11:46 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <497D7E2A.8050302@gmail.com>	<1232966977.23807.3.camel@mill.internal.reciva.com>
	<glk6k7$ks8$1@ger.gmane.org>
In-Reply-To: <glk6k7$ks8$1@ger.gmane.org>
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
X-List-Received-Date: Mon, 26 Jan 2009 13:18:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Koen Kooi ha scritto:
> On 26-01-09 11:49, Phil Blundell wrote:
>> On Mon, 2009-01-26 at 10:11 +0100, Marco Cavallini wrote:
>>> DISTRO = "angstrom-2008.1"
>>
>> It might be worth trying with "minimal" to start with, just to eliminate
>> any angstrom-related uncertainties.
> 
> Quite the reverse, minimal is perputually broken in OE, while angstrom
> has working x86 targets. Not i486sx targets, but it's straightforward to
> add such a target.

I also thought it was a straightforward task, but I was wrong.
What's missing in what I did until now?

--
Marco Cavallini


