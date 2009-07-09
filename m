Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MOuVJ-0007K0-Cw
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 16:21:43 +0200
Received: by an-out-0708.google.com with SMTP id c5so75874anc.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2009 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=X46d0Cn9kvdLaIkwHgwg3EH2bqMpxgbiPvgoHszYOPM=;
	b=i1dnrxZilmD5HyxDOA6rhVE3ZUQR5x2uFTAG1WnQdTjuzSLMX7nqMoENMMW3hpZsJt
	ga7EnF+M1UzPiZdaCgUmLu8hOpCuwASO71505u8qgaSuA5E2dUtcHQH55cdvTWQn81ec
	WitydfGJsOsWG9iA53jKUSsjhAGr7cHCzMtRg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VK1nAMlcUZx1ead8bJ2F0QzPWH9HMaBSOgOFsqkTHSIyhQg9Zi44zhrMYNsDdXF8XI
	0JbChTLqqpObLWwaYiyd5K6tmd8BqDuHBQS0sNcRBNMHZm5ggQbAzw2WB0snoKdCuoN8
	SRKA7z1q2MpwER87SLdDu9P4KjhXLAzVkfwI0=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.215.12 with SMTP id n12mr1098152ang.154.1247148535317; 
	Thu, 09 Jul 2009 07:08:55 -0700 (PDT)
In-Reply-To: <be7a9f3d0907090612k3babae30h64d0424a4fe8dcc0@mail.gmail.com>
References: <be7a9f3d0907090612k3babae30h64d0424a4fe8dcc0@mail.gmail.com>
Date: Thu, 9 Jul 2009 11:08:55 -0300
X-Google-Sender-Auth: 7bb5248bc82410fc
Message-ID: <be7a9f3d0907090708n76b215d0id9b0ab7364f5b61e@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFH] Stable qemu-native BROKEN
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
X-List-Received-Date: Thu, 09 Jul 2009 14:21:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jul 9, 2009 at 10:12 AM, Otavio Salvador<otavio@ossystems.com.br> w=
rote:
> Hello,
>
> Last changes on stable has broken qemu and it doesn't compile anymore for=
 me.
>
> It would be nice i f someone could take a look at it =A0since it is
> quite critical for stable.
>
> Attached the log.

http://pastebin.ca/1489573

Forgot to attach it, sorry

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


