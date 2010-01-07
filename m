Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NSnNn-0004xs-63
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 09:06:18 +0100
Received: by ywh8 with SMTP id 8so17924815ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 00:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=hCkPnBeKm7pUCPlRO8n3VZJOyUPivBpvQyK+/fWZUuY=;
	b=DmTvc6TOVNmhgqPYJXBKDKM21XPVFu/BbUBdyJw+LKE47cuFEo7ayqrqIcHNw4MFRV
	pOfndjJh9jwY9yxHZaeFpncCuDTalDpQCqz6dSmYluUbrTSIVAVdNeBWqpk3owm//zJk
	iNJWRn2zVh7xjwSF1VHboXZuELKfzKUmGi5SQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LT1+5Eqw6ddl4ow7rmLSXkLSji5FMZq7oft8tx/REztNcwqHTQB6Wza74/lRUcAmXM
	fmgCGr3/ORAjhiaSXuWsfv4OJp5bvRTHMiD3fmRiIH6lXSij7X27WUv194p5iW4MRUzJ
	VzI06a4FnZ2vkP1a9njAla4QkRuI2M+BPtt8s=
MIME-Version: 1.0
Received: by 10.101.181.15 with SMTP id i15mr8885311anp.90.1262851448920; Thu, 
	07 Jan 2010 00:04:08 -0800 (PST)
In-Reply-To: <b6ebd0a51001050826t3bd42641g925c023c706d5ca0@mail.gmail.com>
References: <20091222140029.GF10910@xora.vm.bytemark.co.uk>
	<1262118637.8748.173.camel@dax.rpnet.com> <hhf42m$n7h$1@ger.gmane.org>
	<20091230144538.6a171e4e@xora-desktop.xora.org.uk>
	<1262602007.8748.206.camel@dax.rpnet.com>
	<20100104110233.GA2017@xora-vm2.xora.org.uk>
	<1262629172.22868.4.camel@andromeda>
	<20100105111128.GB1983@xora-vm2.xora.org.uk>
	<1262702588.8748.466.camel@dax.rpnet.com>
	<b6ebd0a51001050826t3bd42641g925c023c706d5ca0@mail.gmail.com>
Date: Thu, 7 Jan 2010 09:04:08 +0100
Message-ID: <ac9c93b11001070004j6d2c599bie9249c7aab3758ad@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [TSC] First Meeting
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
X-List-Received-Date: Thu, 07 Jan 2010 08:06:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

May I suggest that the TSC thinks of a mechanism for developers to
bring topics to the TSC table (something somewhat more structured than
just mailing one of the TSC members or mailing it to the list in the
hope that someone will see it (although I would alread be happy if
mails with [TSC] in it are considered requests to put things on the
agenda of the TSC)). I mainly want to avoid that things are dropped.

Last few days I've seen two items mentioned on the list that could be
discussed by TSC
- QA issues
- image building flags ("the discussion whether udev should be default
if nothing is specified")

Frans


