Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NgmKq-00004r-9C
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 22:49:03 +0100
Received: by bwz19 with SMTP id 19so3062134bwz.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 13:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=aIPGGi6AvOWFMPNfTTG402p1IFsqsD6DbNi4uL5Co30=;
	b=Lpfg5mBVcNdZON6hUj/6JATJouzJ4pgZJ1PL8bzMbyk6jqlaHOE2Upb8ip4k4oR6EE
	phOO8w2f6re8JE++NnwB9RRMBwitfLPjmlR+9IrPLsChvr9SfEWo64IgFysnSkrIx/NG
	BaMbV4xLagn1tfuWIS/PB27QPltUQYkA21aG4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=tpGJMp3GBoYp4XSJCDiY8ZWmG0M6hsPP3TGEJ0G2qVubihWhb9Lo7EIhBV17mOsBSk
	HHOQPQ1n7WOT+M4JNE4DrCGuBDouXjezlSNVOP2M3nBKi9OUFiGGzmnBha1hzb6Ojjg3
	U1HPO5/F9ql6X6bXCOGYm/thAOEcpGcA5RqsQ=
Received: by 10.204.2.206 with SMTP id 14mr2635203bkk.189.1266183983007;
	Sun, 14 Feb 2010 13:46:23 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 16sm2368864bwz.15.2010.02.14.13.46.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 14 Feb 2010 13:46:21 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NgmLK-0001BW-9L; Sun, 14 Feb 2010 22:49:30 +0100
Date: Sun, 14 Feb 2010 22:49:30 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100214214930.GK30265@mx.loc>
References: <hl9luq$dgl$1@ger.gmane.org>
	<20100214203851.3C855185B3BD2@dd20204.kasserver.com>
	<20100214212221.GI30265@mx.loc>
	<1266183110.5437.34.camel@lenovo.internal.reciva.com>
	<20100214214709.GJ30265@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20100214214709.GJ30265@mx.loc>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: = ? UTF-8 ? B ? Ww== ? =oe= ? UTF-8 ? B ? XQ== ? = How to sane replace a path in a pkgconfig file ?
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
X-List-Received-Date: Sun, 14 Feb 2010 21:49:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 14, 2010 at 10:47:09PM +0100, Bernhard Reutner-Fischer wrote:

>So either come up with a stanza that lists all path-touching tokens
>explicitly or write a sed/awk script that does that -- i'd be surprised

wait.. we're in python-land, so this should be fairly easy and straight
forward.


