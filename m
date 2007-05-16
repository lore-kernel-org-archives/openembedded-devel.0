Received: from [194.158.229.26] (helo=mail-ps.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <robin.farine@terminus.org>) id 1HoFJd-0003qd-IB
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2007 10:57:01 +0200
Received: from acn.212.98.42.40.adslpremium.ch (212.98.42.40) by
	mail-ps.sunrise.ch (7.2.073)
	id 4649D0690001F7E8 for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2007 10:56:45 +0200
Received: from halftrack.hq.acn-group.ch ([172.16.145.83])
	by van.hq.acn-group.ch with esmtp (Exim 3.36 #1 (Debian))
	id 1HoFJM-00044R-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2007 10:56:44 +0200
Received: from ip6-localhost ([::1])
	by halftrack.hq.acn-group.ch with esmtp (Exim 4.63)
	(envelope-from <robin.farine@terminus.org>) id 1HoFJO-0007WZ-V7
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2007 10:56:46 +0200
From: Robin Farine <robin.farine@terminus.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2007 10:56:46 +0200
User-Agent: KMail/1.9.5
References: <200705151322.39110.robin.farine@terminus.org>
	<464A5D37.4030401@whitby.id.au>
In-Reply-To: <464A5D37.4030401@whitby.id.au>
MIME-Version: 1.0
Message-Id: <200705161056.46551.robin.farine@terminus.org>
Subject: Re: RFC: machine customized ixp4xx NPE firmware
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
X-List-Received-Date: Wed, 16 May 2007 08:57:03 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed May 16 2007 03:24, Rod Whitby wrote:
> Robin Farine wrote:

> > The patch below proposes a means of letting the machine
> > configuration file
> > decide which NPE firmware to build.
>
> Thanks.  We'll be very happy to apply that patch.  I'll take a
> close look at it tonight.

I forgot to disable line wrapping when I reposted it to the correct 
mailing-list... You may prefer to have a look at the cleaner 
version in bugzilla.

> Which machine/arch are you using?  We can easily extend that
> compatibility to include any other machines/archs that will use
> it.

Its a custom ixp425 big-endian board of which 2 functional exemplars 
currently exist :-). Not a problem, I just wondered whether 
something like COMPATIBLE_ARCH exists.

Robin


