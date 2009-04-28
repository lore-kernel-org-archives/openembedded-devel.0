Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1Lyqrr-0006gA-Ep
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 19:13:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 4301E2C82A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 17:05:44 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XtYeCz5OPVtI
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 17:05:42 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTP id 963F82C797
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 17:05:42 +0000 (UTC)
Message-ID: <49F737EE.7090602@gmail.com>
Date: Tue, 28 Apr 2009 19:07:58 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49F71454.8020406@gmail.com> <gt76qa$40s$1@ger.gmane.org>
In-Reply-To: <gt76qa$40s$1@ger.gmane.org>
Subject: Re: [STABLE][PATCH] modified kaeilos distro configuration
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
X-List-Received-Date: Tue, 28 Apr 2009 17:13:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi ha scritto:
> On 28-04-09 16:36, Marco Cavallini wrote:
> 
>> +#PREFERRED_PROVIDER_virtual/psplash               ?= "psplash-kaeilos"
> 
> That one doesn't exist in OE.

In fact is commented for future use :-)

>> +PREFERRED_PROVIDER_bluez-libs            = "bluez4"
> 
> And that only works in angstrom.

What do you suggest?
Is possible to have it here too?

/marco


