Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NWbep-0002sB-5j
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 21:23:38 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NWbcf-0005GZ-O3 for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 15:21:22 -0500
Date: Sun, 17 Jan 2010 15:20:34 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <009501ca97a2$bd9bc940$38d35bc0$@Willis@Distant-earth.com>
Message-ID: <alpine.LFD.2.00.1001171511300.7174@localhost>
References: <alpine.LFD.2.00.1001171141210.11393@localhost>
	<hivjon$vmv$1@ger.gmane.org>
	<009501ca97a2$bd9bc940$38d35bc0$@Willis@Distant-earth.com>
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
Subject: Re: beagleboard-demo-image, and the evil that is "gnome-games"
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
X-List-Received-Date: Sun, 17 Jan 2010 20:23:38 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 17 Jan 2010, John Willis wrote:

> I personally don't favour taking packages out of an image if there
> are build issues on a small subset of systems. I think Phil (or
> someone else) suggest you consider contributing your build logs to
> OESTATS/TinderBox
> (http://wiki.openembedded.net/index.php/How_do_I_send_automatic_success_and_
> failure_reports) at least with that setup you leave a reference the
> failing logs in bug reports/mails so people can have a look into all
> the gory details :).

  in fact, on friday, i posted to this list that gnome-games was
broken under my environment, and also left a link to the full log file
contents here:

  http://pastebin.com/mcaa647b

so anyone was free to see that.  and so far (unless i'm mistaken), in
the midst of all the feedback, the one thing i haven't read is anyone
saying, "hmmmm, you're right, there seems to be a problem."

  for over a month now, i've reported this, i've described my build
environment in detail, and i've made the contents of the build log
file publicly available.  at this point, i've given up on this package
and removed it from my bb-demo-image build because i just don't care
about it anymore.  if it ever gets fixed, by all means, let me know.
but please stop whining that i just haven't jumped through enough
hoops to suit some people.

rday
--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


