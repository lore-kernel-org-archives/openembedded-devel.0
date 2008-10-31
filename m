Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1Kvtht-0006rI-V6
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Oct 2008 14:06:30 +0100
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id C5F1E240A0; Fri, 31 Oct 2008 23:38:02 +1100 (EST)
Date: Fri, 31 Oct 2008 23:35:57 +1100
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20081031233557.abe7e561.raster@rasterman.com>
In-Reply-To: <20081031091304.GA6818@jama>
References: <20081031013837.F2AD4189330@amethyst.openembedded.net>
	<200810310749.55874.openembedded@haerwu.biz>
	<20081031091304.GA6818@jama>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.4.8 (GTK+ 2.12.9; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Subject: Re: [oe-commits] Carsten Haitzler (Raster) : qemu: seems the move to the svn rev of qemu broke as there are compiler bugs
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
X-List-Received-Date: Fri, 31 Oct 2008 13:06:30 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Oct 2008 10:13:04 +0100 Martin Jansa <Martin.Jansa@mk.cvut.cz>
babbled:

> On Fri, Oct 31, 2008 at 07:49:53AM +0100, Marcin Juszkiewicz wrote:
> > Can you send me error output? I built that qemu version on Ubuntu 8.04 
> > many times.
> > 
> > Regards, 
> 
> Same problem here. Gentoo ~amd64
> 
> error output:
> http://rafb.net/p/xJyljp35.html

totally different bug here - mine's a deep compiler unhappiness with asm.
you're is more straightforward :)

-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



