Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjHmp-0005yD-5E
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jan 2012 22:57:19 +0100
Received: by bkbzt4 with SMTP id zt4so450538bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 13:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=/JDqBOinnIZl/PrPoNKxqoSQMpRqM1T/IGC1voxMULk=;
	b=UHxbXKqJ2eYdrHwIU2imjDWATTBumwilGZ7IKHmveeWECOp4NRuZc6GwuUJi8oCijN
	mQJPD+97Hsm9YweIRmPlhbW266LTdm4YV0tESNMyoMlpngciz1s8b1grLlnkGTXvJOnb
	RYVJxgt1Nn1RE2BPSPDqiT1xEf4WFTOZnTLlg=
MIME-Version: 1.0
Received: by 10.205.136.205 with SMTP id il13mr3291249bkc.37.1325886594723;
	Fri, 06 Jan 2012 13:49:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.8.139 with HTTP; Fri, 6 Jan 2012 13:49:54 -0800 (PST)
In-Reply-To: <4F0763FD.9000801@windriver.com>
References: <cover.1325876341.git.otavio@ossystems.com.br>
	<b61f46cb503582b669cbc56b0ea04d7fdaafd256.1325876341.git.otavio@ossystems.com.br>
	<1325879877.3234.2.camel@lenovo.internal.reciva.com>
	<CAP9ODKqpDS=sJQ-uuP5+E6QOMU7eQheWXqk+TSA4fkpwha6LVw@mail.gmail.com>
	<4F0763FD.9000801@windriver.com>
Date: Fri, 6 Jan 2012 19:49:54 -0200
X-Google-Sender-Auth: WIIJWGQSqb2XrW91fvYIuVrvGtU
Message-ID: <CAP9ODKrhfnL_+VJNWFQ0J7uyw3yayZ-e+gnyzsp4gjivxdtL2Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 5/5] udisks: disable manpage building
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
X-List-Received-Date: Fri, 06 Jan 2012 21:57:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 6, 2012 at 19:13, Mark Hatle <mark.hatle@windriver.com> wrote:

> In what way?  Most of the problems I've observed in the past have been
> docbook related, but I think those have been resolved within OE-Core.
>

Docbook related problems; you prefer if we fix those then?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

