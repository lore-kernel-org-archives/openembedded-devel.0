Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1HqHQT-0006oV-81
	for openembedded-devel@openembedded.org; Tue, 22 May 2007 01:36:29 +0200
Received: from [80.131.157.211] (helo=[192.168.178.29])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nils.faerber@kernelconcepts.de>)
	id 1HqHPL-0005fB-NU; Tue, 22 May 2007 01:35:19 +0200
Message-ID: <46522CA3.1010000@kernelconcepts.de>
Date: Tue, 22 May 2007 01:34:59 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.10 (X11/20070403)
MIME-Version: 1.0
To: Richard Purdie <rpurdie@rpsys.net>
References: <465225B7.50900@kernelconcepts.de>
	<1179789619.5849.59.camel@localhost.localdomain>
In-Reply-To: <1179789619.5849.59.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.2.0
Cc: openembedded-devel@openembedded.org
Subject: Re: Problem wt. perl-native building for PXA
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
X-List-Received-Date: Mon, 21 May 2007 23:36:34 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Richard Purdie schrieb:
> Hi,
Hi!

> On Tue, 2007-05-22 at 01:05 +0200, Nils Faerber wrote:
>> I am encountering a strange problem while trying to build Angstrom for
>> PXA (for LinuxTag demo purposes). While we have some other machines
>> building it with the same version of OE and Bitbake just fine it fails
>> on my notebook (but I would like to be able to rebuild it directly at
>> LinuxTag, thus the question).
>> My machine has Ubuntu feisty installed. I am using Bitbake 1.8 from SVN
>> and an OE checkout from today.
>>
>> What happens is that the build works quite well until it comes to
>> perl-native-5.8.8-r7. There it fails with the following error:
> 
> I'm not familiar with the error but what does /bin/sh point at?
> 
> If its dash, try bash as dash causes no end of headaches.

Is tihs Ubuntu?
I did never recognise this, but you are perfectly right with your
assumption, sh -> dash.

Gee, hey look, now it works!!!
This dash thing should be tarred and feathered ;)

Many thanks!

> Cheers,
> Richard
Cheers
  nils faerber

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Sieghuetter Hauptweg 48  Fax: +49-271-771091-19
D-57072 Siegen           Mob: +49-176-21024535
--


