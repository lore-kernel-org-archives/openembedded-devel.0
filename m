Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Hiy65-0005j3-73
	for openembedded-devel@openembedded.org; Tue, 01 May 2007 21:33:13 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Hixx0-0008LB-RG
	for openembedded-devel@openembedded.org; Tue, 01 May 2007 21:23:50 +0200
Received: from c-134-177-35.d.dsl.de.ignite.net ([62.134.177.35])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 01 May 2007 21:23:50 +0200
Received: from no2spam by c-134-177-35.d.dsl.de.ignite.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 01 May 2007 21:23:50 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 01 May 2007 21:23:42 +0200
Message-ID: <f1843v$doc$1@sea.gmane.org>
References: <E1HgoSJ-0008AG-St@linuxtogo.org>	<462FBE16.9070805@dominion.kabel.utwente.nl>	<46362F71.7080604@dominion.kabel.utwente.nl>
	<432beae0705011113v61831859x7978062963a48b8@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: c-134-177-35.d.dsl.de.ignite.net
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
In-Reply-To: <432beae0705011113v61831859x7978062963a48b8@mail.gmail.com>
Sender: news <news@sea.gmane.org>
Subject: Re: [oe-commits] org.oe.dev xtscal: attempt to fix miscalibrations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2007 19:33:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Justin Patrin wrote:
> I was just about to test this when my boot into a new image failed
> with a missing libgcc. This RPATH issue needs to be fixed ASAP.

OK, you got the job ;-)

Serious now, from what I read in bug 2093 I doubt the miscalibration 
issue is fixed yet.



