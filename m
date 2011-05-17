Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QMR2z-0001L0-Cl
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 22:39:20 +0200
Received: by bwz5 with SMTP id 5so923727bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 13:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bKax7WG+PMFXM7vQQV/ZHVAx/yyFApOh1xoS9iVHKo8=;
	b=xFzOZyn5scl+z/5YnjCyJ84fQlkeDaxWrhp7PfV6AxBFXXqDfQT+LNl+rmiEu7EGjW
	bj6JK47USzf29LkHHDlqTTZpGtjhuln52Z2AVFiI6OKxCLLwv/0/Brp4U3V2RmpYA4LC
	006dRzyJNAYPb/yB2y4HDxtvZ6hspyyhyxlHI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Jq3WsT/ZUtPXQzDtFim9ph88o15B4H+A29bhCaJ/0v8vws+6IwV7m/8uIip0bNc5gn
	qZydu5J4RWEae6U0UfJgbrZSZbmkt+oCpFDAdSeLeVoTTin+97wXSaukuUMnWXBgaajz
	1fB112S6PEMoT5ehu7lhxEVTlG56+DfiRi4OU=
MIME-Version: 1.0
Received: by 10.204.41.2 with SMTP id m2mr1031388bke.54.1305664551176; Tue, 17
	May 2011 13:35:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Tue, 17 May 2011 13:35:51 -0700 (PDT)
In-Reply-To: <1305663890-20372-1-git-send-email-raj.khem@gmail.com>
References: <1305663890-20372-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 17 May 2011 17:35:51 -0300
X-Google-Sender-Auth: 4QKjd7Vyx0_wlLVqVUUhuxHbbi4
Message-ID: <BANLkTinDjxwtBSQkQ-fbAKxR7JzNiaAo+A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] uclibc_git.bb: inherit gitpkgv to get PV
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
X-List-Received-Date: Tue, 17 May 2011 20:39:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 17:24,  <raj.khem@gmail.com> wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> use GITPKGVTAG for PV
> Cleanup unused UCLIBC_BASE

Is it working for you? here, with freerdp, it doesn't.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


