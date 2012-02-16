Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyWx-0006wQ-FO
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:25:39 +0100
Received: by vbbff1 with SMTP id ff1so1553003vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=obwnaB/73smn4QychukpKXHHwCTbNkPU/MZuDZZzI/Q=;
	b=DOZHOeDBrdTdmSUGXa4h+qzl7NLCzoYcbvu4E/9W+rNfxhxiJk7TyZi3rXxxPGEtOO
	5ioACMqvPD6JRhJCDZIwpbuCyZSALqzy9w467pcLspALa2TbLLjduor6VMA1Q4Ku860f
	q/WIhkfd5KgSRUFqa0rEBINGTiI32EbgGLzX0=
MIME-Version: 1.0
Received: by 10.52.72.107 with SMTP id c11mr765073vdv.48.1329387445082; Thu,
	16 Feb 2012 02:17:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:17:25 -0800 (PST)
In-Reply-To: <CALbNGRQRELS3EARwj8ssK0MyuDJaBbebDrDcunGrwRMm89jV8A@mail.gmail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-3-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKo=b4rnmQb756h4NoSnVh3+D=SPak=-92rZ9W_5qN_VvA@mail.gmail.com>
	<CALbNGRQRELS3EARwj8ssK0MyuDJaBbebDrDcunGrwRMm89jV8A@mail.gmail.com>
Date: Thu, 16 Feb 2012 08:17:25 -0200
X-Google-Sender-Auth: I7WbH5af8HYeUeCGWmNmhBKcCOo
Message-ID: <CAP9ODKrX3w4d1_zWZZ6hD0ADeY4m2TpmTj=Jh=pHaR8mw3GP3A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 02/22] systemd.bbclass: enhance checks for SYSTEMD_PACKAGES and SYSTEMD_SERVICE
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
X-List-Received-Date: Thu, 16 Feb 2012 10:25:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 08:14, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> I'll wait a bit in case there are further comments and update the
> commit messages affected in V3.


I think you can do it on the 00/XX message and avoids another cycle to
remove those from each patch.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

