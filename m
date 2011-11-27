Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RUawU-0000ZK-Th
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 10:22:35 +0100
Received: by vcbfo13 with SMTP id fo13so1172144vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 01:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=RE/1145yWZPHPEkpvmRu3nJLQB5NlAFwhoa9kMQ8pJY=;
	b=B04nOEQSo5TPoMWT7CQBM/0bPch5haEK/VkHWznlIiHs3fotGGzZWcDZTk7qAiDg4j
	jLUqzbSVlqL+L7no8OLVQRF+TUKmeWonzLEvLfyttH8EzP3ex9GiLkcG4F84lLWcuPqd
	j3xeo3Lpp/yyrhJoY23CRsI8t014/Dp1I/TYU=
MIME-Version: 1.0
Received: by 10.220.107.143 with SMTP id b15mr4224839vcp.18.1322385357416;
	Sun, 27 Nov 2011 01:15:57 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Sun, 27 Nov 2011 01:15:57 -0800 (PST)
In-Reply-To: <alpine.LNX.2.02.1111262202210.1115@myhost>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<4ECD65FC.7000104@balister.org>
	<alpine.LNX.2.02.1111262202210.1115@myhost>
Date: Sun, 27 Nov 2011 10:15:57 +0100
Message-ID: <CACW_hTZVQA8tU5AREc++JY+88dVu8D9z25WvXNdJpg9jddr-cw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Sun, 27 Nov 2011 09:22:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/26 Bernhard Guillon <Bernhard.Guillon@opensimpad.org>

>
>
> On Wed, 23 Nov 2011, Philip Balister wrote:
>
>  At some point it needs to die/go read only.
>>
>> But, until oe-core + openembedded can replace it, we need to be able to
>> do minor updates to support already deployed systems.
>>
>
> We need to rewrite the getting started wiki page [1] to point to oe-core.
> It still mentions oe-classic which confuses new users. Also the main page
> should make it clear that oe-classic is going to die and new projects
> should use oe-core. In my opinion this will help new users more than to
> make oe-core read only. Some warning message when bitbakeing something with
> oe classic would also be nice.
>
> 1 http://www.openembedded.org/wiki/Getting_started
>

Very good plan!
I wholehearty agree!

Frans

