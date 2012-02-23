Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0aFr-00038s-CG
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 16:06:47 +0100
Received: by pbbjt11 with SMTP id jt11so723112pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 06:58:25 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.68.213.136 as permitted sender) client-ip=10.68.213.136; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.68.213.136 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.68.213.136])
	by 10.68.213.136 with SMTP id ns8mr5197659pbc.43.1330009105282
	(num_hops = 1); Thu, 23 Feb 2012 06:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Oc0l4WMKbAgSult0OeqemGEvYa3MQhABz176+oCE6YE=;
	b=cpLQ+rT/pG+G7vJXmjduKAk/WB3WEHp4ETeKe0oC5e65z3nWW9YMHFRaJLmSym8hW8
	p1Rfk2Tp3l4enrlz3TNsewKsUxTQ6k2gW7Oev+4oxOVQJIQGmWjwnjPnIjiBB36FP6mC
	Sv3YUOfUaeJ2S0ZiyPYnFoOE65AZE3IiJijoU=
MIME-Version: 1.0
Received: by 10.68.213.136 with SMTP id ns8mr4423857pbc.43.1330009105217; Thu,
	23 Feb 2012 06:58:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.210.71 with HTTP; Thu, 23 Feb 2012 06:58:25 -0800 (PST)
In-Reply-To: <20120223145305.GW3769@jama.jama.net>
References: <CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
	<1330000807-30379-1-git-send-email-Martin.Jansa@gmail.com>
	<CAP9ODKpLMpBNSqx0MUuzUbYCcapGrJccojjyQrYHjaN6TNqcSA@mail.gmail.com>
	<20120223125833.GS3769@jama.jama.net>
	<CAP9ODKqGbUADkfqjBDTaD2ASKhZbxAnEMmJ22MsK1w+UKKX8yA@mail.gmail.com>
	<20120223145305.GW3769@jama.jama.net>
Date: Thu, 23 Feb 2012 12:58:25 -0200
X-Google-Sender-Auth: NLNlyWqOzJdOKgcH6ynIiG2Pzuo
Message-ID: <CAP9ODKq0aY94-hZVpYkPVY47tgQ5FBvWStroQsyLpbmXsaB0=w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gateone, networkmanager, cloud9, ntp: use systemd_unitdir variable
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
X-List-Received-Date: Thu, 23 Feb 2012 15:06:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 12:53, Martin Jansa <martin.jansa@gmail.com> wrote:
> splitted and with PR bumps in contrib/jansa/pull

I think Koen would prefer if you resend them so he can get them from
patchwork. Not sure though...

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


