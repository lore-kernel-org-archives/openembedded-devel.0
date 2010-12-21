Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PV7Gr-0006UM-2P
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 19:49:13 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PV7Gj-0002al-3C from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 10:49:05 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 21 Dec 2010 10:49:02 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 21 Dec 2010 11:49:02 -0700
Message-ID: <4D10F69B.8080604@mentor.com>
Date: Tue, 21 Dec 2010 11:48:59 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ienu66$5gf$1@dough.gmane.org>
	<AANLkTimSZHSb23N1opQc=zQ4cNgsEzA_jaO_rn0=pV3o@mail.gmail.com>
In-Reply-To: <AANLkTimSZHSb23N1opQc=zQ4cNgsEzA_jaO_rn0=pV3o@mail.gmail.com>
X-OriginalArrivalTime: 21 Dec 2010 18:49:02.0256 (UTC)
	FILETIME=[BC317300:01CBA13F]
Subject: Re: [RFC] meta-openembedded layer for yocto hosted on oe.org
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
X-List-Received-Date: Tue, 21 Dec 2010 18:49:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2010 02:45 AM, Khem Raj wrote:
> On Mon, Dec 20, 2010 at 7:53 AM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> I've locally split
>> http://gitorious.org/angstrom/angstrom-layers/commits/master into 3
>> seperate git repos with git-filter-branch. I would like to move the
>> meta-openembedded layer to the OE git server to make it easier for
>> others to help in cleaning it up and getting more use to layers. The
>> beagle and angstrom layers could move there as well, but those will need
>> a more restricted set of committers.
>>
>> In essence I would like this to be the "official" OE layer for yocto
>> while the board is dealing with the yocto negotiations.
>>
>
> yes this is something what we should do. We need to setup gitolite on
> the git server

Can I just put in my 2 cents for some github love?  Chris got me started 
using it and I'm quite happy.  It'd also be less admin work and since I 
forked Chris' tree, my space usage is still practically nil (I'm not 
sure about his), so the free accounts are fine.

-- 
Tom Rini
Mentor Graphics Corporation


