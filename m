Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyLS-0005Ay-VM
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:13:47 +0100
Received: by vcbfl15 with SMTP id fl15so1579324vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=0I1eb3fRI0Tre0ezrb6YHxC600oFEiNnt2xWO7nN6DY=;
	b=IhKKIMsoflCe/D/yE+VKxJl34g5EU4q+uAxu9fGfgrytZSmjMyer4sEKudVeI0LNDE
	opK/WpfazE6iYRfHblTFAyUgvYbp21K/1XUdBCdVqfdQvoaOUI9cueChFHB1rPfKYWiQ
	Lu9WYjze0apcrk8YzQqbLk4Dt8nnHas2pwIFY=
MIME-Version: 1.0
Received: by 10.220.108.70 with SMTP id e6mr936522vcp.74.1329386732067; Thu,
	16 Feb 2012 02:05:32 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:05:32 -0800 (PST)
In-Reply-To: <1329357796-27398-8-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-8-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:05:32 -0200
X-Google-Sender-Auth: g1NJIlAeSsvFYy34SFpgO77C0cA
Message-ID: <CAP9ODKpFAs+N8ORbqJ6j91gbKPLmnGVna8H_Dp+uYuoc+_tvLQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 07/22] systemd.bbclass: automatically extend RDEPENDS for *-systemd packages
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
X-List-Received-Date: Thu, 16 Feb 2012 10:13:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> * append systemd:  functionalty moved into systemd_add_rdepends
> * append base-pgk: create warning if *-systemd package already rdepends
>                   it's base package
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>



--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

