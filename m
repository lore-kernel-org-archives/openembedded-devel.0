Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Ow6MQ-00069n-Fm
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 06:46:15 +0200
Received: by iwn2 with SMTP id 2so732843iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 21:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9BAwhEZU5KOFe41F1NBI9kwyHbYga2RZAzGtn382CqE=;
	b=wI+5M6Pc/2NcW61A/f8BNJzAZdogy0lpYEiG0KQDC9WrHKR/rGkLpT6jQUr775Ub/I
	T+bv7G7S1WSnUkwUqoPnlAZOCWBFMqhaoj0DqbfgcOlcE3LydQRmYqeAd5mvkw0guduU
	QyrKfQNgAPT5t83RO7n0CYNP6dq0D35FEKkeI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FAL0m8lfhz4Tse5xL/+8jDbfN72eXot1SfSrDw5R5K+w+EjMYFMovBTjpvFUN7Ybj0
	iFu21qsXekZXJzhIgbs9W7PoUXNEvFx9j1CgZ4ReujWV5aocZr4CdhcZFaXEQVHYmBUf
	LJNexZ8B4Ii3wuMJa19qRFH/2O98+ne+9Pu4s=
MIME-Version: 1.0
Received: by 10.231.169.203 with SMTP id a11mr659037ibz.99.1284612325112; Wed,
	15 Sep 2010 21:45:25 -0700 (PDT)
Received: by 10.231.161.1 with HTTP; Wed, 15 Sep 2010 21:45:25 -0700 (PDT)
In-Reply-To: <4C919DB6.4010603@gmail.com>
References: <4C919DB6.4010603@gmail.com>
Date: Thu, 16 Sep 2010 14:15:25 +0930
Message-ID: <AANLkTin8H_Y4LSA82sDGDL7sqFHFhuR7KJJGHK7Tp-26@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] zziplib_0.13.59.bb: add new recipe.
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
X-List-Received-Date: Thu, 16 Sep 2010 04:46:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 16 September 2010 14:01, Graham Gower <graham.gower@gmail.com> wrote:
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0recipes/zziplib/zziplib-0.13.59/makefile.am.patch | =A0140 +++++++++++=
++++++++++
> =A0recipes/zziplib/zziplib_0.13.59.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 29 +++++
> =A02 files changed, 169 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/zziplib/zziplib-0.13.59/makefile.am.patch
> =A0create mode 100644 recipes/zziplib/zziplib_0.13.59.bb

Please disregard this patch, I did something stupid. Will resubmit
once i fix it.


