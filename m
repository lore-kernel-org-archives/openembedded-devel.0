Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1Ik4XC-0002Fs-Mh
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2007 23:10:04 +0200
Received: from cimmeria ([::ffff:78.86.130.156])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Mon, 22 Oct 2007 22:02:56 +0100
	id 00064B53.471D1000.000023D7
Date: Mon, 22 Oct 2007 22:02:55 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071022220255.497852be@cimmeria>
In-Reply-To: <1193077473.6088.68.camel@localhost.localdomain>
References: <4510693243.20071017152524@vanille-media.de>
	<471729ED.9080208@student.utwente.nl>
	<1192708743.6158.25.camel@localhost.localdomain>
	<471C8BF4.1050206@student.utwente.nl>
	<1193063767.6088.54.camel@localhost.localdomain>
	<471CC31D.2010401@student.utwente.nl>
	<1193077473.6088.68.camel@localhost.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: Cleaning up SDK/Toolchain
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
X-List-Received-Date: Mon, 22 Oct 2007 21:10:04 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> > That would be a better approach. Graeme, do you still want to have a
> > shot at implementing a unionfs based approach?
> 
> Hmm. Does that need root privs?
> 
Not what I was thinking, which was to do a union via LD_PRELOAD
basically redirecting open and its friends. I once saw a program that
did this trick tomorrow I shall try and dig it out, and try and give
it a few simple tests.

Graeme


