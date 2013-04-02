Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UN264-0008Pp-5O
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Apr 2013 16:22:02 +0200
Received: by mail-pb0-f54.google.com with SMTP id xa7so257843pbc.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2013 07:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=fqkIgMiif3Tr8QnMES+/O+gbQYnALRw90mLwIibVHls=;
	b=bOw+dEjACgpKuqG4+lujta+Q94XbNUv5+71PdfbWaAeqgae8RpntAD07qxYSOphn1Z
	cq2OFd0Ijd0Y9ErvTnjpsaMpgAieKS/yG3pfywTLYX/nXVqamFmX3KWkSmL08v+yPcnh
	GP8iukhVY5i7XYfIoZQ0zFPNBrEShZnNZuAYUW8G09JMNgc0bzegFbqooB7BG5qFcupn
	VcfM38zJsfcaLG+LU2sDC1YNpIlnk3VKIzgRYNT+YAwyYVACsetUi3fJmdyFgdoEgFsH
	TYGRjB1y2KQgDTvKMJhQ3I7HENGjzUHZ9mvpj6JVuiBKuxlQHuA5jjrskLIdIazV9utc
	xAfw==
X-Received: by 10.68.135.196 with SMTP id pu4mr24384487pbb.111.1364911489410; 
	Tue, 02 Apr 2013 07:04:49 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id wl14sm2508927pac.18.2013.04.02.07.04.47
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 07:04:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1364883895-24252-3-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 2 Apr 2013 07:04:52 -0700
Message-Id: <5C9C4644-9423-4BF7-B4A1-3B1C2544819F@gmail.com>
References: <1364883895-24252-1-git-send-email-schnitzeltony@googlemail.com>
	<1364883895-24252-3-git-send-email-schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [meta-xfce,V2 2/5] exo: add native build
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
X-List-Received-Date: Tue, 02 Apr 2013 14:22:04 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Apr 1, 2013, at 11:24 PM, Andreas M=FCller =
<schnitzeltony@googlemail.com> wrote:

> +DEPENDS_virtclass-native =3D "glib-2.0-native xfce4-dev-tools-native"


use DEPENDS_class-native, virtclass-native is obsolete.=


