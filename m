Received: from [208.84.147.47] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hacker@klever.net>) id 1KuQZM-0007v5-6P
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 12:47:36 +0100
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=rhodos; d=klever.net;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=ZRI7Xv8W8nT5p97eRgDrsBNNISxvfhtzExEq4VnY+fPYbXaPVqgWD5Hh2d4AlvecXOwyTMWRa0Sp2rpFL4Wrx6/BiQPuVDiMEQmgWecEfGsOdh7JAC4YQQO4K04hr0r8;
Received: from [85.183.207.43] (helo=[192.168.150.156])
	by rhodos.klever.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hacker@klever.net>) id 1KuQYa-00020O-4Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 12:46:48 +0100
Message-ID: <4905AA27.6010600@klever.net>
Date: Mon, 27 Oct 2008 12:46:47 +0100
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ge211u$h4r$1@ger.gmane.org> <4905A264.9050509@klever.net>
	<200810271230.56134.mickey@vanille-media.de>
In-Reply-To: <200810271230.56134.mickey@vanille-media.de>
Subject: Re: Policies vs. Guidelines vs. Requirements
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
X-List-Received-Date: Mon, 27 Oct 2008 11:47:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> to me these "policies" were always more guidelines than strict requirements. 
> We are not a beaurocratic institute here or a closed company (where you can 
> feel free to impose them if you want), but rather a bunch people working 
> together on a somewhat common goal.

I think this is very important statement. Because it really feels weird 
in the *free* as in freedom world to be forced into any requirements 
like that. Especially now that we have git, which may also benefit from 
'pull model' and the very idea of having not to pull branches for the 
sole reason that weeks ago they've *commented* on something the way we 
wouldn't.

> As such it's _completely unacceptable_ to revert a whole lot of valuable work 
> just because some of the guidelines were not enforced 100%. Completely 
> unacceptable. Also unacceptable is a one-man-show revertion without a 
> consensus, but that's something the core team has to discuss.

I think Koen is smart enough to understand that these reverts do not 
improve history in any way, so I'd say that it's the result of 
frustration with these messages. While I do not approve of it, you 
should keep in mind that behind the name "Koen" there is also a 
breathing person.

> In the meantime I'd be very happy if Holger would reapply his changes.

Why not angrily revert the reverts? ;-)

Love,
H


