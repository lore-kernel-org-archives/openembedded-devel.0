Received: from [208.84.147.47] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hacker@klever.net>) id 1KuRuc-0000KC-5j
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 14:13:38 +0100
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=rhodos; d=klever.net;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=FBBEfJqn+ZpXFeBTzUK7FjeRmKVWubLHgL9Pox5qYt8vZ3PyS5l9ZpeCcaeHb++qCKz3JSQO0gdv1vl+ZvREEosXC1ZjkJK94VMfIWkjoYdfu8TrGb/eC453T14zuf4b;
Received: from [85.183.207.43] (helo=[192.168.150.156])
	by rhodos.klever.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hacker@klever.net>) id 1KuRtp-0001tO-MA
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 14:12:49 +0100
Message-ID: <4905BE48.7020001@klever.net>
Date: Mon, 27 Oct 2008 14:12:40 +0100
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ge211u$h4r$1@ger.gmane.org>	<1225098642.4235.371.camel@lenovo.internal.reciva.com>	<490599E4.5090409@balister.org>
	<200810271345.22194.zecke@selfish.org>
In-Reply-To: <200810271345.22194.zecke@selfish.org>
Subject: Re: Reverting recent openmoko commit
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
X-List-Received-Date: Mon, 27 Oct 2008 13:13:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> 	- I will ask our OM developers to use a different style in the commit message 
> (even if this is not mandated) to not use braces but colons. And yes I think I 
> asked them to use [] as I'm used to this from various other projects, I will 
> ask them to change and change it myself.

I think the problem was not purely syntactical, the problem is that the 
commit subject did not always mention the recipe in question, but rather 
"Description", "alias name", etc.


Love,
H


