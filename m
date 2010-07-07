Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OWVXx-0006wd-7U
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 16:24:24 +0200
Received: by fxm12 with SMTP id 12so5848428fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 07:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KbZ6UDgS2oasp5fbNoSBsUcuSeihFxPxImb0ZXF8jyc=;
	b=WW7cHwy3qU1GZKC3iLXj8jv1apU7XW8Ym9Hx6myCupxijaSK0Ay5kCaopQV9/xrcUS
	APNPCIoPbfzJTQ3fXYbjbJ38vg2n2IgtfzRWmmIZVV50PR2/tmud4YBgzCWXFl4BtDNN
	s1AEOWnveZSNH5q/97rBXrV/BhgsO+29Bc7Ds=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PYV/HfyuzuY9sGy+PaXSD4bmMjQFUEF3dLn9//ygpgG2BbREWBFX8OQRggnv9pfvTT
	dBCdFVSJ5bbd0KSWjIVVDlREJSvAkTxM4eRKQNph8GwQXYPIBmnVN6KeJVKJRihTjbnE
	tcG13jOts6z2y9M4h7YPp/QGjacCTvC3V7C7M=
MIME-Version: 1.0
Received: by 10.223.115.201 with SMTP id j9mr5763650faq.59.1278512363258; Wed, 
	07 Jul 2010 07:19:23 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Wed, 7 Jul 2010 07:19:22 -0700 (PDT)
In-Reply-To: <1278396101-30522-2-git-send-email-GNUtoo@no-log.org>
References: <1278396101-30522-1-git-send-email-GNUtoo@no-log.org>
	<1278396101-30522-2-git-send-email-GNUtoo@no-log.org>
Date: Wed, 7 Jul 2010 16:19:22 +0200
Message-ID: <AANLkTikZICrZJLgyP0IoJZU9s_BNsouKXhCBpp-C7Aiu@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] htcdream.conf: use xf86-video-fbdev and xf86-video-tslib
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
X-List-Received-Date: Wed, 07 Jul 2010 14:24:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 6, 2010 at 8:01 AM, Denis 'GNUtoo' Carikli
<GNUtoo@no-log.org> wrote:
>
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> ---
> =A0conf/machine/htcdream.conf | =A0 11 +++++++++++
> =A0recipes/tasks/task-x11.bb =A0| =A0 =A02 +-
> =A02 files changed, 12 insertions(+), 1 deletions(-)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


