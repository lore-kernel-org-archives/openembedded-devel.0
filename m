Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1NJ1a1-0000z9-8x
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 10:14:32 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 0DFF5C4DC8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 04:12:48 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Fri, 11 Dec 2009 04:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=6rPn6eClAQoaLp6i1CTxsQwhae4=;
	b=n144XcQ46XmQmuAiQpfhla1+hUVdr9Vn5EZ5ZsjjFgib9E0Z9Wjem7LnO7/U0jvvf+TbZc+UOsCX32PWnSN+Q25kiW5SM+uOx65L6Le79MSDHWEZbRhTNWOdM+n1SM99SOBxltKF0yCF8pctv5P3guC5gXf9WIm+XbZm3jTRbLU=
X-Sasl-enc: MeXgjctXfTceXFjtZ60UTGU0C5by9cmr+s1IJN3XqbLd 1260522767
Received: from [192.168.178.120] (p54838071.dip0.t-ipconnect.de
	[84.131.128.113])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 41DCA4ABB88
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 04:12:47 -0500 (EST)
Date: Fri, 11 Dec 2009 10:12:39 +0100 (CET)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LNX.2.00.0912110857540.5053@asterix.crazy-teaparty.dyndns.org>
Message-ID: <alpine.LNX.2.00.0912111008130.5053@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.0912110857540.5053@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux_2.6.29.bb: update to kernel 2.6.29.6
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
X-List-Received-Date: Fri, 11 Dec 2009 09:14:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Fri, 11 Dec 2009, Vitus Jensen wrote:

>
> Version 2.6.29 fails on arch powerpc because of a syntax error.  See
> http://lkml.indiana.edu/hypermail/linux/kernel/0906.1/00867.html

Sorry, I did not see my first post (tried git send-email for the very 
first time).  The first patch was rubbish.

BTW: angstrom is not affected by the error in kernel 2.6.29 because it 
uses an older compiler, minimal is.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


