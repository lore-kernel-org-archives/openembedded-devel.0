Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HEBgY-0005v3-MN
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Feb 2007 22:47:38 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 051F71A8F2F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2007 16:47:37 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Mon, 05 Feb 2007 16:47:37 -0500
X-Sasl-enc: dW0DXVPtswD8mGcKkg3LAikCIFgw9GRIEhR7gHa7ZIzK 1170712056
Received: from [192.168.0.11] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 24BF126D99
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2007 16:47:35 -0500 (EST)
Message-ID: <45C7A5FB.2000205@whitby.id.au>
Date: Tue, 06 Feb 2007 08:17:39 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45C6E906.9090602@whitby.id.au>
	<f383264b0702051149t7834f38cse108cc6ebd29fed1@mail.gmail.com>
In-Reply-To: <f383264b0702051149t7834f38cse108cc6ebd29fed1@mail.gmail.com>
Subject: Re: How will OE handle the US timezone change?
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
X-List-Received-Date: Mon, 05 Feb 2007 21:47:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Matt Reimer wrote:
> Todd Blumer (tnb on IRC) has been working on getting the timezones
> packages up. Check with him.

Would it be possible for Todd, Mike and Cliff (who are also working on
this problem) to get together and work on this together?

Perhaps by posting the requirements for the solution first (including
addressing how to handle the granularity issue, and the issue of
migrating from the old timezone packages) and leaving the implementation
details until after the requirements are agreed upon?

-- Rod


