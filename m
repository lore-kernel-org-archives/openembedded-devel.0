Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0xA5-0003VU-7u
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 16:34:21 +0100
Received: by vcbfl15 with SMTP id fl15so348932vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 07:25:58 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.99.231 as permitted sender) client-ip=10.52.99.231; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.99.231 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.99.231])
	by 10.52.99.231 with SMTP id et7mr1404527vdb.114.1330097158140
	(num_hops = 1); Fri, 24 Feb 2012 07:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=J63BepMPoofY5La8JnoD6Bt92ImRV/XCH4e8+IeWINw=;
	b=RPJXXqxCLkesqB6acJAftrnIT/ViFU4RY6OCNzhHSwCdhb3NTxkf1jChWCY0SvtpEC
	eT2zZYvlsfwR4z5pR2wiOji90Pm3Vtqcar8PTehzYCo/nrWa9O3f5HnQhUQFp5gBRWRB
	iQUP9bwh9DxuTYMoUvApcnPpZvQAvRNbp0/0E=
MIME-Version: 1.0
Received: by 10.52.99.231 with SMTP id et7mr1123601vdb.114.1330097157747; Fri,
	24 Feb 2012 07:25:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.203.74 with HTTP; Fri, 24 Feb 2012 07:25:57 -0800 (PST)
In-Reply-To: <CALbNGRTSMK=jUUNasU+4TAOajUMythNBxys8xLHGzN6b+7peAw@mail.gmail.com>
References: <1330084384-1267-1-git-send-email-schnitzeltony@googlemail.com>
	<20120224122806.GI3769@jama.jama.net>
	<CALbNGRTSMK=jUUNasU+4TAOajUMythNBxys8xLHGzN6b+7peAw@mail.gmail.com>
Date: Fri, 24 Feb 2012 13:25:57 -0200
X-Google-Sender-Auth: Qqoxook_Ii_rZ-fQJMd7qToE4EE
Message-ID: <CAP9ODKpk1HbWZx8zxpDAxJ7wFei0mMHhzYJbUoMC+YEhyB7-MQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-mozilla 1/2] firefox: change URI to fetchable ftp / bump to 10.0.2
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
X-List-Received-Date: Fri, 24 Feb 2012 15:34:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 12:41, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Ehm I did not create them: I let the very nice script in /scripts do
> that - a bit off topic: I already started to create such a script
> before I saw it is already there :( So Otavio what was your intention
> on starting at ${INC_PR}.1?

In fact no; my fault ;-)

You can fix this as well ...

If you have a github account you can queue a pull request otherwise
just send the patches here and I grab them.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


