Received: from wp050.webpack.hosteurope.de ([80.237.132.57])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <uwe@hermann-uwe.de>) id 1RCsp7-0001Iy-FF
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Oct 2011 14:49:45 +0200
Received: from dslb-088-064-050-172.pools.arcor-ip.net ([88.64.50.172]
	helo=limejuice); authenticated
	by wp050.webpack.hosteurope.de running ExIM with esmtpa
	id 1RCsTT-0004di-Hs; Sun, 09 Oct 2011 14:27:23 +0200
Date: Sun, 9 Oct 2011 14:26:58 +0200
From: Uwe Hermann <uwe@hermann-uwe.de>
Sender: Uwe Hermann <uwe@hermann-uwe.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111009122658.GA24926@greenwood>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-bounce-key: webpack.hosteurope.de;uwe@hermann-uwe.de;1318164248;aae38944;
Subject: meta-openembedded-contrib and oebuildstats repos cannot be cloned?
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
X-List-Received-Date: Sun, 09 Oct 2011 12:49:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I was grabbing the OE repos today (those listed at
http://git.openembedded.org/), which worked fine except for two of the repos:

$ git clone git://git.openembedded.org/meta-openembedded-contrib
Cloning into meta-openembedded-contrib...
remote: Counting objects: 8117, done.
remote: Compressing objects: 100% (4365/4365), done.
remote: Total 8117 (delta 4236), reused 6962 (delta 3448)
Receiving objects: 100% (8117/8117), 14.36 MiB | 561 KiB/s, done.
Resolving deltas: 100% (4236/4236), done.
warning: remote HEAD refers to nonexistent ref, unable to checkout.

$ git clone git://git.openembedded.org/oebuildstats
Cloning into oebuildstats...
fatal: The remote end hung up unexpectedly


Is this is a known issue, or are the repos abandoned or am I doing
something wrong?


Thanks, Uwe.
-- 
http://hermann-uwe.de     | http://sigrok.org
http://randomprojects.org | http://unmaintained-free-software.org


