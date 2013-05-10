Received: from mail-ob0-f177.google.com ([209.85.214.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ualx1-0005li-SL
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 13:57:31 +0200
Received: by mail-ob0-f177.google.com with SMTP id un3so3996505obb.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2013 04:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=a2uPkKkmeFalxZK5gUK0GnbnuF0AF0shNYmBzAQ3VwQ=;
	b=SXnWlpAyvZzmBomC3A5uPBnWTogVS7O6rR4x46N4+k0X+OB3PdFxLjt86bk5wrsSjJ
	MlrUyZcATFD778nUX+MLJacNuYAb2EvQ6l/sNgQ3tjFlCrnkXbR5+ydIMTW1ODfXQlET
	eejEs3tX7Qu2x4EtY+5Gw8/Rj2ZM8z2A5uifZIF+WtrwuPgfSpMXWrankTnBgedQy4jh
	egWnqODq6VX+FbaSNeZ04KcHAFm/JqHFdZS/Ssw+4vNoBIqbwgcRUZhKZPlK4v6hmYXS
	EgfDkOweNscjfMlLhEQx7vfgrkj+YiY5El30QREa94d+OjMGNOUr24BjLKkWEQGI9aE2
	dIzA==
MIME-Version: 1.0
X-Received: by 10.60.123.66 with SMTP id ly2mr6697091oeb.53.1368185961744;
	Fri, 10 May 2013 04:39:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Fri, 10 May 2013 04:39:21 -0700 (PDT)
In-Reply-To: <20130510104002.GC12329@jama.dyndns-home.com>
References: <1368113145-17108-1-git-send-email-otavio@ossystems.com.br>
	<20130510104002.GC12329@jama.dyndns-home.com>
Date: Fri, 10 May 2013 08:39:21 -0300
X-Google-Sender-Auth: jCoXBCHNkdvrn40XospAkUSidgw
Message-ID: <CAP9ODKoALkAC-MzS1wW1z=+O8DnpXS-eBTqSMwGo5W3KBAgCxg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH] samba: Add usershare directory to the package
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
X-List-Received-Date: Fri, 10 May 2013 11:57:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 10, 2013 at 7:40 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, May 09, 2013 at 12:25:45PM -0300, Otavio Salvador wrote:
>> Change-Id: I0d9ad638c62cca929cded60752dbf75fc100017f
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta-oe/recipes-connectivity/samba/samba.inc      |    3 +++
>>  meta-oe/recipes-connectivity/samba/samba_3.6.8.bb |    2 +-
>>  2 files changed, 4 insertions(+), 1 deletions(-)
>
> Is this from danny? Please rebase and test your patches in master when
> you're sending them for master.
>
> I did it manually again and also removed Change-Id.

I think I ended sending it from danny branch. Forgot to rebase it, sorry.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


