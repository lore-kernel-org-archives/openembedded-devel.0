Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RVJ65-0005gt-Dj
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Nov 2011 09:31:27 +0100
Received: by vbbfc21 with SMTP id fc21so4041026vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2011 00:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ZPRYx4dXAw7GrhhWfb3wntZSCSDdI43Ckava68m/XUc=;
	b=xb4cwfCv/DotTCVn3utAZsTASPQWMh7mdqiUI9A5fwyABnjQsQlonJ5+ADaxRBG8Ua
	0R9mTqAwm5FHozAY4PLqu0edw+P8CMkOh3Ix/Du1DCw0fkWIpXC6NZTOOK5gkSIhGrMb
	4mGZd+gWc/zcjsmVHSDrPYB7b4rJwHUzp1eWs=
MIME-Version: 1.0
Received: by 10.52.65.176 with SMTP id y16mr48032754vds.53.1322555086420; Tue,
	29 Nov 2011 00:24:46 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Tue, 29 Nov 2011 00:24:45 -0800 (PST)
In-Reply-To: <alpine.LNX.2.02.1111281848560.1090@myhost>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<1322476245.26081.89.camel@phil-desktop>
	<1322478479.26287.15.camel@ted>
	<alpine.LNX.2.02.1111281848560.1090@myhost>
Date: Tue, 29 Nov 2011 09:24:45 +0100
Message-ID: <CACW_hTYYKTX4RQXwFSEu+VR3kPe1kGw1J_ba-=L1XqE_QkwWJA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Documentation problems
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
X-List-Received-Date: Tue, 29 Nov 2011 08:31:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/28 Bernhard Guillon <Bernhard.Guillon@opensimpad.org>

>
>
> On Mon, 28 Nov 2011, Richard Purdie wrote:
>
>  Rather than fork off the Yocto docs for OE's needs, it would be nice to
>> see if there was a way we could share the documentation.
>>
>
> I like that idea + the pull based model idea from Koen. In my opinion a
> pull based model for the documentation lower the barriers to write
> documentation because nobody want to write something false.
>

Of course I also do not want to write faulty documentation; then again I
also hate wasting my time, so I think I wouldn't even start if there was a
chance that my contribution might be rejected because the pull master does
not like my style or feels there are grammar errors or so.

(note that I am not a native english speaker so this is not too unlikely;
also if there are language errors in a contributed piece of documentation
on a wiki other people more proficient in english could correct those
easier and better than I ever can),

For me this raises the bar to contribute (not that I have contributed much
to our documentation...)

The issue with documentation
- everybody wants documentation
- hardly anyone wants to write documentation
- make it hard to write documentation and you'll end up with no
documentation.

BTW somewhere in the thread also the license issue was raised.
I'd suggest a form of creative commons with attribution clause.

Frans

