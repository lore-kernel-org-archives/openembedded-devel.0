Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <tobias.pflug@gmx.net>) id 1InGWu-0001Mc-Bd
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2007 17:34:56 +0100
Received: (qmail invoked by alias); 31 Oct 2007 16:34:45 -0000
Received: from p549A8931.dip0.t-ipconnect.de (EHLO [192.168.1.100])
	[84.154.137.49]
	by mail.gmx.net (mp046) with SMTP; 31 Oct 2007 17:34:45 +0100
X-Authenticated: #283898
X-Provags-ID: V01U2FsdGVkX1+ZEWwiiM6ZnRdH3kjiVRniH7ircgMCrfWupOjylr
	NXRSB7ozDM4PqX
From: Tobias Pflug <tobias.pflug@gmx.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <A0AACB011FF0474492071F3E72FB188F072045CD@USSYML02.ad.sjm.com>
References: <A0AACB011FF0474492071F3E72FB188F072045CD@USSYML02.ad.sjm.com>
Date: Wed, 31 Oct 2007 17:35:20 +0100
Message-Id: <1193848520.6376.152.camel@toontown>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-Y-GMX-Trusted: 0
Subject: Re: *Very* newbie question: OE and Cygwin?
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
X-List-Received-Date: Wed, 31 Oct 2007 16:34:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


> 
> Should I expect a major headache in this effort?  My IT department is
> 
> very cautious, and they won't certify my (desperately underpowered)
> 
> Linux box for a net connection, so it's a lot easier to use my Windows
> 
> box for development.
> 

Without having ever tried it I'd say you might be in for some major
troubles. Cygwin in general is in my opinion messy anyway, and running
OE under a cygwin environment is not intended. You might end up running
into problems that nobody else has.. and that would certainly be
annoying. 

I think If you want to run linux on some embedded device you really
should have some proper linux based development machine as well. Also
be aware that if your work environment is that picky you might have
problems with the firewall when grabbing sources from various places.
Also you might have to update OE from the monotone repistory sometimes 
when there are important changes.. 

best of luck with your project anyway - the compulab board works fine
I am using one myself at work.

regards,
Tobi



