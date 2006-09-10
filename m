Received: from [213.39.232.198] (helo=moskovskaya.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <di@mail.fh-wedel.de>) id 1GML8q-000656-1r
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Sep 2006 10:58:16 +0200
Received: from di by moskovskaya.fh-wedel.de with local (Exim 4.50)
	id 1GML5i-0003XA-Fi; Sun, 10 Sep 2006 10:55:02 +0200
Date: Sun, 10 Sep 2006 10:55:02 +0200
From: Martin Dietze <di@fh-wedel.de>
To: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
Message-ID: <20060910085502.GH17558@fh-wedel.de>
References: <E1GLfnq-00056C-UM@linuxtogo.org>
	<20060909044327.GA10580@twibble.org>
	<1157808636.32698.3.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
In-Reply-To: <1157808636.32698.3.camel@gandalf.tm.informatik.uni-frankfurt.de>
X-PGP-Fingerprint: C98D 598A DA73 DF9F 610D  632E 4468 B911 BF9B 8D95
X-PGP-Key-ID: 0xBF9B8D95
User-Agent: Mutt/1.5.9i
Sender: Martin Dietze <di@mail.fh-wedel.de>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: di@mail.fh-wedel.de
X-Mailman-Approved-At: Sun, 10 Sep 2006 11:02:52 +0200
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] PCRE breakage [libpcre: added new port]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Sep 2006 08:58:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, September 09, 2006, Michael 'Mickey' Lauer wrote:

> > You added libpcre and removed pcre and in the process you've also:
> > 
> >  - Broken 20+ recipes which DEPEND on pcre. These would all need to
> >    be modified to depend on libpcre now instead.

Something made me think there was no such package (pcre). Seems 
like I need to reduce my number of working hours :/ 
Will fix this as first thing on Monday.

Sorry,

Martin

-- 
-------------- Martin Dietze --------------- / -- 4G Systeme GmbH Hamburg ---
-- martin@the-little-red-haired-girl.org -- / ---- dietze@4g-systems.com ----
------------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Old programmers don't die; they just branch to a new address.


