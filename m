Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHGKI-0006QO-NL
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 16:44:02 +0200
Received: by bkat8 with SMTP id t8so5189141bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=C2RNf/ix+svZQXS5VRJCDQRxXwh/k6FXkfe9HER7OVI=;
	b=XhN/bAGN6mPiNgNuqAM1WYE1HYcIBA6LVlnCP9Hkktss1jrYaJegxtloVIYOSpLdU1
	WrM12ibZHnat/DN2Nm9tBfZaOoFWRpiP3Y31pbpXzjYITn1QvkwOe6WoL5mhcIOtVbbl
	ECiw/QWuga4Ecx/lIdPuv5EnCRZtBd+ZGK8CQ=
MIME-Version: 1.0
Received: by 10.204.15.194 with SMTP id l2mr10840223bka.83.1319207889105; Fri,
	21 Oct 2011 07:38:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Fri, 21 Oct 2011 07:38:09 -0700 (PDT)
In-Reply-To: <j7rvkf$i6m$1@dough.gmane.org>
References: <cover.1319205291.git.otavio@ossystems.com.br>
	<db76597e3a3c1e747f762e1944363700535512c3.1319205291.git.otavio@ossystems.com.br>
	<j7rvkf$i6m$1@dough.gmane.org>
Date: Fri, 21 Oct 2011 12:38:09 -0200
X-Google-Sender-Auth: 0taq6huwZqp5C71_3_d8Co-Tvbg
Message-ID: <CAP9ODKrYA5bvMjR30kNvPdTjgipqt8J+gNssw4A83tQ5UxL56w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/5] systemd: add systemd-initramfs
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
X-List-Received-Date: Fri, 21 Oct 2011 14:44:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 12:29, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
...
> ln -s ${base_bindir}/systemd ${D}/init
>
> shall I fix it myself or do you want to send a patch?

If you can amend it and push better, so I just rebase it here and
avoid another pull request.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


