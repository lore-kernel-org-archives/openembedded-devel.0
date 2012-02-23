Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0daK-0002eq-4Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 19:40:08 +0100
Received: by vbbff1 with SMTP id ff1so1149172vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 10:31:46 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.220.151.5 as permitted sender) client-ip=10.220.151.5; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.220.151.5 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.220.151.5])
	by 10.220.151.5 with SMTP id a5mr1775384vcw.8.1330021906070 (num_hops =
	1); Thu, 23 Feb 2012 10:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Vp0b46bFHV/L38aVqWVDOyL2cOu+twAc9LyzUg01Gvk=;
	b=c0mRjDvcYU7jFmyA3HQRTOGmDMzoAV0+Ao/T+0q8cIw2NeX0OO/PG/JDRQsOdzXacj
	nwrQ0Y/bdKWl1yLo3HkOxi422A9R+3+BNT/ydPkdpfddz4JYqK675GD9XSXrbdfZZjRZ
	MsvsSxmA8EHLwcPMAlbZf5R0PzPOEpBWXaxOw=
MIME-Version: 1.0
Received: by 10.220.151.5 with SMTP id a5mr1474916vcw.8.1330021905996; Thu, 23
	Feb 2012 10:31:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.203.74 with HTTP; Thu, 23 Feb 2012 10:31:45 -0800 (PST)
In-Reply-To: <CALbNGRRWfTtgVQmdCK5DqEriMeYtT4raCkwZgLxWjWa4Z7zfjQ@mail.gmail.com>
References: <CALbNGRRWfTtgVQmdCK5DqEriMeYtT4raCkwZgLxWjWa4Z7zfjQ@mail.gmail.com>
Date: Thu, 23 Feb 2012 16:31:45 -0200
X-Google-Sender-Auth: o5kv1mu_pUpepTi8RFy4KWYgi5I
Message-ID: <CAP9ODKrhY9JgY90PqgPyCwfdkLcXd5xjjE1gixGMvvdMX_b=EQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-mozilla] firefox does not fetch
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
X-List-Received-Date: Thu, 23 Feb 2012 18:40:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 15:15, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/10.0.1/source/fire=
fox-10.0.1.source.tar.bz2
>
> but it seems that has a different checksum so I did not want to jump into=
 this.

If you have time (and enough energy) you might update it to 10.0.2 and
move it to the ftp on same changeset.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


