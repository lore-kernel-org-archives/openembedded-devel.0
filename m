Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oxaxr-0000PI-8d
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 09:39:03 +0200
Received: by iwn2 with SMTP id 2so4135618iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 00:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7H1xX0aqqNQ26anYrBJnzQi9eNstkaeHftoTwI58tiI=;
	b=jrzwqhmfD6Y3kfUZB0hEM91jlvjLk0aSQ2bjhdXj/1Fe+6XkjON8b7A+PDWljoL4/r
	ze1JFONBpfHD+zTWkqpCghES96PCqXYGGmShYp1zdpiq+RAM3wKoMcGD5Sw04+koeX/p
	2TDezGQAN0cReOJqJemHbjjAt6QVwNEiQB/IQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CknxSDeovd1/EmjGKPSB04+yyES3cGeXNAzx+E2uRPgZbA8bZDJrwR7MqRvGuvsU/V
	qIM3YvDjGpu2+v15cvF98A64yp46IKZfAzXdvqrecL6IiLQfQe2cmQAP546HSfK3qh8e
	/VNVUNABSyWlqP6wposPcM6Q9U/hzNUK4w9mI=
MIME-Version: 1.0
Received: by 10.231.145.1 with SMTP id b1mr10012643ibv.69.1284968287368; Mon,
	20 Sep 2010 00:38:07 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 20 Sep 2010 00:38:07 -0700 (PDT)
In-Reply-To: <4C970C21.7020305@gmail.com>
References: <4C970C21.7020305@gmail.com>
Date: Mon, 20 Sep 2010 09:38:07 +0200
Message-ID: <AANLkTi=jXnzu2VyQSDvZHraw1sE-dZ3wZjnsS_-fJbRT@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] tapioca, farsight: move to obsolete. These recipes are old and unbuildable.
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
X-List-Received-Date: Mon, 20 Sep 2010 07:39:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/20 Graham Gower <graham.gower@gmail.com>:
> =A0* gst-plugins-farsight uses all 6gb of my memory in do_configure.
> =A0 =A0 =A0 =A0Its 4 years old and has been obsoleted upstream.
> =A0 =A0 =A0 =A0http://farsight.freedesktop.org/releases/obsolete/gst-plug=
ins-farsight/OBSOLETE
> =A0* farsight has moved on to version 2, of which there is an in tree rec=
ipe.
> =A0* tapioca depends on the obsolete versions and development stalled yea=
rs ago.
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Confirmed that it is obsolete.
development of farsight moved to farsight2 in 2008.

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


