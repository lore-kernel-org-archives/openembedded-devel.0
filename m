Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1LfgkO-0000RA-Cv
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 21:34:20 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 6 Mar 2009 21:29:53 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 6 Mar 2009 21:29:46 +0100
Received: from [192.168.1.107] ([79.54.131.222]) by FBCMCL01B06.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 6 Mar 2009 21:29:46 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200903062024.13519.marcin@juszkiewicz.com.pl>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF686@hiob.intern.dresearch.de>
	<a7f8874a0903020942y65f55a90rec06b1bc87ac8702@mail.gmail.com>
	<432beae0903061047p33bb6052o28e3d9b73847f1bd@mail.gmail.com>
	<200903062024.13519.marcin@juszkiewicz.com.pl>
Date: Fri, 06 Mar 2009 21:28:47 +0100
Message-Id: <1236371327.8818.5.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 06 Mar 2009 20:29:46.0519 (UTC)
	FILETIME=[4A488A70:01C99E9A]
Subject: Re: Ugly build problem with emacs/qemu
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
X-List-Received-Date: Fri, 06 Mar 2009 20:34:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-03-06 at 20:24 +0100, Marcin Juszkiewicz wrote:
> On Friday 06 of March 2009 19:47:58 Justin Patrin wrote:
> > > I don't kow about openSuse, but I remember that Fedora used to have
> > >  some kernel patches that did not play well with QEMU. But that was
> > >  back on Ferora 7, since then I switched to ubuntu. I don't even
> > >  rmember exactly what patch caused the problems, but IIRC it was
> > >  security related.
> >
> > Hmmm, good point it could be SELinux. Could you try disabling that,
> > if you have it enabled?
> 
> It is not SELinux but one kernel patch - linux-2.6-execshield.patch to 
> be exact. Rebuild Fedora kernel without that one or use vanilla one.
> 
> Took me lot of kernel rebuilds to find that out.
> 
> Regards, 
ah ok I do not have that because I run a stock vanilla kernel.
Denis.




