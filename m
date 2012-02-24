Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0jjC-00015v-R0
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 02:13:43 +0100
Received: by daln34 with SMTP id n34so1634187dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 17:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.68.217.42 as permitted sender) client-ip=10.68.217.42; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.68.217.42 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.68.217.42])
	by 10.68.217.42 with SMTP id ov10mr1110478pbc.85.1330045519848
	(num_hops = 1); Thu, 23 Feb 2012 17:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CXHGM7qZ8KH2W9x5PFMNYA611IRdkXvjhKmOujlHsec=;
	b=Ecl2mvd7EJNqjc51unmkDZGdJ3aVH6TOjjYAHqktdORVNc59DWBaWvTprWv5BElM8E
	3AZmyd5u4FtM5Sg9GneWWSVGZQBqbPEDiaePbizfItxxKl+L11T1Ktz3q2VHOfP/bfiw
	auUUD7FIrNRTFEwzExDhxTIC6JdewmjtW3xII=
MIME-Version: 1.0
Received: by 10.68.217.42 with SMTP id ov10mr914476pbc.85.1330045519754; Thu,
	23 Feb 2012 17:05:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.231.36 with HTTP; Thu, 23 Feb 2012 17:05:19 -0800 (PST)
In-Reply-To: <1330044594-17032-1-git-send-email-schnitzeltony@googlemail.com>
References: <1330044594-17032-1-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 23 Feb 2012 23:05:19 -0200
X-Google-Sender-Auth: 8aYhE1odYBw_k2ZLE_lh2RUBe5k
Message-ID: <CAP9ODKpDgFYKp+HvpMKsnbe=CLY9=ifY+8oVSa-5uWwnm2e6Tg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] dhcp: follow oe-core's update to 4.2.3-P2
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
X-List-Received-Date: Fri, 24 Feb 2012 01:13:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 22:49, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> rename from meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
> rename to meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend

Change PRINC back to + 1 plz.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


