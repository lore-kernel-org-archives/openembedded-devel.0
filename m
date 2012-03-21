Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SALDr-0003EU-RL
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 14:05:03 +0100
Received: by vcbfl13 with SMTP id fl13so1164572vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 05:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=c5c33J8BcoGHSn6ZGkCmNe6Da3lESz2n5TW6XQl+vBM=;
	b=N8iQIIUxHLRZQeTXTy71aGnoeFGKGXyCYAa6q1VPKkWLKOYmjOxjp+0nemVoiqsvq/
	r/P6hE3TV8MpszT4vo18AiZ4ep4nXEHtD3Z3/JwfQaLdISNuozk1LfHywE7PU8LmlHJx
	0Jo/zQt7hBGstIfuvezkcnu9AmTcyXqZyaOhK8G+R83GJyYdJpOn+mXN3VG/AdlLMKoe
	54r4PsnjmTR/6OCvj+N7WSJGXu/nF9UCUfAzgpI4nnJvfeofCUaCaWDheJ2/EaQL/cjj
	8sRxnMRxR2BfRTtj3VtyzDPOruL/CjVKcUZeyfwPt4X3MI4AC6xk0gx4aA5PR7H+iUqe
	8Vrw==
MIME-Version: 1.0
Received: by 10.52.36.81 with SMTP id o17mr1473948vdj.97.1332334569854; Wed,
	21 Mar 2012 05:56:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Wed, 21 Mar 2012 05:56:09 -0700 (PDT)
In-Reply-To: <jkcinl$t91$1@dough.gmane.org>
References: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
	<1332263919-19283-4-git-send-email-koen@dominion.thruhere.net>
	<CALbNGRRwoJ7MqVFdoCWQC5bmf+HgZD_QV1jUj2Q1nR-jXZWXfg@mail.gmail.com>
	<jkcgem$agm$1@dough.gmane.org>
	<CAP9ODKrOarBHNbQwdFufzzSdDNKYKK49X8QTQ0bT0nzvtYEQaA@mail.gmail.com>
	<jkcinl$t91$1@dough.gmane.org>
Date: Wed, 21 Mar 2012 09:56:09 -0300
X-Google-Sender-Auth: _jTJK9V_xsUqYq-1fwTPyCBFt00
Message-ID: <CAP9ODKqiEdYmEprbvdUhsp4prOaitYtVevSAp3j1ie3MUpDAXw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 4/4] udev: remove 175
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
X-List-Received-Date: Wed, 21 Mar 2012 13:05:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 09:48, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
>> I don't see any strong reason to boost the move as AFAIK everything is
>> working fine with 175 for now. So I'd say to keep on it until libertas i=
s
>> made working with the newer udev version.
>
> Are you committing to maintaining the udev 175 recipe?

I am commiting to nack an move to 18X if it has feature regressions as
it is the case.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


