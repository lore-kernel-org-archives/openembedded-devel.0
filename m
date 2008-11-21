Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1L3YgV-00051s-U6
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Nov 2008 17:16:43 +0100
Received: by nf-out-0910.google.com with SMTP id d21so517776nfb.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2008 08:14:06 -0800 (PST)
Received: by 10.210.104.20 with SMTP id b20mr691704ebc.93.1227284045860;
	Fri, 21 Nov 2008 08:14:05 -0800 (PST)
Received: from ?192.168.1.10? ([78.86.128.56])
	by mx.google.com with ESMTPS id 32sm543989nfu.10.2008.11.21.08.14.04
	(version=SSLv3 cipher=RC4-MD5); Fri, 21 Nov 2008 08:14:05 -0800 (PST)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gg6km4$c2d$1@ger.gmane.org>
References: <gg6aes$5vf$1@ger.gmane.org> <4926D1D1.6030204@dresearch.de>
	<gg6km4$c2d$1@ger.gmane.org>
Date: Fri, 21 Nov 2008 16:14:03 +0000
Message-Id: <1227284043.6981.3.camel@aquilonia>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1 
Subject: Re: Revert "busybox: Disable busybox shadow support for Angstrom"
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
X-List-Received-Date: Fri, 21 Nov 2008 16:16:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


> > 2. install /etc/shadow and fully support it (i believe ther is something more to do here)
> 
> 2) is what is wanted for the angstrom 2008 release.
> 
> regards,
> 

Yes it seems the devices we are using Angstrom on now are becoming more
like laptops every day. So we should be following security procedures
for big machines much more.

I mean the latest set of omap3 devices are quite defineately eeePC
competitors.

Graeme




