Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RybUU-0005ie-4A
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 05:01:42 +0100
Received: by vbbff1 with SMTP id ff1so3019224vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 19:53:26 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.72.107 as permitted sender) client-ip=10.52.72.107; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.72.107 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.72.107])
	by 10.52.72.107 with SMTP id c11mr5488003vdv.48.1329537206823 (num_hops
	= 1); Fri, 17 Feb 2012 19:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=jM9jgm6he2/2lc0sJ9F/MDfwzOThjL8R87UyoVuC5Fk=;
	b=sBoSt8w57SjmfDYvjImd0EAeE1kw2hEIFkKqmpvrl/2b8Y/uC0YITZR816ptwmwXog
	W87TeI9qwIUoCTe7Vq14hztWqebw3mj+XIJeOeMxQOoWRfHYhG2lMmxZ4Qp4/rw08x60
	MvLcHAhrWFDIp1yxM90Q4JFkoGYElIZgdLF8k=
MIME-Version: 1.0
Received: by 10.52.72.107 with SMTP id c11mr4446906vdv.48.1329537205519; Fri,
	17 Feb 2012 19:53:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Fri, 17 Feb 2012 19:53:25 -0800 (PST)
In-Reply-To: <20120217223333.GL5822@jama.jama.net>
References: <cover.1329500479.git.otavio@ossystems.com.br>
	<ec40b0cf0436738ab76988ab5d41618a72c4d3c4.1329500480.git.otavio@ossystems.com.br>
	<20120217223333.GL5822@jama.jama.net>
Date: Sat, 18 Feb 2012 01:53:25 -0200
X-Google-Sender-Auth: _8vx_Sdx0r7Z4VgiRzHibJkmX4s
Message-ID: <CAP9ODKpP-w1BfLpFnmUcTGKCpyBMn7ma=c1HKfBWs4iJZC2qBw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH][meta-oe 3/7] polkit: depends on systemd
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
X-List-Received-Date: Sat, 18 Feb 2012 04:01:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 17, 2012 at 20:33, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Feb 17, 2012 at 05:42:31PM +0000, Otavio Salvador wrote:
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >  .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 +++
> >  1 files changed, 3 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
>
> This looks like that old version I had commented before, please update
> it.
>

Please send me a patch that works for your need since I didn't fully get
what you wanted on it; in this case I can merge it on our tree and send an
updated patchset.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

