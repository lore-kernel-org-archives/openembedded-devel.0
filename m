Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1IsZhY-0002QP-Ig
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Nov 2007 09:03:52 +0100
Received: from cimmeria ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Thu, 15 Nov 2007 08:02:14 +0000
	id 00064406.473BFD06.00000B42
Date: Thu, 15 Nov 2007 08:02:22 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071115080222.2c3a597f@cimmeria>
In-Reply-To: <472216E5.6060708@student.utwente.nl>
References: <472216E5.6060708@student.utwente.nl>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
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
X-List-Received-Date: Thu, 15 Nov 2007 08:03:52 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Oct 2007 18:33:41 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> Since we don't have packaged staging yet, what do people thing about
> adding CONFLICTS to packages the interfere with eachother like e.g.
> medialibraries like sdl and their hacked-up qte versions, multiple
> kernels (linux-foo and linux-foo-devel) etc...
> 
> regards,
> 
> Koen

This sounds good in theory as long as bitbake actually chokes with
a sensible error message.

Hopefully then it makes uses more aware what went wrong.

Graeme


