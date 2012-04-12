Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SIQxB-0001Pm-AV
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 22:49:17 +0200
Received: by vcbfl13 with SMTP id fl13so1900783vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 13:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nIzMRceyib8JAJxbamD6URaVBHvouYXXqVvoRIKzRgc=;
	b=L/FklLD9wZZbvOGwxK1u4klH6+6wQ3EHd31Qjv6cPb/tObRtcfqgKJ7AJtuk9j5BaW
	zaeLerOJkd71p+hlorsdwXSPmkAarG9lqYtnp5LhJg54DoNLlWgNeAmMeCxwxAuyut+I
	ZBjzyO3popUqU1wwygHwBpf1M1F2qEcOqAaCEkwRDxTGi1AejJX+Oj4VORWl8n8UPJEe
	lPByU10DVJuuxxJj2ylHgWN9BVhNxLzBpJ64hSyhbVjjpGJi+vVF5AQmUbGFft9/LOG0
	os/wBmMN+NXYQICdbCsJXSYCs+K+OKXCVsyYt1q8+YkHJTssf2bcgz2ZeYnxisEFR9As
	eWKg==
MIME-Version: 1.0
Received: by 10.220.154.2 with SMTP id m2mr1983386vcw.55.1334263196305; Thu,
	12 Apr 2012 13:39:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Thu, 12 Apr 2012 13:39:56 -0700 (PDT)
In-Reply-To: <1334150099-22175-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120411130737.GC3637@jama.jama.net>
	<1334150099-22175-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 12 Apr 2012 17:39:56 -0300
X-Google-Sender-Auth: JgLf8bD5Ih8TtnK7UWifYVoRdpQ
Message-ID: <CAP9ODKp_mhReZoiAE7sajvAw_QuuxbneFj3Xgdqw9eqPsBuz1w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] xserver-common: use git patches and add functions file
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
X-List-Received-Date: Thu, 12 Apr 2012 20:49:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 11, 2012 at 10:14, Martin Jansa <martin.jansa@gmail.com> wrote:
> * otherwise we were depending on initscripts to provide it without RDEPEN=
Ding on it
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


