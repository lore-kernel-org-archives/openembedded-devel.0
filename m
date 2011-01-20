Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bgamari.foss@gmail.com>) id 1Pg2w6-0001EB-6I
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 23:24:58 +0100
Received: by qwi2 with SMTP id 2so1132527qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 14:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:in-reply-to:references
	:user-agent:date:message-id:mime-version:content-type;
	bh=sfON/qUCn+4xxq2qOqL9KX2Om3vtke1kBxH9yUj5cWs=;
	b=ZHj0uzbBV9RXHw0JOHjjN9AZP9lA+100RZU6zREjQeOw/wyEiE4ngmgFYLUdM7A4kq
	J4bkU6YI4UwZAFnQm6cZYDMrj9ReOsx3MnsHkgHfzZAuI81HnWP421h9KgNInsVY8j2F
	2BzyjxgyGPAIsqXDa+F1GGHjCMTSst6aggtIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:in-reply-to:references:user-agent:date:message-id
	:mime-version:content-type;
	b=SnJFZJxIcViVHh2kliwZ9qzqoFbsdNh50EzPuBKRrRewV5E3XBIPhQB1Ntkbc5J4ri
	qYQ7gctK34T1VaHxfEnpjHSRSC5Zz/HPC0ziinVjjrfM6yel4R37Hms5OCziIyQclIBx
	XQfeM+IAoAmpwrUpJQZkZPE4Jqt2/XKELZIKk=
Received: by 10.224.67.75 with SMTP id q11mr2438599qai.3.1295562256318;
	Thu, 20 Jan 2011 14:24:16 -0800 (PST)
Received: from localhost (physicsnat56.physics.umass.edu [128.119.50.38])
	by mx.google.com with ESMTPS id w12sm4938356qco.44.2011.01.20.14.24.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 20 Jan 2011 14:24:15 -0800 (PST)
From: Ben Gamari <bgamari.foss@gmail.com>
To: Koen Kooi <k.kooi@student.utwente.nl>,
	openembedded-devel@lists.openembedded.org
In-Reply-To: <ih52ui$l1v$2@dough.gmane.org>
References: <87lj2im6qc.fsf@gmail.com>
	<AANLkTino3P3EV8BazsWGG2HYs7CFXDsLpn+eKoyiUWoK@mail.gmail.com>
	<ih52ui$l1v$2@dough.gmane.org>
User-Agent: Notmuch/0.5-17-g2d1420b (http://notmuchmail.org) Emacs/23.1.1
	(x86_64-pc-linux-gnu)
Date: Thu, 20 Jan 2011 17:24:13 -0500
Message-ID: <87sjwnciya.fsf@gmail.com>
MIME-Version: 1.0
Subject: Re: Dealing with ttyS -> ttyO rename on OMAP3 in 2.6.37
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
X-List-Received-Date: Thu, 20 Jan 2011 22:24:58 -0000
Content-Type: text/plain; charset=us-ascii

On Tue, 18 Jan 2011 23:07:14 +0100, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> The machine maintainer should know which kernel is going to get used and
> can change the machine.conf accordingly.
> For example, I will change the beagleboard one once the .37 kernel is
> considered good enough (it's currently lacking ISP support).
>
That sounds fine. Thanks!

- Ben


