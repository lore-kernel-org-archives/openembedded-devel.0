Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyG0-0004st-1H
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:08:08 +0100
Received: by vcbfl15 with SMTP id fl15so1576380vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 01:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=LvKhGBygRUMxySbIdNSX2hR9x2Lmf01OjkxtHI6mJnQ=;
	b=T5278vtb4ZoYylNGx7NNLCdYq5ao8gJjSO5C/mV8RRUdDNIYSe1qtgrjKBjihxVRCe
	TyHK0kIcn1USNgOSgQx3VLX9LYmINph4JTDc1Ei3chzQf/w4/1d9N2i8zYUPVeGKoueO
	72iFkt62zOMkHaftb2k60qnnRVWrIgjX5Rys0=
MIME-Version: 1.0
Received: by 10.220.116.2 with SMTP id k2mr961898vcq.44.1329386393606; Thu, 16
	Feb 2012 01:59:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 01:59:53 -0800 (PST)
In-Reply-To: <1329357796-27398-4-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-4-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 07:59:53 -0200
X-Google-Sender-Auth: zaaWidtTCTIuL3IeIrCIjqDU1WI
Message-ID: <CAP9ODKp1x51tU5F4TJ-p-uZA0Rnf-MTyS9jq1+uOUADBp1s1vw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 03/22] systemd.bbclass: cosmetics
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
X-List-Received-Date: Thu, 16 Feb 2012 10:08:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:02, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> V1 -> V2: rename systemd_package to systemd_generate_package_scripts
>

Drop.


> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

