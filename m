Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RUzIO-0002lN-DH
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 12:22:49 +0100
Received: by bkbzs2 with SMTP id zs2so7689007bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 03:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=4Hwn2msFWwGuGjfI+2uG8lTRCFeSvbkG/C3FLwaUJgQ=;
	b=lDxFhI2yM8p34ZVnEsmw+gHo3bzWsilezKqV72gy7kB9wpAJ8nHmKfkSp8fs/mfMCp
	ObUMMG7g6If9rabvQvgbePgsxn85lP03An8sCyWrqwa07FOjpOZgwHx1/Pbrv6DuhY9K
	C5Lw4BRWPDkNrtysIY1gJgoN+nb05KQBpvGH4=
MIME-Version: 1.0
Received: by 10.204.148.4 with SMTP id n4mr45188914bkv.42.1322478969115; Mon,
	28 Nov 2011 03:16:09 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Mon, 28 Nov 2011 03:16:08 -0800 (PST)
In-Reply-To: <1322478479.26287.15.camel@ted>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<1322476245.26081.89.camel@phil-desktop>
	<1322478479.26287.15.camel@ted>
Date: Mon, 28 Nov 2011 09:16:08 -0200
X-Google-Sender-Auth: JksuR4Nm81iTzsR1C05cfBr4nU4
Message-ID: <CAP9ODKqJdi_fNhBN7QZambbSRtE6w8z--EYRYoypT1Mm5AV6gw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>
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
X-List-Received-Date: Mon, 28 Nov 2011 11:22:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 28, 2011 at 09:07, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Rather than fork off the Yocto docs for OE's needs, it would be nice to
> see if there was a way we could share the documentation.
>

I fully agree with that.

The work would be much easier if all that could be shared.

AFAIK, using docbook it is possible to use macros to expand for branding
and also conditional to output text so this could be done in a single
repository.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

