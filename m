Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Nu3Sp-0001il-17
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 13:44:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id F087F67E399
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 08:40:57 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25125-04 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 23 Mar 2010 08:40:57 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 984E367D774
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 08:40:57 -0400 (EDT)
Date: Tue, 23 Mar 2010 08:40:53 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11003230232y2b556dc3t19813973d7c01b46@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1003230836320.12229@juice.ott.cti.com>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com>
	<ac9c93b11003230232y2b556dc3t19813973d7c01b46@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBVERSIONS
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
X-List-Received-Date: Tue, 23 Mar 2010 12:44:10 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 23 Mar 2010, Frans Meulenbroeks wrote:

> Then again I feel it is in most cases better to move forward. E.g. for
> your nano example: why would people want to build say nano 1.0.2 if
> there is also a working 1.0.6 recipe (or even a 2.2.3 one or whatever
> version it is at). I feel it is better to spent time to
> fix/improve/add/repair the latest version than spend time fixing old
> code.
> (generally speaking that is)

I have a distro I use quite a bit at work, but don't have a lot of time to 
maintain - only a few days a month. I'd like to be able to pull the latest 
.dev from time to time to get kernel updates, xorg, etc. - things that are 
adding new features, support for new hardware, mostly.

Nano is a good example of an application where I'll never, ever want new 
features. :) As long as the version I've pegged keeps building, I'd rather 
not have to think about re-testing the new version, or checking how much 
bigger it got. If the recipe is unsalvageable, fine, kill it and I'll 
spend the couple of hours it takes to re-test - just please don't delete 
recipes only for the sake of tidying.

Mike


