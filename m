Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N6PtK-0007FP-Gm
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 15:34:21 +0100
Received: by ywh7 with SMTP id 7so977966ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2009 06:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Idkers92kD1+3GoIOgX/eb9n20yzrTQbeoIVlc3MJlM=;
	b=v0HN1Rt+EHxRh1ARa19HrdFJDpxlCGXsPv225f6AcrZSmB6SBGINP+8VRbAbds8tvv
	MSt6zB4xJfA8auTheFNRp5ASWrn3szlEKRuEcdWN96lADc4EDxHsvmt2wjDXiLnMTb+s
	j0l85TVTrhFCEGRQnavexZvNG3lX3R8gppEDc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jeS4uUVCINiAhQxf5teWBFldLPFJNQs0KmcjO0RlE+H1mrzmLLCrubjqWHTb012K4o
	fx3KDZ07rlSi8oJ+1PjUAOWM11lxOY+4agOVVncvXA9Ei9tLdDjlL25XsSZiQ145cjun
	TiGTuWVcokDulTpIsGXkORjtL5uCFWHQd4g9o=
MIME-Version: 1.0
Received: by 10.101.190.40 with SMTP id s40mr4175271anp.8.1257517984113; Fri, 
	06 Nov 2009 06:33:04 -0800 (PST)
In-Reply-To: <ac9c93b10911060237i44b0d886qccfb0d64f94ae6ec@mail.gmail.com>
References: <ac9c93b10911060006x1a60e677ic6f2c192eedc176d@mail.gmail.com>
	<217663.38369.qm@web112503.mail.gq1.yahoo.com>
	<ac9c93b10911060237i44b0d886qccfb0d64f94ae6ec@mail.gmail.com>
Date: Fri, 6 Nov 2009 15:33:04 +0100
Message-ID: <ac9c93b10911060633h7240008eqd035499cf052af1e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: mysql 5
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
X-List-Received-Date: Fri, 06 Nov 2009 14:34:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

one more thing
when installing mysql5 client or server packages they insist on
installing libmysqlclient-dev
No idea why this should be the -dev package. Content seems as expected.
Solutions are welcome !

Frans


