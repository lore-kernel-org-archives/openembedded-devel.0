Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Nlk55-0001K6-4c
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 15:25:15 +0100
Received: by bwz5 with SMTP id 5so1036248bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 06:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Fr7h7SVMcvUNxOVflILdDLzyUItxOElVcV5OhC0zv64=;
	b=LqKZTukWRzRPSONnYkyrS6naV4laqqkjt05jJzUxYw+D3FzMIzTTNYMzmybqXaA7gV
	bkdwcnvBfZCS3XP/C6pzoH2ro2NuxIvjVyDZB83anlHePX42QXtgcLK1zJND4VTGksGC
	HrPi+ZjxVcsDxm+sQ/YmP0GuwecnJecLv1SoM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ni8Vlfboz/OLdW45cw/p5KjKG+aMXnP8VRdcerzEV5nVa8byq7ohxMU4qTzOSxGpsj
	c1Z1cmAIQ2s4kHvffFFOPfqGDorYlH1Dcdy2uwLY2wqlVvG/mY8zDe2RW5zf4fiHtzG/
	UlDYwd0UqnMFvmKG/4cqA86bl3B1yhPK7aark=
MIME-Version: 1.0
Received: by 10.204.10.9 with SMTP id n9mr725788bkn.41.1267366946360; Sun, 28 
	Feb 2010 06:22:26 -0800 (PST)
In-Reply-To: <201002281503.35018.holger+oe@freyther.de>
References: <201001230827.49805.holger+oe@freyther.de>
	<201002262100.19410.holger+oe@freyther.de>
	<201002281408.04117.holger+oe@freyther.de>
	<201002281503.35018.holger+oe@freyther.de>
Date: Sun, 28 Feb 2010 15:22:26 +0100
Message-ID: <fca63bcf1002280622q6b932a0bp1f38d88e77a12a5a@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded and known security issues
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
X-List-Received-Date: Sun, 28 Feb 2010 14:25:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Could your provide a link to the current auditfile.tbz ?

ftp://ftp.freebsd.org/pub/FreeBSD/ports/local-distfiles/eik/ is
outdated? The webpage located at
http://www.freebsd.org/ports/portaudit/ seems a lot more up to date
(although it doesn't contain a link to an auditfile)

Regards,
Michael


