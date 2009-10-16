Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Myu1t-0007gE-JS
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Oct 2009 23:08:08 +0200
Received: by fxm22 with SMTP id 22so2772246fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2009 14:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=M4CR+7NJkghUw9+wQ/pBZp9QTcRd5v/7YPnzRs+i5tM=;
	b=wrBn0Ubpy8yM3wYUyMA6cdxcEbByPah1nKGOylLQUrzdAIokx3ufblMCpbscXc3sa1
	sNDHpmIggnQ7cXoViuwTASSpmSmrlJSJsjCdUPqPQuKOGv2OpEi8vAD0d41nuaIwhDOv
	KwJ4q7K9LRpV3GgjGK6DabnATdE7CfuCwfdm8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=cGwmjpS4a58yhLPfhqOWGDjz1SWz90f1DFhJAD9+YRUdqvUMeYbouqTFa5CCckW1lZ
	UpySGH3ClbflhNJICv4KhN4JUsRzomDOAIxldNskHIa3zfB64fsuiB+1LXNamOqSmSjU
	5MH+yucAp9ztPLbLso4Q1Du4YM1ZvdMcnP1oE=
MIME-Version: 1.0
Received: by 10.223.25.27 with SMTP id x27mr384352fab.7.1255727227431; Fri, 16 
	Oct 2009 14:07:07 -0700 (PDT)
In-Reply-To: <19c1b8a90910161354h7540f865m6d04f29902d3dcfb@mail.gmail.com>
References: <4AD59AF2.50003@dresearch.de> <4AD8531B.6070208@dresearch.de>
	<4AD87CF8.8040706@dresearch.de>
	<1255704318.28050.19.camel@mill.internal.reciva.com>
	<4AD8888E.2080108@dresearch.de>
	<19c1b8a90910161354h7540f865m6d04f29902d3dcfb@mail.gmail.com>
Date: Fri, 16 Oct 2009 23:07:07 +0200
Message-ID: <d1b08f940910161407m643e3f61t2161ed66b719d734@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: glibc_2.9 compile failed for armv5te
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
X-List-Received-Date: Fri, 16 Oct 2009 21:08:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Fwiw glibc-2.9-r35.2 built just fine for armv5te 12 hours ago.

Regards

Andrea


