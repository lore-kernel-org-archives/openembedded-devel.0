Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0YCR-0007pk-Uf
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:55:08 +0100
Received: by daln34 with SMTP id n34so1071818dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:46:45 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.68.222.72 as permitted sender) client-ip=10.68.222.72; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.68.222.72 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.68.222.72])
	by 10.68.222.72 with SMTP id qk8mr3905334pbc.1.1330001205895 (num_hops
	= 1); Thu, 23 Feb 2012 04:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=O+h4Rc/kFDE6IWz9mnQJnqV26pB1IjCFD+yKZH7NdVE=;
	b=aD7R0FSodCk520ciDPzhucrsN/c0E37FEqbU5dDb5Jg8WuC5VVs3rv5ePCLEH3uwf/
	TeTw2oUdhG5T4QgCEgLbV55IxbgcD72NlnF9n8tGukHkgjRytRC+HQTfZ4FIrmi2Pnsz
	wCtBqqo3AehzeGU19ALHkFbOnCy+JjnNfgdB8=
MIME-Version: 1.0
Received: by 10.68.222.72 with SMTP id qk8mr3305510pbc.1.1330001204190; Thu,
	23 Feb 2012 04:46:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.210.71 with HTTP; Thu, 23 Feb 2012 04:46:44 -0800 (PST)
In-Reply-To: <20120223123938.GQ3769@jama.jama.net>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
	<20120223123938.GQ3769@jama.jama.net>
Date: Thu, 23 Feb 2012 10:46:44 -0200
X-Google-Sender-Auth: zk9PdHo6kJWXqxpawWM-Bk1gq-4
Message-ID: <CAP9ODKpoB7jd+rLDyxZqnCfAoEsRp-tNmL5Oev_wDvdq7pEfkQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe V3 00/23] systemd rework
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
X-List-Received-Date: Thu, 23 Feb 2012 12:55:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 10:39, Martin Jansa <martin.jansa@gmail.com> wrote:
> I have patch for few:
>> meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
>> meta-oe/recipes-connectivity/gateone/gateone_git.bb
>> meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
> and networkmanager

Please send them above this patchset so we can get them pulled
altogether if does fine. :-D

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


