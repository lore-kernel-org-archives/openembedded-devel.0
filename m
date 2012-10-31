Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTWE8-0002ZP-F7
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 12:12:54 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so822412pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 03:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=hdVArhybrnGumlf7KBj4leyGWv7YMnHKIFgRKWDSVCU=;
	b=IcdIwdOm1GsNAQSjevpR3Jg12ZO3XCW4UvMznsmMtkXVIUKwWTjhyd96QtWsHs720c
	qhE4CNbw67s7GOhTu8AxcxvD38TMOulq2M65Bc4wj0F2Mi06yfNyaNvK1f2OBgZzHjEI
	hF7rjUoBax6UVoSB4FSQfkkgynj2qExZAFi2YPvLo9xAsBLjorBzuietO8vMVVAlBYcs
	7szkkgmIvZ+7T/U58Jbp/Ayt/p9h3PTsRYxojakn34P7lN08e2rIdnrk7ZSalWJ4riOK
	49Lmrp9fDSYYTY1zYfNa5bS9w8shENrpPpQmo6ixwKB1r93+P682BLkDZaSqlDihHdet
	YMEg==
MIME-Version: 1.0
Received: by 10.66.79.198 with SMTP id l6mr63944029pax.43.1351681152013; Wed,
	31 Oct 2012 03:59:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Wed, 31 Oct 2012 03:59:11 -0700 (PDT)
In-Reply-To: <20121031064424.GA30608@ad.chargestorm.se>
References: <1351607962-13469-1-git-send-email-otavio@ossystems.com.br>
	<1351607962-13469-2-git-send-email-otavio@ossystems.com.br>
	<20121031064424.GA30608@ad.chargestorm.se>
Date: Wed, 31 Oct 2012 08:59:11 -0200
X-Google-Sender-Auth: j9Bk5rNopSlFoHDEIr2ERsdpRQE
Message-ID: <CAP9ODKo1s-g1L=x5uZ+0w1+Fz123+8dBvt7piZFmx3hOnW8TMw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] meta-systemd: meta-networking: ntp: Update bbappend to 4.2.6p6
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
X-List-Received-Date: Wed, 31 Oct 2012 11:12:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 31, 2012 at 4:44 AM, Anders Darander <anders@chargestorm.se> wrote:
> * Otavio Salvador <otavio@ossystems.com.br> [121030 15:39]:
>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  .../{ntp_4.2.6p3.bbappend => ntp_4.2.6p6.bbappend} |    0
>>  1 files changed, 0 insertions(+), 0 deletions(-)
>>  rename meta-systemd/meta-networking/recipes-support/ntp/{ntp_4.2.6p3.bbappend => ntp_4.2.6p6.bbappend} (100%)
>
> Shouldn't this bump ntp to 4.2.6p5 instead of 4.2.6p6? At least 4.2.6.p5
> is what I can see in meta-networking at the moment. Though, I might have
> missed another patch floating around...

You're right.

I will send a v2 of this.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


