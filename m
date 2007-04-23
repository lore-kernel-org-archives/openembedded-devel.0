Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zecke@selfish.org>) id 1HftOL-0005iN-6m
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2007 09:55:21 +0200
Received: from rosine144.inf.fu-berlin.de ([160.45.116.144])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1HfskW-000538-7D
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2007 09:14:13 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <c384c5ea0704221239h604dbbaai51833eb1af195a5@mail.gmail.com>
References: <462B14AF.50903@gmail.com> <462B3637.7080604@laposte.net>
	<462B4FB2.5090107@laposte.net>
	<1177248616.5830.13.camel@localhost.localdomain>
	<c384c5ea0704221239h604dbbaai51833eb1af195a5@mail.gmail.com>
Message-Id: <8E0169A7-A704-4489-8F0A-2A7E58A6C9A0@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Mon, 23 Apr 2007 09:14:07 +0200
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.752.3)
Subject: Re: linux-libc-headers build problem for tosa
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Apr 2007 07:55:21 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 22.04.2007 um 21:39 schrieb Leon Woestenberg:

> Same types of issues here with linux-libc-headers.
>
> URL: svn://svn.berlios.de/bitbake/branches/bitbake-1.8
> Revision: 816
>
> When I install pax-utils natively (Ubuntu 7.04 x86_64) the insane  
> class works.

Hi,
purge it, it should get build automatically and we have to find out  
why it wasn't built. So my two questions in this issue are:

	-Which BitBake version do you really use? (python -vvv `which  
bitbake` -p
	-Is your setup in anyway not standard or is it the default angstrom  
build?


please feel free to mail the output to this list, or if too large to  
me privately.

z.




