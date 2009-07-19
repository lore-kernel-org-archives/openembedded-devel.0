Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MSTjx-0004gO-8V
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jul 2009 12:35:34 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 9D79316DE88
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 12:25:42 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 9DE2B2A4247
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 12:21:44 +0200 (CEST)
Received: from [10.24.0.58] ([10.24.0.58]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 19 Jul 2009 12:21:08 +0200
Message-ID: <4A62F3B2.9090401@dresearch.de>
Date: Sun, 19 Jul 2009 12:21:38 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A62DF07.8000804@dresearch.de>
	<h3unsp$1cs$1@ger.gmane.org>	<4A62E981.40607@dresearch.de>
	<1247997652.3356.0.camel@xora-desktop.xora.org.uk>
In-Reply-To: <1247997652.3356.0.camel@xora-desktop.xora.org.uk>
X-OriginalArrivalTime: 19 Jul 2009 10:21:09.0984 (UTC)
	FILETIME=[A27FBE00:01CA085A]
Subject: Re: do_qa_configure apr-util_1.3.4 fails
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
X-List-Received-Date: Sun, 19 Jul 2009 10:35:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> The message is pretty self explanatory and 10 secs with google would
> have given you the answer.
> 
> The configure script is referencing /usr/include in the include
> directorys. This is always an error.

That's the proof. I'm definitely no autoconf specialist. 

Anybody able to fix this problem in 10 seconds? I believe that i have no chance to do this in less than 10 days. ;-)

Steffen

PS: Is there somebody maintaining apr/apr-utils?



