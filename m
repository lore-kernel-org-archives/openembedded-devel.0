Received: from smtp-out21.han.skanova.net ([195.67.226.208])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1PnpyQ-0003PX-U3
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 11:11:35 +0100
Received: from [10.175.196.250] (94.254.124.83) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 4D07517101491595 for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 11:10:26 +0100
Message-ID: <4D550B17.6000607@atmel.com>
Date: Fri, 11 Feb 2011 11:10:31 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; sv-SE;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D51566B.9060603@mentor.com>
	<20110209100249.GG28019@excalibur.local>
In-Reply-To: <20110209100249.GG28019@excalibur.local>
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Fri, 11 Feb 2011 10:11:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Stefan Schmidt skrev 2011-02-09 11:02:
> Hello.
>
> On Tue, 2011-02-08 at 07:42, Tom Rini wrote:
>>
>> As March is fast approaching I want to gather the list of DISTRO /
>> MACHINE / BBPKGS targets that the various distributions would like
>> to see at least compile tested (volunteers for HW testing welcome!).
>
> I will do compile and runtime testing on bug20 (omap3). Targets would be
> console-, minimal- and bug-image-production. The later one includes the complete
> oenjdk-6 stuff with zero as JIT, the osgi recipes and much of the normal X and
> linux stuff.
>

I think that for the AT91 the three most important targets are:

AT91SAM9M10EKES
AT91SAM9G20EK
AT91SAM9263EK

I noted that when I added the gpe-mini-browser2
to my image, the boot fails.


BR
Ulf Samuelsson

> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



