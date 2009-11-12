Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1N8iz6-0006ze-St
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 00:21:51 +0100
Received: by ey-out-1920.google.com with SMTP id 26so632249eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 15:20:31 -0800 (PST)
Received: by 10.213.103.144 with SMTP id k16mr2763630ebo.66.1258064237231;
	Thu, 12 Nov 2009 14:17:17 -0800 (PST)
Received: from xora.vm.bytemark.co.uk (www.xora.org.uk [80.68.91.202])
	by mx.google.com with ESMTPS id 24sm184038eyx.13.2009.11.12.14.17.16
	(version=SSLv3 cipher=RC4-MD5); Thu, 12 Nov 2009 14:17:16 -0800 (PST)
Date: Thu, 12 Nov 2009 22:17:14 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091112221714.GC17185@xora.vm.bytemark.co.uk>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<200911120656.41249.holger+oe@freyther.de>
	<200911120722.09166.holger+oe@freyther.de>
	<alpine.LFD.2.00.0911120125380.1977@localhost>
	<ac9c93b10911120015j5b8cbc07j30f57f2dc68987ca@mail.gmail.com>
	<alpine.LFD.2.00.0911120727540.7268@localhost>
	<ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
	<4AFC58B0.3080000@mwester.net>
	<1258062144.13299.1.camel@gnutoo-desktop>
	<4AFC854D.8040302@balister.org>
MIME-Version: 1.0
In-Reply-To: <4AFC854D.8040302@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.78.145
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 23:21:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2009 at 04:59:41PM -0500, Philip Balister wrote:
> On 11/12/2009 04:42 PM, GNUtoo wrote:
> >>Is it practical?  I think the answer is no.  In my experience, tools
> >>like selinux have a tendency to require inordinate amounts of
> >>administrative burden that just isn't practical in a development
> >>environment.  I think requiring that selinux be disabled on build
> >>hosts
> >>is a reasonable requirement, and will avoid wasting a lot of cycles
> >>that
> >>should be spent on OE, and not on administration (or sending lots of
> >>emails).
> >What about supporting only the unconfined user selinux
> >type(unconfined_u),in targeted mode?
> 
> I'm running default Selinux on F11, I don't think we can just say OE
> must have SELinux turned off.
> 
And the SELinux problem doesnt seem to trip up my SELinux F11.

Graeme



