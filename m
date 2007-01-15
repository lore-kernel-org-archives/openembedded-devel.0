Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H6aZT-0006ve-9n
	for openembedded-devel@openembedded.org; Mon, 15 Jan 2007 23:44:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0FMgXPt021176
	for <openembedded-devel@openembedded.org>; Mon, 15 Jan 2007 22:42:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20519-10 for <openembedded-devel@openembedded.org>;
	Mon, 15 Jan 2007 22:42:31 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0FMgUZQ021168
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 15 Jan 2007 22:42:30 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1168887283.14505.24.camel@ip6-localhost>
References: <1168887283.14505.24.camel@ip6-localhost>
Date: Mon, 15 Jan 2007 22:42:31 +0000
Message-Id: <1168900952.5860.107.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Maemo compatible toolchain
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
X-List-Received-Date: Mon, 15 Jan 2007 22:44:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-01-15 at 19:54 +0100, Patrick Ohly wrote:
> ork on the official image because I want my software to be
> usable by "normal" users without having to reflash their devices.
> There's Scratchbox of course, but it currently does not work for me
> (known incompatibility with 2.6.18 kernel). Is compiling for Maemo
> with
> OE something that has been tried before?

As far as toolchains go, poky has a POKYMODE (eabi5) which roughly
corresponds to maemo's csl 'EABI' toolchain. I think those versions of
the csl packages were added into OE by me.

Cheers,

Richard





