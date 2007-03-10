Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HQ3EO-0001GO-Gs
	for openembedded-devel@openembedded.org; Sat, 10 Mar 2007 16:11:36 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HQ3ED-0003U2-6Q
	for openembedded-devel@openembedded.org; Sat, 10 Mar 2007 16:11:25 +0100
Received: from f73a6.f.ppp-pool.de ([195.4.115.166])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 10 Mar 2007 16:11:25 +0100
Received: from no2spam by f73a6.f.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 10 Mar 2007 16:11:25 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 10 Mar 2007 16:11:04 +0100
Message-ID: <esuhqb$4dg$1@sea.gmane.org>
References: <E1HMatS-0005Qf-5q@linuxtogo.org>	<45E6903F.6040708@dominion.kabel.utwente.nl>
	<esudt6$p1p$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: f73a6.f.ppp-pool.de
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
In-Reply-To: <esudt6$p1p$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk.bbclass: Implements a sensational new feature called 'oe-feed' which, for the first time ever, actually lets you use your ipk deploy dir as a feed in ipkg.conf./mtcommit ../classes/rootfs_ipk.bbclass Oh wait......we already could do that in the past, now couldn't we?? Set DEPLOY_ENABLE_OEFEED=1 in your shell env or local.conf to activate fast oe-feed/Packages creation, set DEPLOY_ENABLE_OEFEED=2 to enable traditional (and slooooow) oe-feed/Packages creation.
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
X-List-Received-Date: Sat, 10 Mar 2007 15:11:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:

>> OEs feed management tools were removed a few years ago since it was decided that feed
>> management was out of scope. That still holds.
> 
> Where is a good place this useful software should be shared instead?

Please disregard.  I am catching up with the discussions I missed over 
the last few days.



