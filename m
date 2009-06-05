Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MChLc-0002rX-Rd
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 23:53:12 +0200
Received: by gxk2 with SMTP id 2so107209gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2009 14:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GgamYyOJLNkpvKTptqlMhaDQkmGt+0MfId6sqr6zlSs=;
	b=HLenDDmGcVb9ALVWsMZqO5oiOLmrfi8RDrQnSVB1KxnsfdLzDUqTPSZQzOQewAySul
	VpzjkQjV54JGzstappNgcBT8Q7ndXXQsA34Da+/HAEOLJc/TnIcWWvtk3N9885Hs2vkK
	8DSqjtyys5k824uIArDfZRJWG2xVNrNnMhMGY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YADnSyRtD392RM+lB3YcZvcb6MyhFFzfyONXTLBtIXLhh4sBYEVQUqleoI9mTB2S3u
	OFyXMQj1QTb7x9cQkOPDLZCz64hDVKtccU5BikNcjbsfSZO4xpwWfOttdt4ioEv6Fnn+
	NPtkbZJ4M1ccjmd9cyTymIqTu3WwI1SSz830I=
MIME-Version: 1.0
Received: by 10.150.135.21 with SMTP id i21mr6937311ybd.53.1244238238824; Fri, 
	05 Jun 2009 14:43:58 -0700 (PDT)
In-Reply-To: <1244145476.6678.4.camel@port4>
References: <f96d234e0904300544g4f933c15x1abaa430373868fa@mail.gmail.com>
	<4A0DBCAC.5000403@balister.org>
	<1242424484.4514.117.camel@lenovo.internal.reciva.com>
	<200905160037.25213.mickey@vanille-media.de>
	<1242475355.4514.133.camel@lenovo.internal.reciva.com>
	<4A0EB79C.8030308@balister.org>
	<1243977526.5049.53.camel@lenovo.internal.reciva.com>
	<1244145476.6678.4.camel@port4>
Date: Fri, 5 Jun 2009 17:43:58 -0400
Message-ID: <f96d234e0906051443y3d0cfcf0m595469c780c9fed@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 Jun 2009 21:53:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Thu, Jun 4, 2009 at 3:57 PM, GNUtoo<GNUtoo@no-log.org> wrote:

> by the way why don't we join an umbrella organization?

The is the response I received from SFC folks:

========================
As for your question with regard to how long an application takes,
typically we are 6-8 month backlogged.  I can tell you though, that
we've had another application pending for more than a year in the same
eV situation you are considering here.  We simply don't have the
resources yet to devote to that question, despite a project still
awaiting that answer.
========================

So, I guess you get what you pay for.  Not that we are moving any
faster with the eV, but I guess the bottom line is that it is not easy
unless you are paying someone to dedicate time to keeping it moving.

Cliff


