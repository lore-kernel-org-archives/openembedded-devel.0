Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1IsweK-0003aE-9v
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2007 09:34:04 +0100
Received: from cimmeria ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Fri, 16 Nov 2007 08:32:20 +0000
	id 00064627.473D5594.000030AF
Date: Fri, 16 Nov 2007 08:32:22 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071116083222.552a9c30@cimmeria>
In-Reply-To: <20071116011627.GA7192@lenovo>
References: <472216E5.6060708@student.utwente.nl>
	<20071115080222.2c3a597f@cimmeria> <20071116011627.GA7192@lenovo>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [RFC] adding CONFLICTS
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
X-List-Received-Date: Fri, 16 Nov 2007 08:34:04 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Nov 2007 19:16:27 -0600
David Farning <dfarning@gmail.com> wrote:
> A good way to look at this issue is to study how Seth Vidal sovled the
> issue in YUM, Fedora's updater.  It is written in python, so easy for
> BitBake developers to understand.
> 
> It seems that it would add a good deal of complexity to the current
> design of bitbake.
> 
> Although useful this might be an idea for bitbake 2.0
> 
We already have fully working package Conflicts: working.

This is talking about staging conflicts. Or in otherwords
a work around until package staging works fully including
our already complete package conflicts handling.

Graeme


