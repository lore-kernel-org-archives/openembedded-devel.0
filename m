Received: from [209.85.134.186] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <matt.callow@gmail.com>) id 1HqiJ2-0006ii-CB
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 May 2007 06:18:36 +0200
Received: by mu-out-0910.google.com with SMTP id w8so6614mue
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2007 21:17:39 -0700 (PDT)
Received: by 10.82.184.2 with SMTP id h2mr242971buf.1179893859705;
	Tue, 22 May 2007 21:17:39 -0700 (PDT)
Received: by 10.82.185.9 with HTTP; Tue, 22 May 2007 21:17:39 -0700 (PDT)
Message-ID: <5937bed10705222117h314bc92cxc26261af9fcb2fb4@mail.gmail.com>
Date: Wed, 23 May 2007 14:17:39 +1000
From: "Matt Callow" <mc-lists@tesco.net>
Sender: matt.callow@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ae36f8040705221856p1ec52709y284a370bbc1af3ee@mail.gmail.com>
MIME-Version: 1.0
References: <ae36f8040705221856p1ec52709y284a370bbc1af3ee@mail.gmail.com>
X-Google-Sender-Auth: 299e2804f16d61f2
Subject: Re: problems cross-compilinx xserver-xorg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2007 04:18:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 5/23/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
> Hi I'm trying to bitbake xserver-xorg (cvs version) and I received the
> following results:
>
...
> sh: quilt: command not found

This looks like your problem. Try installing quilt.

Matt


