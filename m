Received: from [76.96.53.9] (helo=qmta02.westchester.pa.hmc1.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@soundmetrics.com>) id 1Mad6A-0001Ac-Nf
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 00:12:10 +0200
Received: from omta02.westchester.pa.hmc1.comcast.net ([76.96.53.7])
	by qmta02.westchester.pa.hmc1.comcast.net with comcast
	id Sj721c00D09Ku2s09lvvqT; Mon, 10 Aug 2009 21:55:55 +0000
Received: from [192.168.10.129] ([75.147.191.205])
	by omta02.westchester.pa.hmc1.comcast.net with bizsmtp
	id Slvv1c0014SLwm307lvvnp; Mon, 10 Aug 2009 21:55:55 +0000
Message-ID: <4A80976B.6020108@soundmetrics.com>
Date: Mon, 10 Aug 2009 14:55:55 -0700
From: John Faith <john@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.15
	(Ubuntu-1.1.15+nobinonly-0ubuntu0.8.04.2)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20090810205124.GA15812@gmail.com>
In-Reply-To: <20090810205124.GA15812@gmail.com>
Subject: Re: Missing OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin during libgles-omap3_3.00.00.08.bb
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
X-List-Received-Date: Mon, 10 Aug 2009 22:12:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> ...
> It seems like this file
> /home/kraj/work/oe/openembedded/recipes/powervr-drivers/libgles-omap3/OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin
> is missing in my case.
>
> Where should it come from
>
> Thx
>
> -Khem
> ...

Hi,

The Graphics SDK installer must be downloaded from Ti and manually put 
in place before building libgles:
http://code.google.com/p/beagleboard/wiki/HowtoUseSGXunderAngstrom

,
John




