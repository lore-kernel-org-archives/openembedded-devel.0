Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PcGkW-0006ic-2d
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 13:21:24 +0100
Received: by bwz10 with SMTP id 10so18237805bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 04:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=rDCEcOQk7vLgZowkf5uG3um03T4f73akXqDmLI3p70k=;
	b=PONhHqjAoLeM8ddql0I+BS/TeXYFw8zHKjrLifFF2zjqfK62IzEfq4H/v0wPzZz4EE
	CuMNLWitaQwEQkC6GHwrpLv8NnEyI9/3H/HmzkSKu8NP2ZkrQIOBbP4zZQ54lMOyzVzI
	aomSOBPQmBa3CPKBNY5c1MMrVr6I6kqyu4Z3U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=PPWouN6OpL4rPJDAtkYedabS1OjJYDUi1uRm2RrY9o/BWN0JsL1qDQzrQYtGy+TG/P
	VBoQ4f6IlVthZfjXHkhh2bpVhcunXewFK92JkVfJrMHqGTyvjs7SKesDNl5HnU0AGIIf
	Vm6mBk1b7ZKFTWpr1BkB1YX1GqzD64aExkMb0=
MIME-Version: 1.0
Received: by 10.204.129.83 with SMTP id n19mr3557755bks.207.1294662054315;
	Mon, 10 Jan 2011 04:20:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Mon, 10 Jan 2011 04:20:54 -0800 (PST)
In-Reply-To: <AANLkTik6N-zh9_o819ipEyu7-k3k5Nt24+GbVTg0q24n@mail.gmail.com>
References: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTik6N-zh9_o819ipEyu7-k3k5Nt24+GbVTg0q24n@mail.gmail.com>
Date: Mon, 10 Jan 2011 10:20:54 -0200
X-Google-Sender-Auth: POQkZmNklc2RitbLPvFqC975dQw
Message-ID: <AANLkTimea7_8xcgXXb751V_Jhk_q9GP7VAUcEupGUrGW@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] xorg: upgrade to X11R7.6 and remove preferred-xorg-versions*.inc files
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
X-List-Received-Date: Mon, 10 Jan 2011 12:21:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2011 at 06:31, Martin Jansa <martin.jansa@gmail.com> wrote:
> Or just push and see who complains? :/

+1

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


