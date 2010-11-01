Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PCtIZ-0003r0-Ba
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 13:15:41 +0100
Received: by iwn42 with SMTP id 42so6443849iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 05:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=HlzDkPTFTRPcgmxheWmwB6nZm5eKwe25WD8cZuhvwPY=;
	b=cpr1skIuhtR3nEjHddOz9b0eua38MoO8k1jPG7W25BwCNqCgWFFQNw3znOkTA2lTri
	QyOvj9RpuTzE3uI3sIqlnZlE6+wvAvvH+7b9lMz0LMrwLVBpMMVPhIzbVmu74/LtFYMh
	kpgYp0aoQmRZAHYwVAyYNMGq3H/Yanz9HGdmQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=f3OmwuTpusZvLzqijOMUyU5M9Ly2R8r7fD2UZzsXyeGC7a2dooJVuadJ7IMphM0rqc
	JyRdX3fSBtaBFgJPJ9W2Z1pkLz38adSRZ37ey26RxxXlw/i0H/fc3kNGv/Ux6jVvQ8JE
	zyNdIgKPleVJYmDUw5axmIxkf9TENsS+2dQYk=
MIME-Version: 1.0
Received: by 10.231.11.72 with SMTP id s8mr11150382ibs.172.1288613692064; Mon,
	01 Nov 2010 05:14:52 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 05:14:51 -0700 (PDT)
In-Reply-To: <20101101113853.GB3440@jama>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikmqiDqWpHS=K73N8z6a0VPU8k7zMCP7yrb=G-Y@mail.gmail.com>
	<20101101081956.GA3440@jama>
	<AANLkTikwumwg4Pmw49AzaT0j-QhjCbPF+kcAWcSJZbJQ@mail.gmail.com>
	<20101101113853.GB3440@jama>
Date: Mon, 1 Nov 2010 13:14:51 +0100
Message-ID: <AANLkTinrDLCrgDc2PV26u1qetL-zMqeVV6_DC0PJTViF@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 12:15:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/1 Martin Jansa <martin.jansa@gmail.com>:

>
> In the end every feature which is autodetected in configure should be
> forced enabled or disabled in recipe to correspond with DEPENDS.

I agree! This should be part of a sane recipe.
Janitors job?

Frans


