Received: from [208.84.147.47] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hacker@klever.net>) id 1KncKn-0006uz-37
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 18:56:25 +0200
Received: from pd953ac58.dip0.t-ipconnect.de ([217.83.172.88] ident=hacker)
	by rhodos.klever.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hacker@klever.net>) id 1KncGH-00035Q-RQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 18:51:46 +0200
Message-ID: <48ECE511.3030006@klever.net>
Date: Wed, 08 Oct 2008 18:51:29 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200810080751.15817.zecke@selfish.org>	<200810081303.35934.zecke@selfish.org>
	<gci4to$pcf$1@ger.gmane.org> <200810081757.57676.zecke@selfish.org>
In-Reply-To: <200810081757.57676.zecke@selfish.org>
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Wed, 08 Oct 2008 16:56:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> On Wednesday 08 October 2008 13:18:16 Koen Kooi wrote:
> 
>> The old wiki had one, dunno if the new wiki overlords decided to move it
>> to the new wiki. Ask them.
> 
> http://wiki.openembedded.net/index.php/GitPhraseBook
> 
> is this any good?

IMO, more than a hacker may be asked for ;-)

A few notes, though - you only mention `git clone git:`, not sure where 
would push remotes come from for subsequent push commands.

How about adding `git config`s instead of --color and stuff? Of course, 
it's fine to leave it for user's exercise ;-)

Love,
H

> 
> z.
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


