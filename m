Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lzhrc-0000YV-6v
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 May 2009 03:48:32 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1368781ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2009 18:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AK3OCIn5jUfp8iSkdpVdpa6FLdK5Pvg0T+BPZd7+44A=;
	b=GQOai4wf+BlNFqlORGBiuDLvJhZC4HDKgk5vCHqhR05eC3v0QCAh+zH4kSWh+phAEP
	3xSKSnceGzTpq16zutK5afPV9LZQIiBvdlpbNURRT6LXm72Mh7dBtKxpJEWVdNITkKqF
	HMrO1uAF+A7lWMZjWVs71wJMtQ6IkxEshqXh4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NMOY/RNKe41Gyc34v/XNOprMB1b4Mrq5UouweJtAVVB63BIRBTMgnAuaTpqTHif7lD
	JZ1/q5112FeZtw+89VnWU7D3BjbTRQ0lA8xGIW0+P2sNt5jMan50iFhJsfPdo1W/Yr9q
	Q7+/85UFNigDXgyOdCRhGZGMUhLVjDxoOvxvk=
MIME-Version: 1.0
Received: by 10.151.125.12 with SMTP id c12mr4619650ybn.213.1241142186827; 
	Thu, 30 Apr 2009 18:43:06 -0700 (PDT)
In-Reply-To: <1241101618.30742.241.camel@mill.internal.reciva.com>
References: <f96d234e0904300544g4f933c15x1abaa430373868fa@mail.gmail.com>
	<1241101618.30742.241.camel@mill.internal.reciva.com>
Date: Thu, 30 Apr 2009 21:43:06 -0400
Message-ID: <f96d234e0904301843q27803491xe14c09bf75193fe7@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: progress on OE organization issues
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
X-List-Received-Date: Fri, 01 May 2009 01:48:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Thu, Apr 30, 2009 at 10:26 AM, Phil Blundell <philb@gnu.org> wrote:

> Do you have any kind of estimated timeline for putting these
> organisational structures in place?

The server changes can happen as I/others have time.  I hope to have
most of the services mirrored over the next couple weeks, and kept in
sync with rsync.  After a period of testing, we can then make the
switch.

The eV stuff is a little less known, as about all I can do keep
hassling those who started the process.  I did note your thoughts
about the eV, and have asked the http://www.softwarefreedom.org/ for
any advice they might have.  An organized way to handle funding does
not seen super critical at this time with the nslu2-linux server
offer, but something we should get in place.

I have been pondering doing a series of polls to get feedback from the
OE community and users.  The first one should be coming out shortly.
Perhaps we can use a mechanism like this for voting, etc eventually.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


