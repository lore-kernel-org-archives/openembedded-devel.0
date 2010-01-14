Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NVUTN-0005IA-Sr for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 19:31:13 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NVUR6-0006Dv-Nv
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 19:28:48 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 19:28:48 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 19:28:48 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 14 Jan 2010 19:27:55 +0100
Message-ID: <hinnna$sc1$1@ger.gmane.org>
References: <alpine.LFD.2.00.1001140943220.2609@localhost>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <alpine.LFD.2.00.1001140943220.2609@localhost>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: current state of OE dev branch?
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
X-List-Received-Date: Thu, 14 Jan 2010 18:31:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-01-10 15:45, Robert P. J. Day wrote:
> 
>   later today, i'll take another shot at building the BB-demo-image.
> based on whatever gets "git pull"ed at the time, is there any
> still-known breakage?  in my case, for f12 since i know full well that
> other distros sometimes have no problem.
> 
>   before i try to build, i'll clean e2fsprogs, mplayer and ffmpeg,
> which were the packages causing so much grief lately.  thanks.

I'll push a patch for the mplayer addrinfo stuff later today.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLT2IrMkyGM64RGpERAiA6AJwK6Up4smr4U6JNg844q9lo1LEJagCfR/Nk
mFipSNvFjbcpbI4hYQnYVlE=
=J2G0
-----END PGP SIGNATURE-----



