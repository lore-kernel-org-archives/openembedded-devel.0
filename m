Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TO6uv-0005V6-MB
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Oct 2012 15:10:41 +0200
Received: by mail-da0-f47.google.com with SMTP id s35so2747265dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2012 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=nRN/u0gmPCJJNYtDsKPVqf0vnnT3PaRXDx0oI4hBcI0=;
	b=VXPgbfd1ZTaCsxLrbiDFN6+fXx7QrIsBtPcIFm2X3qj3uMHG5NkgbZcsgcjbCnIU3W
	SmtC7fzuPyxF7pkUTQczgMYHUtDrB05OWd/rQqezxlwLyVrU7q5crfZRUzdtKUwcrfje
	D7vMTUX2+OehxS5uraud8X3Lnx0OccYpKB+qEPxr1uQJVt9lNElNlD7MQ0s9hJejHFZb
	3/n7gi78iO/1NBH/E5ySTAzGVa8HH+Xa7MLc16hTAHxrdhDyUADcai/J9HroBFmAH9MX
	XB8zZkr09YFgSDIRHTSKMHjLbk52jhJxbTXsEdpILvDuQxCGC6KPy56ZyTo8wt+u+8n7
	+bNQ==
MIME-Version: 1.0
Received: by 10.68.135.168 with SMTP id pt8mr47493725pbb.24.1350392243923;
	Tue, 16 Oct 2012 05:57:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Tue, 16 Oct 2012 05:57:23 -0700 (PDT)
In-Reply-To: <1350376482-10287-2-git-send-email-jackie.huang@windriver.com>
References: <1350376482-10287-1-git-send-email-jackie.huang@windriver.com>
	<1350376482-10287-2-git-send-email-jackie.huang@windriver.com>
Date: Tue, 16 Oct 2012 09:57:23 -0300
X-Google-Sender-Auth: 6BPaM4ossoGv21rizAWKR9MSvQ4
Message-ID: <CAP9ODKoFGV53mCHPO9E1H=ALh7UkQLBypSift0eqBN2rcL6RLw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] ruby: update to 1.9.3-194
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
X-List-Received-Date: Tue, 16 Oct 2012 13:10:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 16, 2012 at 5:34 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> I sent this to oe-core but was told that it's not the right place and
> was suggested to send here.
>
> Most of the 1.9.3 patches originate from ruby-1.9.3.194-10.1.fc17.src.rpm
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

Please add 'Upstream-Status' on the patches.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


