Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pnu8C-0000i9-Uz
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:37:57 +0100
Received: by bwz10 with SMTP id 10so3083567bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 06:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Wy2pauMTDAhr/jn6MZY+sr/KNWw5aE7/6Za9h9DH86I=;
	b=JSLTbFVQlNqwAsyhV0O80ry2eraCX1Fz/iIFGgFhBK9YSq10pGSq2YdQgZZW/X0CGl
	yywlHplfeUACHa3nkFj9CorZMONnkoXbKi2s0farO4GRYBbtV+d5QDe1Oub8Mzdprso2
	YoILbpVGhU3chvUXfc2aYW3xm1FRRqGXCCRVA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=F1XHfCW6yiSzfD8qAASDY2x7UXinTyc9pd4jYTyQfQoshKzdwJLYYhTHF/41XG527s
	JxZHITblVZ1NHYH6DK0nn3Mq4Up8LsMBoTQiJ/ppzEUA52dFNLwD2AdBR68C/j8jIQwK
	lZ95JVVQb7VlupowGojV6Ynt/tGpPgwoDE7xU=
MIME-Version: 1.0
Received: by 10.204.102.146 with SMTP id g18mr22666109bko.163.1297435010349;
	Fri, 11 Feb 2011 06:36:50 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.56.135 with HTTP; Fri, 11 Feb 2011 06:36:50 -0800 (PST)
In-Reply-To: <1297428596-27694-2-git-send-email-obi@opendreambox.org>
References: <1297428596-27694-1-git-send-email-obi@opendreambox.org>
	<1297428596-27694-2-git-send-email-obi@opendreambox.org>
Date: Fri, 11 Feb 2011 14:36:50 +0000
X-Google-Sender-Auth: tfcZkH127I7e8Dlr399b19-r4Rw
Message-ID: <AANLkTi=MFiJGE4r2R6jJOmkM4WSw1QM9i9RTQu2c7xD0@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [PATCH 2/2] busybox: create busybox-inetd package
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
X-List-Received-Date: Fri, 11 Feb 2011 14:37:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2011 at 12:49, Andreas Oberritter <obi@opendreambox.org> wr=
ote:
> * Create package if CONFIG_INETD=3Dy.
> * Use update-alternatives with priority 50.
> * Install initscript and inetd.conf.
> * RPROVIDE inetd
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Eric B=E9nard <eric@eukrea.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


