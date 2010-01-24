Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NZ6RO-0002Vh-SE
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 18:40:07 +0100
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NZ6PA-00030A-1k for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 12:37:44 -0500
Date: Sun, 24 Jan 2010 12:36:38 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1F9F6029-E5F8-4B85-967C-7FB2C110CFCE@mac.com>
Message-ID: <alpine.LFD.2.00.1001241235020.2367@localhost>
References: <687C35F4-E7DC-4898-907F-8C1CE8890887@mac.com>
	<9210BA9D-8420-46C3-BDD6-CEE4E853B42F@mac.com>
	<20100124154357.GG15943@jama>
	<1F9F6029-E5F8-4B85-967C-7FB2C110CFCE@mac.com>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Build failure module-init-tools-cross_3.2.2.bb on Fedora 12 x86_64
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
X-List-Received-Date: Sun, 24 Jan 2010 17:40:09 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 24 Jan 2010, Elvis Dowson wrote:

> Hi Martin,
>                     Yes, just found that solution. I'm installing
> glibc-static right now.
>
> http://old.nabble.com/Error-Compiling-Gumstix-Image-On-Fedora-12-x86_64-td26776355.html#a26776355
>
> Anyway, I'm updating my setup notes for Fedora 12 x86 64-bit, so it
> will help others doing this.

  once upon a time, i wrote much the same:

http://www.crashcourse.ca/wiki/index.php/Angstrom

perhaps we should exchange notes to come up with a single complete
set.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


