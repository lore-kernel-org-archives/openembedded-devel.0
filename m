Received: from [209.85.221.176] (helo=mail-qy0-f176.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MzvR3-0005G7-7Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Oct 2009 18:50:20 +0200
Received: by qyk6 with SMTP id 6so1346021qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2009 09:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=T4n6LfVe+SXfQ22fQm4e8qNTNk1VbicKZekRRQd2lfc=;
	b=CAevpBtq37BE9++WrfS2XOBxMU96Si3CQOx8IE44kWrywHM5ye/KocN5Hr841p8pUE
	8L14cbVTGVHTRx2Qmh3a9Uh8hbsm7mbdC4ZRPvWtR6C9HxeFzNKohh7wH4f2VX7+jQBP
	Wvo97mg+Agv45rlMX/v4k+y1oda92S4B8L12Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=A8hJaOTtCdCX/UdGlSeM65HvMiNi1bhXk++Kvy4vXAq0i5hl1qOK/NBnSvG4Ry6+yx
	x2XO6EZsNVWa0jduiSf7smGvz3oZ0CKKkQQB3wHRXag3GLagGN3Hh9LzLFXLbzHIHRpQ
	KDWWw4eTWs6iCudcn2MOFx/PcoHcijJm9uiE4=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.168.135 with SMTP id k7mr436282hbe.99.1255970956721; Mon, 
	19 Oct 2009 09:49:16 -0700 (PDT)
In-Reply-To: <1255969713.4434.5.camel@hammer.suse.cz>
References: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1255969713.4434.5.camel@hammer.suse.cz>
Date: Mon, 19 Oct 2009 14:49:16 -0200
X-Google-Sender-Auth: 5fecac5816e80673
Message-ID: <be7a9f3d0910190949v365f60cdr424a470ca80536f4@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.176
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Updating kernels to latest stable versions
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
X-List-Received-Date: Mon, 19 Oct 2009 16:50:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Mon, Oct 19, 2009 at 2:28 PM, Stanislav Brabec <utx@penguin.cz> wrote:
> Marcin Juszkiewicz wrote:
>> Some time ago I asked about updating kernels to recent stable patch.
>> There was nearly no discussion on it so this time I am sending mails for
>> review. Did not build checked those patches yet.
>
> Maybe it should be 2.6.21.7-r0 instead of 2.6.21-r13 and do the same for
> other patched recipes.

Personally I prefer 2.6.21-r13 since it allows for easier updating of
machines and also do not demand a image change just to use it.

Since it is a stable update it ought to not include regressions as far
as the patches works.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


