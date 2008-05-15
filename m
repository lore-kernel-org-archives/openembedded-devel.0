Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1Jweda-0001Hh-M2
	for openembedded-devel@openembedded.org; Thu, 15 May 2008 16:40:55 +0200
Received: by an-out-0708.google.com with SMTP id b21so107085ana.6
	for <openembedded-devel@openembedded.org>;
	Thu, 15 May 2008 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=v6iLtpaT+GtlOIAiGpnF4Lk3Q6Biv5tULWcZBsMmHN0=;
	b=lQBZzG22LlS2gIMHeyJaSBnMUFgf4h96LOaOx4WeL7WU1Ni0RtAIhfWb1aqzMiwj4CEYL32N4pQZmVpCPnf1srAcouP7HP6ONPF4wkjQkgpHBEkQFMyDUQJNVdBydQm+AcMceZnzYkZYtb2Rm+nDdn3syMPhIPJtA4wQVI6bdqk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=o0dVGn3G0J/J2bXcc7CITlPSdHl9w4KjpTK+9zZY9xq/f3Yo8RYLmGFlfw2yCPHwZnlmO9gLt7WFqg6WZAWAjjXunpxIggrEcY+JPgQU0xCyxo+4oReuSMW3yGwVcqJoGdxa+i0M3FyuZu9xJmzw913Q/JiQKxiYzTpSg30bfuA=
Received: by 10.100.128.20 with SMTP id a20mr3068982and.121.1210862352560;
	Thu, 15 May 2008 07:39:12 -0700 (PDT)
Received: by 10.101.71.14 with HTTP; Thu, 15 May 2008 07:39:12 -0700 (PDT)
Message-ID: <bdb0025f0805150739t38ec2db0qc280c4b2633a13f6@mail.gmail.com>
Date: Thu, 15 May 2008 11:39:12 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: "Charles Stewart" <textproof@web.de>
In-Reply-To: <59BB071F-4FEB-44CB-A860-9AA533C0E96E@web.de>
MIME-Version: 1.0
References: <59BB071F-4FEB-44CB-A860-9AA533C0E96E@web.de>
Cc: openembedded-devel@openembedded.org, mamona-devel@garage.maemo.org
Subject: Re: FYI: Advogato post
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 15 May 2008 14:40:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> Hi,

Hi Charles,

> I posted the following:
> http://www.advogato.org/person/chalst/diary/192.html
>    Monotone vs. git
>    Observe: Reconsidering the work flow and how the SCM system fits in on the Openembedded-devel mailing list.

There were a lot of discussions about mtn x git on OE mailing list,
but I didn't see this message.
I've just looked for it on my gmail and haven't found anything, so I
have no idea where it was...

But I can answer these questions about Mamona migration:

>> Mamona migrated their repository to git. How does this work?

It is working fine and our lives are much better. :)

Once upon a time there was an angry team fighting with a tool that
didn't work as expected.
This tool was so slow that this team had enough time to prepare (not
just drink) their coffee.
It was so painful deal with files that wasn't files for this tool, but
nodes, or something like that,
causing a lot of problems and headaches.
Then these guys discovered git and the that Holger's script (mtn2git)
was working fine
and they lived happily ever after.

>>Are there conversion tools?
Holger's script (mtn2git) is the only one that I know.

> > Did they agree upon a time when all of the developers
>> converted their repositories? Or did they have encroaching gradualism, where
>> a gatekeeper converted, and others converted when they needed to talk to the
>> gatekeeper?

All of us (about 5 developers) wanted so much this migration that
there was no gradualism.
Aloisio setup a server and everybody changed after that.

>> Postscript: I guess tailor can handle the project migration.
>>
> Was the discussion with the mtn deveopers on the mailing list?  Google
> wouldn't find it for me if it was.
>
> Best,
>
> Charles
>
>
>

Cheers,

-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


