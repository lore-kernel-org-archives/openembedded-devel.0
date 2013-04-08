Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UPLHX-0001aP-Th
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 01:15:24 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id CA95E27570;
	Tue,  9 Apr 2013 00:58:06 +0200 (CEST)
Message-ID: <51634B82.3070807@pseudoterminal.org>
Date: Tue, 09 Apr 2013 00:58:10 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1365458017-3185-1-git-send-email-dv@pseudoterminal.org>
	<1644870.xWQQ3phVp5@helios>
In-Reply-To: <1644870.xWQQ3phVp5@helios>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] add recipe for mpg123, a decoder for MPEG-1 layer 1, 2, and 3
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
X-List-Received-Date: Mon, 08 Apr 2013 23:15:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-04-09 00:49, Paul Eggleton wrote:
> Recipe looks good, however this should probably go into meta-multimedia. We do
> still have some multimedia recipes in meta-oe but these ought to be moved
> (when someone gets around to it).
>
> Cheers,
> Paul
>

I was already wondering about this. So the long-term plan is to move 
multimedia stuff out of meta-oe, okay.
Shall I re-send the patch in the meta-multimedia directory?


