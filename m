Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1Ik0UX-0007Oq-G0
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2007 18:51:01 +0200
Received: from cimmeria ([::ffff:78.86.130.156])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Mon, 22 Oct 2007 17:43:56 +0100
	id 00064B4C.471CD34C.00001F35
Date: Mon, 22 Oct 2007 17:43:56 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071022174356.7af78b73@cimmeria>
In-Reply-To: <471CC31D.2010401@student.utwente.nl>
References: <4510693243.20071017152524@vanille-media.de>
	<471729ED.9080208@student.utwente.nl>
	<1192708743.6158.25.camel@localhost.localdomain>
	<471C8BF4.1050206@student.utwente.nl>
	<1193063767.6088.54.camel@localhost.localdomain>
	<471CC31D.2010401@student.utwente.nl>
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
X-List-Received-Date: Mon, 22 Oct 2007 16:51:01 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


> > * We implement packaged staging and only stage the dependencies
> > needed for each package.
> 
> That would be a better approach. Graeme, do you still want to have a
> shot at implementing a unionfs based approach?
> 
I do think that would be a neat solution to avoid running gzip/unzip
for every package. And should be doable with a LD_PRELOAD type system
that just redirects open() and its familly. Im sure I saw one once
on freshmeat.net Ill try and dig it out.

Graeme (XorA)


