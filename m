Received: from [194.158.229.31] (helo=smtp-be-01.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1Lp2AP-0002P5-E3
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 17:15:53 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-01.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	n31FDVZr027602; Wed, 1 Apr 2009 17:13:32 +0200
Message-ID: <49D384F8.7050005@vollmann.ch>
Date: Wed, 01 Apr 2009 17:15:04 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <SNT105-W5667C19202F0CB199F6AF6908A0@phx.gbl>	<49D28F41.1050005@gmx.net>	<SNT105-W34EB74514DEB1FDC22CF26908B0@phx.gbl>	<49D367D1.1050302@gmx.net>
	<b84dee3a0904010622r494b4f5bk262597848a5a43a8@mail.gmail.com>
	<SNT105-W71B7EC3C1B61B33DCA96E8908B0@phx.gbl>
In-Reply-To: <SNT105-W71B7EC3C1B61B33DCA96E8908B0@phx.gbl>
X-SA-Exim-Connect-IP: 194.158.229.31
X-SA-Exim-Mail-From: dv@vollmann.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Does your own system matter
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
X-List-Received-Date: Wed, 01 Apr 2009 15:15:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Mauri Sandberg wrote:
>> Date: Wed, 1 Apr 2009 15:22:49 +0200
>> From: methril@gmail.com
> 
>> Ubuntu 8.10 (amd64) is not working properly.
> 
> Do you mean 32 or 64bit Ubuntu? That is, I have 32-bit ubuntu running on amd64.
Just a note: I routinely run OE inside a chroot environment,
and sometimes a 32-bit chroot on a 64-bit kernel.
Of course this works only with the correct personality (setarch).

   Detlef



