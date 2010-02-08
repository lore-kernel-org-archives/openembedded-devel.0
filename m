Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NeODI-0008Nw-2C
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 08:39:23 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 8DDDB491278
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2010 08:36:50 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 8 Feb 2010 08:37:41 +0100
Message-ID: <4B6FBF2A.9000003@dresearch.de>
Date: Mon, 08 Feb 2010 08:37:14 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W217652A5FD6DFB2C0B4E2FD8570@phx.gbl>	<4B684D9D.2030001@dresearch.de>	<4B699C5A.70909@dresearch.de>	<20100203162120.GB26844@xora-build.xora.org.uk>	<4B6AC59A.90000@dresearch.de>	<4B6AC734.4090807@balister.org>
	<4B6AD2B0.3020104@dresearch.de>
	<loom.20100207T170912-780@post.gmane.org>
In-Reply-To: <loom.20100207T170912-780@post.gmane.org>
X-OriginalArrivalTime: 08 Feb 2010 07:37:42.0085 (UTC)
	FILETIME=[98CE1F50:01CAA891]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in bitbaking
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
X-List-Received-Date: Mon, 08 Feb 2010 07:39:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote::
>>>> [1] I've rechecked this again with angstrom distro and hipox,
>>>> beagleboard, and x86 machine making a clean build of glib-2.0:
>>>>
>>>>    rm -rf tmp.5
>>>>    bitbake glib-2.0
>>> glib-2.0 is building for me. Do you have an error log?
>> Yepp.
>>
> I have checked a fix into OE for this issue.

Thx, now it builds. :)




