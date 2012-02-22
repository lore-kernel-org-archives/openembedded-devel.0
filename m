Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0DaC-0003aw-PE
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 15:54:17 +0100
Received: by vcqp1 with SMTP id p1so86192vcq.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 06:45:56 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.23.5 as permitted sender) client-ip=10.52.23.5; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.23.5 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.23.5])
	by 10.52.23.5 with SMTP id i5mr14763837vdf.50.1329921956134 (num_hops =
	1); Wed, 22 Feb 2012 06:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=QwFXk0vRlFkZ3LRYL/OE2nA93879lnz28MIlcJI52HY=;
	b=M87RVWc+TNLU9uGLspRCU2EszP3Vbe25qOrh/z8cG8ISG9T7FO1FMgDeuQCYXhpfzZ
	wfnLW1C0z9rEqkMXCdzdeNEztVRdnITu/f1MDEaa8da5KB6kZYIvoydpFAqJVRUc4H0f
	5U920gC5f+hOgLzq5Y4IYpBpMEwRaTPk+FYRU=
MIME-Version: 1.0
Received: by 10.52.23.5 with SMTP id i5mr12025378vdf.50.1329921956066; Wed, 22
	Feb 2012 06:45:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.149.81 with HTTP; Wed, 22 Feb 2012 06:45:55 -0800 (PST)
In-Reply-To: <20120222131548.GK3769@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120220124013.GG3953@jama.jama.net>
	<CALbNGRTeigkZyBQzHogt6EeZSzK80ZP05CKyqHwEOMnaJFZyuQ@mail.gmail.com>
	<20120220160415.GH3953@jama.jama.net>
	<CALbNGRQkNRcf3gHbscAvVFqZv0nGRR5_U2kTHSZ_uVCASWGtYQ@mail.gmail.com>
	<20120222131548.GK3769@jama.jama.net>
Date: Wed, 22 Feb 2012 12:45:55 -0200
X-Google-Sender-Auth: O_vxRmj1366uuXpKDIbjT5LM40A
Message-ID: <CAP9ODKp48zr4Qdpd6K+EX-jztSst3iiB6iDZRo0QSQ=0uytVNg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 00/22] systemd rework
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
X-List-Received-Date: Wed, 22 Feb 2012 14:54:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 22, 2012 at 11:15, Martin Jansa <martin.jansa@gmail.com> wrote:

> Maybe only add that variable for /lib/systemd/system so I can push my
> "systemd rework" patchset for meta-smartphone with this variable
> already.
>

Can you explain why you'd like to move those files?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

