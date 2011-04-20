Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1QCYdq-0000xA-G3
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 16:44:35 +0200
Received: (qmail 3242 invoked from network); 20 Apr 2011 16:42:08 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 20 Apr 2011 16:42:08 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id kF9K-IgMhcyd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 16:41:56 +0200 (CEST)
Received: (Qmail 3154 invoked from network); 20 Apr 2011 16:41:56 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 20 Apr 2011 14:41:56 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.72 #1
	(Debian)) id 1QCYbM-0007KX-69
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 16:41:56 +0200
Date: Wed, 20 Apr 2011 16:41:56 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110420144155.GA27071@mi.fu-berlin.de>
References: <20110419093343.GB2989@rhein.zuhause.netz>
	<201104201534.51856.pgsellmann@portner-elektronik.at>
	<1303307478.3979.60.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1303307478.3979.60.camel@mattotaupa>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: orc 0.4.13 is out
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
X-List-Received-Date: Wed, 20 Apr 2011 14:44:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 20, 2011 at 03:51:18PM +0200, Paul Menzel wrote:
> Dear Henning, dear Peter,
> 
> 
> Am Mittwoch, den 20.04.2011, 15:34 +0200 schrieb Peter Gsellmann:
> > Am Dienstag 19 April 2011, 11:33:44 schrieb Henning Heinold:
> 
> > > hm first email got to wrong mailinglist.
> > > 
> > > So here its again:
> > > 
> > > Hi,
> > > 
> > > As of today orc 0.4.13 is out with the bugs fixed we hit.
> > > So someone(maybee Paul) can make a new recipe.
> 
> I am sorry for the inconvenience. You were too fast. Thank you for
> packaging it in f3dcc065 [1]. Unfortunately I did not get the
> announcement from the GStreamer list. Freedesktop lists and GMX seem to
> have delivery problems (since forever).
> 
> > Sorry, but this version breaks recipe schroedinger-1.0.9 for my build.

Hi,

I will fix schroedinger this evening. Problem is, it dont regenrate some
files with the orcc installed.

Bye Henning


