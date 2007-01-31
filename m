Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HCDtk-00049N-IU
	for openembedded-devel@openembedded.org; Wed, 31 Jan 2007 12:45:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0VBj88n002959
	for <openembedded-devel@openembedded.org>; Wed, 31 Jan 2007 11:45:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02535-07 for <openembedded-devel@openembedded.org>;
	Wed, 31 Jan 2007 11:45:06 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0VBj5WY002952
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 31 Jan 2007 11:45:05 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <74d0deb30701310334q3478a077m4147b2afc7e7dabe@mail.gmail.com>
References: <1170240380.5809.15.camel@localhost.localdomain>
	<20070131112150.GD21515@stygia.hyboria>
	<74d0deb30701310334q3478a077m4147b2afc7e7dabe@mail.gmail.com>
Date: Wed, 31 Jan 2007 11:45:04 +0000
Message-Id: <1170243905.5809.36.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: Xorg Version Numbering
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
X-List-Received-Date: Wed, 31 Jan 2007 11:45:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-01-31 at 12:34 +0100, pHilipp Zabel wrote:
> On 1/31/07, Graeme Gregory <dp@xora.org.uk> wrote:
> > My memory of why X11R7.X ended up in the PV is that at the time bitbake
> > didnt support an epoch in the PV. This was a hack to make sure that xorg
> > 6.X stuff upgraded to 7.X properly.
> >
> > I guess this opens the discussion on bitbake and epochs again.
> >
> > Graeme
> 
> Right, that was the reason.
> I'd absolutely prefer to switch to the individual release versions and
> set an epoch if somebody could add epoch support to bitbake.

Can anyone remember the specifics of the problem with bitbake? I guess
its easy enough to test and find out...

/me adds looking at this to his todo list...
(unless anyone beats me to it ;-)

Cheers,

Richard



