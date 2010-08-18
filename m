Received: from exprod5og104.obsmtp.com ([64.18.0.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1OleoL-0003iM-QH
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 11:19:56 +0200
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob104.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTGulouwBGhbb9NCIPs/HLfvOR0hp5TxJ@postini.com;
	Wed, 18 Aug 2010 02:19:36 PDT
Received: from unknown (HELO alpmlef06.e2k.ad.ge.com) ([3.159.18.15])
	by Cinmlip08.e2k.ad.ge.com with ESMTP; 18 Aug 2010 04:32:45 -0400
Received: from [3.138.54.214] ([3.138.54.214]) by alpmlef06.e2k.ad.ge.com with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 18 Aug 2010 04:32:44 -0400
Message-ID: <4C6B9A31.9000706@ge.com>
Date: Wed, 18 Aug 2010 09:30:41 +0100
From: Martyn Welch <martyn.welch@ge.com>
Organization: GE Intelligent Platforms
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>	<AANLkTim_u5O3bLgdLiwE4fPCnbjRoUY1+Pad9iB8qXPW@mail.gmail.com>	<4C68B2C5.5030908@mlbassoc.com>
	<AANLkTinLbKUPNo=59RUUoznY7tYBh4LCacFeAgUEQ-6k@mail.gmail.com>
In-Reply-To: <AANLkTinLbKUPNo=59RUUoznY7tYBh4LCacFeAgUEQ-6k@mail.gmail.com>
X-OriginalArrivalTime: 18 Aug 2010 08:32:44.0343 (UTC)
	FILETIME=[EE00F470:01CB3EAF]
X-SA-Exim-Connect-IP: 64.18.0.178
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: What to do about the poor bitbake Quality Control?
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
X-List-Received-Date: Wed, 18 Aug 2010 09:19:56 -0000
X-List-Received-Date: Wed, 18 Aug 2010 09:19:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/08/10 16:02, Cliff Brake wrote:
> I think it would be very useful to have a "stable" branch that is only
> synchronised with dev when X number of targets build from a clean
> build.  It seems like this would be high value, with little effort.
> Of course there will be corner things that break, but at least a new
> beagleboard user can check out something and have reasonable
> confidence that it will build images.
>
> Does anyone have suggestions for the branch name and a reasonable
> subset of machines and build targets?  Perhaps someone is already
> running these clean builds?  At one point we had a machine at OSUOSL
> dedicated to this purpose, but no one ever set it up.
>

So something like Debian's stable, testing and unstable[1]?

Martyn

[1] http://www.debian.org/releases/


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, 
Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


