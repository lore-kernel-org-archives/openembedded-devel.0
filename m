Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jin@mediatomb.cc>) id 1JloBz-0001ua-7q
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Apr 2008 18:39:35 +0200
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id BAB45838FA; Tue, 15 Apr 2008 18:39:31 +0200 (CEST)
Date: Tue, 15 Apr 2008 18:39:30 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080415163930.GA14446@deadlock.dhs.org>
References: <20080415122902.GA13726@deadlock.dhs.org>
	<4804D346.50809@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4804D346.50809@gmail.com>
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: Re: How to properly enforce an ARM OABI build?
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
X-List-Received-Date: Tue, 15 Apr 2008 16:39:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 15, 2008 at 09:09:42AM -0700, Khem Raj wrote:
> > MACHINE="armv4t"
> > DISTRO="angstrom-2007.1"
> > TARGET_OS :="linux"
> > ARM_ABI := "oabi"
> 
> may be use '=' instead of ':='
 
I did try that before trying := but there was no difference...




