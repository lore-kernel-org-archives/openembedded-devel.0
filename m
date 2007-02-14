Received: from [195.121.247.12] (helo=psmtp03.wxs.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gerwin@vanderkruis.net>) id 1HHTNp-0005HX-1M
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Feb 2007 00:17:53 +0100
Received: from [10.0.0.152] (ip5457b30e.direct-adsl.nl [84.87.179.14])
	by psmtp03.wxs.nl
	(iPlanet Messaging Server 5.2 HotFix 2.15 (built Nov 14 2006))
	with ESMTP id <0JDH00BGC7D0EH@psmtp03.wxs.nl> for
	openembedded-devel@lists.openembedded.org; Thu,
	15 Feb 2007 00:17:26 +0100 (MET)
Date: Thu, 15 Feb 2007 00:17:17 +0100
From: gerwin van der kruis <gerwin@vanderkruis.net>
In-reply-to: <6385CB83-3092-471F-B579-BDD8A2A65133@netgate.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <1171495037.11033.19.camel@localhost.localdomain>
MIME-version: 1.0
X-Mailer: Evolution 2.8.3 (2.8.3-1.fc6)
References: <1171051575.3886.12.camel@localhost.localdomain>
	<200702141311.17165.openembedded@hrw.one.pl>
	<1171489223.1692.501.camel@localhost.localdomain>
	<1171489873.11033.7.camel@localhost.localdomain>
	<45D38BB9.5070709@am.sony.com>
	<96763D62-00DF-440D-8688-E237E1CE0BB8@netgate.com>
	<45D38F2C.1030700@dominion.kabel.utwente.nl>
	<6385CB83-3092-471F-B579-BDD8A2A65133@netgate.com>
Subject: Re: OE Booth during fosdem
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
X-List-Received-Date: Wed, 14 Feb 2007 23:17:53 -0000
Content-type: text/plain
Content-transfer-encoding: 7BIT

Op woensdag 14-02-2007 om 12:53 uur [tijdzone -1000], schreef Jim
Thompson:
 
> And I'm willing to throw cash, hardware and time at this.
> 
> Yes, we sell WRAP boards, but I'm not looking to get a bunch-o-free  
> development out of the process.  (We sell a Gateworks ixp42x board  
> too, just to be perfectly honest.)
> 
> Years ago, I ran (and owned) 'musenki' (google for it or look here:  
> http://he-colo.netgate.com/~jim/Musenki/.  We had build a  set of  
> Motorola 8245/8241 boards, and I'd made linux run on them.  I  
> remember spending a horrific amount of time with a (very) early  
> version of "buildroot".  OE is so much more sophisticated that I'm a  
> bit taken aback.
> 
> The OE learning curve is still quite steep, but I think it would be  
> less steep with a) a bit more documentation and b) an EZ way to start  
> creating "little distros" that
> run on PCs using it.

I remember we had this discussion before , the problem is the
bootloader, for example grub requires some extra handlings to get 
installed probarly. 

I also experimented a bit with disk on modules which were much 
faster than the compact flash and much cheaper as well. 

I think if you write a script which automate the installation of for
example grub and than copies automatically the files over to cf you are
finished , I did it once long time ago for an embedded voip pabx. 

As Koen said I am working on x86 projects like wifi-radio (with a
mini-itx board and some small additions) a set top box and a thin
client.So we are working on it !!

I will have a look if I still can find the software I made that time 
for putting the image directly on the flash (I wrote it to produce some
goods)

Regards, 

Gerwin 
 





