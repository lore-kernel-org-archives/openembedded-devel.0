Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KBHOF-0004sG-3a
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jun 2008 00:53:31 +0200
Received: by an-out-0708.google.com with SMTP id b38so662338ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2008 15:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=p1lPkYCRadUk4vzXkY3hP+lxfR7j6pOgOUnTQ6LP+L8=;
	b=qNRBKX8m6ax2HJih82AHcVK3wqIwpMckh9xsLTQkmzdQYI8koRDIccj1qPraOiIpL2
	MZLVzRAcraP8j0OuU1mrhGpHcKoE41ucnjyiiQGvpNElRYFYLvepIShcSQqC04o3hTEx
	AfTs8UqzX6MPLDKYsoJu62n/8Ykv8rGtImSQs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=dFGB0sDW2hMGVeIlk1er+5fGcv9O1MsU9J1ls3i5ZbUT2JPWy1ij85DDYMlTNMcEaa
	MLBAHcKD9Dga4tOs9Spa7GMVYC++Rrfiut0mzfGGJ7Di9CBGC7SPaLwQusSTFbT8saik
	iuKz7IPHV5XbSzEE8+1g59uhnRB0x1EHic/C4=
Received: by 10.100.122.12 with SMTP id u12mr16841528anc.109.1214347890323;
	Tue, 24 Jun 2008 15:51:30 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Tue, 24 Jun 2008 15:51:30 -0700 (PDT)
Message-ID: <c384c5ea0806241551p1c67e603p211206de42240de@mail.gmail.com>
Date: Wed, 25 Jun 2008 00:51:30 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080624212909.GJ9891@smtp.west.cox.net>
MIME-Version: 1.0
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<20080624095735.GB3500@aquilonia.hyboria> <g3rel4$tko$1@ger.gmane.org>
	<20080624190629.GI9891@smtp.west.cox.net>
	<48615E45.8080606@kernelconcepts.de>
	<20080624212909.GJ9891@smtp.west.cox.net>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 24 Jun 2008 22:53:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Tue, Jun 24, 2008 at 11:29 PM, Tom Rini <trini@kernel.crashing.org> wrote:
> On Tue, Jun 24, 2008 at 10:51:17PM +0200, Florian Boor wrote:
> Also, I'm not saying that for every commit to the core you need to do a
> from scratch build of all combinations, but you should reasonably
> confident that things work.
>
We can direct an autobuilder to some branch and make it build a
variety of machines, besides testing by the branch maintainer(s)
themselves.

But again, I think this is of *later* concern.

First up is GIT IMHO, and getting the ball rolling again for everyone.

Regards,
-- 
Leon


