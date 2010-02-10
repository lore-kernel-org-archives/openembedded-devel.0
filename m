Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfLMd-0004sO-6z
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 23:48:58 +0100
Received: by fxm25 with SMTP id 25so550866fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 14:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=YmT6hqHMXk5JrB03jvf6omWDZgADwyXQAkwS4vZC0s0=;
	b=eVnKKCWrFSSV75Qc1X0yRpjmaNpDlr5a/QOW8XdT2ESPa8qe47tclg5CSN3fzynsoJ
	uRY5aAYsnDzPw9w7I+bYzhM93D1AyXEthEj1OyWxuprbV9CiwnKRKaAq1Hr9+QNIOO+8
	49yQbynTDH6ePy4wgREIq4go1/RizHxWFYeL8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=G/MBWydkncuBpL1LlALnPxenllXBWJu9g+PKM9dlom/kke4DI150RUQy5r+c7elvxs
	LaHeYhcg+z3/TjszyQd5nCPSCx4xif/oNVungfao4wGLYR8H/O9YGmtAmk1/ZUc1Rf5p
	1NZOyteqe6pShnkSaXTjXKInyTfEuKTAHQPzU=
Received: by 10.223.97.220 with SMTP id m28mr1138173fan.36.1265841981278;
	Wed, 10 Feb 2010 14:46:21 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id g28sm2796125fkg.8.2010.02.10.14.46.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 14:46:19 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfLME-0006n4-4i; Wed, 10 Feb 2010 23:48:30 +0100
Date: Wed, 10 Feb 2010 23:48:30 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Phil Blundell <philb@gnu.org>, Jens Seidel <jensseidel@users.sf.net>
Message-ID: <20100210224830.GF10632@mx.loc>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 00/12] misc trivia
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
X-List-Received-Date: Wed, 10 Feb 2010 22:48:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 08, 2010 at 10:14:22PM +0100, Bernhard Reutner-Fischer wrote:

All were applied or retracted except these 2 patches that asked for
refactoring and which were resent accordingly today:

Jens Seidel:
resent as [PATCH 1/8] hwclock.sh: some more !getopt_long fixes [was: [PATCH 02/12] some more !getopt_long fixes]
Phil Blundell:
dropped, now [PATCH 5/8] busybox: use .tar.bz2 [was: [PATCH 05/12] no need to set LD nowadays]

Thanks!


