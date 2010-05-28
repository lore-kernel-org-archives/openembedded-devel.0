Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OHwGc-00063L-3h for openembedded-devel@lists.openembedded.org;
	Fri, 28 May 2010 11:54:15 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OHwCZ-0002OU-9F for openembedded-devel@lists.openembedded.org;
	Fri, 28 May 2010 11:50:03 +0200
Received: from 41-133-12-40.dsl.mweb.co.za ([41.133.12.40])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 May 2010 11:50:03 +0200
Received: from gideon by 41-133-12-40.dsl.mweb.co.za with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 May 2010 11:50:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: gideon <gideon@dcomt.com>
Date: Fri, 28 May 2010 09:40:39 +0000 (UTC)
Message-ID: <loom.20100528T112202-923@post.gmane.org>
References: <4BFE5402.8030607@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 41.133.12.40 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.5) Gecko/20091109 Ubuntu/9.10 (karmic) Firefox/3.5.5)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problems building Angstrom images
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
X-List-Received-Date: Fri, 28 May 2010 09:54:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Hi, I get exactly the same error. but building something different



> To be clear, I'm building
>    MACHINE="beagleboard"
>    DISTRO="angstrom-2008.1"
> 


MACHINE=x86
DISTRO=angstrom-2008.1



> I got these errors when I tried to build:
>    beagleboard-linuxtag2010-demo-image
>    angstrom-gnome-image
> 
for me its 
 angstrom-x-image

had success with console image and base-image

but it seems like problem with gnome, 
so probably all images building with that
will fail.


> I have success with
>    beagleboard-demo-image
> 
> Any ideas how to fix this?
> 
> Thanks
> 
> n.b. yes, this is a cross post from the Angstrom list, but my
> query sat there for a day with no reply and I'm hoping for some
> help from the larger OE crew
> 

You got any help with this yet Gary? 
I just replied here as it was the only
similar error i could find

thank you!
regards





