Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1PxHls-00028f-FW
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 12:41:40 +0100
Received: (qmail 41 invoked from network); 9 Mar 2011 12:40:03 +0100
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 9 Mar 2011 12:40:03 +0100
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id 5XxwaVDIzgLb
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2011 12:40:00 +0100 (CET)
Received: (Qmail 29993 invoked from network); 9 Mar 2011 12:40:00 +0100
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 9 Mar 2011 11:40:00 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.72 #1
	(Debian)) id 1PxHkF-0006Ib-V3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2011 12:40:00 +0100
Date: Wed, 9 Mar 2011 12:39:59 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110309113959.GA22507@mi.fu-berlin.de>
References: <4D773276.1040907@nedap.com>
	<AANLkTinccRRrmRgcLkf0=cP_eA4Grm2HyyWrDPbT-CFw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinccRRrmRgcLkf0=cP_eA4Grm2HyyWrDPbT-CFw@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: release-2011.3
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
X-List-Received-Date: Wed, 09 Mar 2011 11:41:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 09, 2011 at 09:44:42AM +0100, Leon Woestenberg wrote:
> Hello Jaap,
> 
> On Wed, Mar 9, 2011 at 8:55 AM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> > If I use DISTRO=angstrom-2010.x and start a complete new fresh build, I get
> >
> Seems like a different bitbake must be used. You better start from the
> Angstrom web site Getting Started notes as that's the only place where
> this is up-to-date.
> 
> There are different requirements to all the different releases. Also
> note the heads up for the newest Angstrom to use the oe-core approach.

and please use uclibc-git, they other versions dont have nptl support.

Bye Henning


