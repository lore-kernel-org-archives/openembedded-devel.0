Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J3lZC-0007GC-M7
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2007 05:57:30 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 02FFC4895D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2007 23:52:50 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Sat, 15 Dec 2007 23:52:50 -0500
X-Sasl-enc: fu6hKJu9N4y1AF+R1R76kjrRJzWs6rUNujeVTu7JudDV 1197780769
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTP id 3412425F23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2007 23:52:48 -0500 (EST)
Message-ID: <4764AEE7.5040908@whitby.id.au>
Date: Sun, 16 Dec 2007 15:21:51 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <164348748.20071215043923@gmail.com>	<c384c5ea0712150526i2a8147c5ud43b5e79c52a7feb@mail.gmail.com>
	<1515905492.20071215173513@gmail.com>
In-Reply-To: <1515905492.20071215173513@gmail.com>
X-Enigmail-Version: 0.95.5
Subject: Re: [RFC] ANGSTROM_MODE -> SYSTYPE
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
X-List-Received-Date: Sun, 16 Dec 2007 04:57:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>   Well, SYSTYPE has another aim and idea in its introduction. I hinted
> about that in original mail, now let me make it explicit: the proposal
> is about introduction of the standard OE variable name for distro
> parameter tweaking. Its meaning however completely depends on the
> distro. Some distro needs switch libc's. Some needs to switch WMs.
> Others need to switch many other things, possibly, in combinations.
> Very good. OE recommends a standard general syntax for that - a
> SYSTYPE. Exact format of what goes into SYSTYPE and its semantics is
> up to distro (and users will know about all that by reading distro's
> docs). (Now that we talk about validation, it puts additional
> syntactic constraints on SYSTYPE value, that's why I'm personally not
> keen to start with [rigid] validation from the beginning).

How is this different to the USE flags proposals that have come and gone
in the past?

-- Rod



