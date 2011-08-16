Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QtKwy-0003WK-60
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 16:49:04 +0200
Received: by vwe42 with SMTP id 42so3788383vwe.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=nfMAVHi1ncjAcmxcRZvD2EMg8cxDhX/wHxx1VlTzPEA=;
	b=c24fkwq1tRXQRDN4IFbB5OgaoGOnJs2bwmNTkLKqdRplbg0jH26b86+s58qCl9UE1q
	bon30+kCZ7KD7J4v0lbMEPRq2b2UIsWSODRJIBcmQKd+fjC33fijIorwz95y0e9Flwcd
	c0ShRMpUvYrVM05SiMDR94igU/MeMfMXwmqnU=
Received: by 10.52.180.67 with SMTP id dm3mr5006125vdc.230.1313505866089; Tue,
	16 Aug 2011 07:44:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.108.229 with HTTP; Tue, 16 Aug 2011 07:44:06 -0700 (PDT)
In-Reply-To: <CAPdp9mxsurYvis_uTuYOFAxcjRW=FF8aVUZ6SrzwJNrPAP4zBQ@mail.gmail.com>
References: <CAPdp9mxsurYvis_uTuYOFAxcjRW=FF8aVUZ6SrzwJNrPAP4zBQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 16 Aug 2011 07:44:06 -0700
X-Google-Sender-Auth: Y9Fr4m4UUBP-zoAUUScLMdaEm-U
Message-ID: <CABcZAN=8u78LTN79nFZXYkPw8W0gF=WOWFSLnoXa-ysR91qDhQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Issue of OE with Ubuntu 11.04
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
X-List-Received-Date: Tue, 16 Aug 2011 14:49:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 5:41 AM, Rizwan Shaik <rizwancodes@gmail.com> wrote=
:
> I was trying to build the OE desktop image for the PXA300 board in Ubuntu
> 11.04 and was facing the error of
> =C2=A0> not able to compile the package guile-native-1.8.5.bb
> Except the above error all the other packages were build.
> I have mailed the same error to "OE developer list" and was not able to g=
et
> any solution.
> So, I tried the same build or one can say continued the build in "Ubuntu
> 10.10" and was able to sucessfully build the package guile-native-1.8.5.b=
b.

I think you'll need to provide more information than this, like the
exact log message from your guile-native failure, as I and others do
builds on 11.04 every day.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


