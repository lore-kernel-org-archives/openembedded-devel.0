Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S3VTv-0000Up-1D
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Mar 2012 17:37:23 +0100
Received: by vcbfl13 with SMTP id fl13so1709473vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2012 08:28:51 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.99.231 as permitted sender) client-ip=10.52.99.231; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.99.231 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.99.231])
	by 10.52.99.231 with SMTP id et7mr17210706vdb.114.1330705731652
	(num_hops = 1); Fri, 02 Mar 2012 08:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0uZPOIwK88vMAlZVE0SAy4OwAZox59OcOjRbua0A5XU=;
	b=ll7KzKLBiRZb+mNedNF1hoQvyCyzJgNlxJ46ICRiSOCzv9u8HZk/UZOZUwp7IuhRn9
	ylTOnzxC6I01HQyO1PvVx/zUYvlhig0/UyTVcAcp+ExP2ORsduFwkE5EWJnCfyoKbias
	wgD9GyrMe1Ogn1f+n81NCNCZa4F1IjAOrIEGy4rCFwH5pZsjYz6PLvY7UvPNE8j+PW2q
	P/CxT2haMQuABVEjrXF5SppZDKrRqO8t9sUv5HDt+OChrHrUi6v3qcQ+rNgGz3xjkkXW
	+v1+7zkXDN+aXgvxUN3Dg+l9luuC/qgF/07OdFh/qCJ6pZEoQSuvKWq4NLLZNVfep7+9
	k5WQ==
MIME-Version: 1.0
Received: by 10.52.99.231 with SMTP id et7mr14664719vdb.114.1330705731586;
	Fri, 02 Mar 2012 08:28:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Fri, 2 Mar 2012 08:28:51 -0800 (PST)
In-Reply-To: <4F50F2C9.5000407@mlbassoc.com>
References: <4F50F2C9.5000407@mlbassoc.com>
Date: Fri, 2 Mar 2012 13:28:51 -0300
X-Google-Sender-Auth: rBDN322BbvQDtANsUXAab7BlAiA
Message-ID: <CAP9ODKpHHh+kmNC6jAJ1UrQ69i7_8nx4yNTWBbm-m9aDEStQNw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org, 
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Why can't I build firefox?
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
X-List-Received-Date: Fri, 02 Mar 2012 16:37:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 2, 2012 at 13:18, Gary Thomas <gary@mlbassoc.com> wrote:
> I'm not sure if this is an Angstrom specific issue, but the same basic
> process _does_ work when I added the meta-mozilla layer to my Poky
> setup (hence the paths above)
>
> Ideas?

It seems to be related to Angstrom or some mistake in your setup.
Koen, do you have clue?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


