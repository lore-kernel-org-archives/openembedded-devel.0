Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TtGlc-0002uE-44
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:57:59 +0100
Received: by mail-ob0-f182.google.com with SMTP id 16so422824obc.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=722K7yIp8zZyW2/QnfymTc/717eFM6Z9BmvPXgZYeaE=;
	b=jlsZdsNUDAffpaSdc1Z5eH6Sxj64cOFZxNtg4/nKauztIcKEFIfUROnOI2RhpT9URx
	sPw76I/OfBEPrxPTelpF4GCsJyaniIx1Xstd9JfFvMIWsqAaf13awM/3jq/oEz7j/cX8
	FnIiy9A4UEBMkQpSSkzwdExBiyah1Ilxisj7FWPhUnRNc65R9fYQyt2OzkZ9QGxtmIcK
	N6QNRcH2RUsburfwmgdf/iW3CJ9sRWMVLKf9mKYNq1AHPB1JTvKZ9u9f1YE4rufMjT6H
	PwDED2WOdwDMB/ZY5PWxQxP3oJeMLWTL1gNdV/Ba9RnBg9iM5hIZcLYswEDhe+q0ywiH
	IVhw==
MIME-Version: 1.0
Received: by 10.182.54.103 with SMTP id i7mr50537003obp.62.1357818158302; Thu,
	10 Jan 2013 03:42:38 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Thu, 10 Jan 2013 03:42:38 -0800 (PST)
In-Reply-To: <20130110123931.2dbeb03f@no-log.org>
References: <1357510379-14744-1-git-send-email-otavio@ossystems.com.br>
	<20130107193340.GH3285@jama> <20130110123931.2dbeb03f@no-log.org>
Date: Thu, 10 Jan 2013 09:42:38 -0200
X-Google-Sender-Auth: rmHbigZ8CCu9n6kIkefa4eekyUU
Message-ID: <CAP9ODKow8h_AiLnnMtO8esbR=X5CPA5nLiz41PBEFOi_nkVKCw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-browser][PATCH 1/3] scripts/firefox-gen-l10n-recipes: Update copyright to 2013
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
X-List-Received-Date: Thu, 10 Jan 2013 11:58:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 10, 2013 at 9:39 AM, Denis 'GNUtoo' Carikli
<GNUtoo@no-log.org> wrote:
> On Mon, 7 Jan 2013 20:33:40 +0100
> Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> On Sun, Jan 06, 2013 at 08:12:57PM -0200, Otavio Salvador wrote:
>> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> I've build tested all 3 on jenkins and looks good to me:
> It does the same than the previous version of firefox:
> root@om-gta04:~# firefox
> Illegal instruction
>
> om-gta04 is an armv7 machine with NEON.
> I think it's a toolchain issue.

What arch is it? Can you check which instruction is it?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


