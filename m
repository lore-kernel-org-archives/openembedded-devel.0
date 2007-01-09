Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H4DWF-0000kd-DV
	for openembedded-devel@openembedded.org; Tue, 09 Jan 2007 10:43:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l099g4RL032600
	for <openembedded-devel@openembedded.org>; Tue, 9 Jan 2007 09:42:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32188-06 for <openembedded-devel@openembedded.org>;
	Tue,  9 Jan 2007 09:42:02 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l099g01O032592
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 9 Jan 2007 09:42:01 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <432beae0701081353t4de8b66fh7d7d9b46971cb3b@mail.gmail.com>
References: <20061230051641.GA30225@hezmatt.org>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
	<1662139633.20070107231632@gmail.com>
	<20070107220333.GC6625@hezmatt.org>
	<432beae0701071446p377665c8x810644467cf7f234@mail.gmail.com>
	<1168280937.4526.32.camel@ip6-localhost>
	<432beae0701081111n490d67e2oebcaf44f4fe45e04@mail.gmail.com>
	<1168290172.4526.66.camel@ip6-localhost>
	<45A2B3EA.2070502@dominion.kabel.utwente.nl>
	<432beae0701081353t4de8b66fh7d7d9b46971cb3b@mail.gmail.com>
Date: Tue, 09 Jan 2007 09:42:05 +0000
Message-Id: <1168335725.6634.2.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: A question of workflow
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
X-List-Received-Date: Tue, 09 Jan 2007 09:43:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-01-08 at 13:53 -0800, Justin Patrin wrote:
> On 1/8/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> > Patrick Ohly schreef:
> > So after every first commmit the tree is in a broken state, where-as if a developers
> > applied a fixed patch in one go it wouldn't be. Sounds like your concept is badly broken.
> 
> Apply, commit (note brokenness if needed in commit message), then fix
> it, commit, and push. Don't push before fixing.

The argument against this in other projects like the kernel is that you
just broke the git-bisect method of debugging...

I'm not a fan of broken patches being committed...

Richard




