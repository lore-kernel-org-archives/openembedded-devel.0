Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <han.hartgers@gmail.com>) id 1QXwYh-0004oi-Mq
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Jun 2011 16:31:35 +0200
Received: by vxa37 with SMTP id 37so1114626vxa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jun 2011 07:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=nh3iWoEPVmiqnpqCiulMiYMS1Z+h8A7YY+H3Fwrf0ak=;
	b=jOqiYOcz/NlW8bkSBPVTjm7NRvgJDoIXRkDsMMvSntfK0E5H9/7cE//uvz0QJTxwjq
	hMe+BoUcY5Zanjfn4R4sCwf+NxcXk7TxibhtzwC9yk7px2wdYLwTsk/uRAdbYoJ7rktz
	7dDZ4B9BQFgSvMWrZVQyCeSMPmMyhG94Lv2a4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LEapZGIb7on08ktLzkLPn0SeeyedbSFS6jIeDptlNwr9Hkfm7+9/6dGcd3P/uhGSpV
	hxAj0gxa+LTcoQUDLgqB5Qh5BnDLo3kAr+cpmhttbezD/WgKLDYFJPEpdhp3tcllZEGY
	2IfZGTvKjVgxXEvDXDCRSOByV9SuIfuOH/G5k=
MIME-Version: 1.0
Received: by 10.220.101.96 with SMTP id b32mr1169265vco.270.1308407284932;
	Sat, 18 Jun 2011 07:28:04 -0700 (PDT)
Received: by 10.220.179.197 with HTTP; Sat, 18 Jun 2011 07:28:04 -0700 (PDT)
In-Reply-To: <4DFC51D6.5080508@eukrea.com>
References: <4DFC4A9F.9080104@gmx.net>
	<4DFC51D6.5080508@eukrea.com>
Date: Sat, 18 Jun 2011 23:28:04 +0900
Message-ID: <BANLkTinUqsr2E6HN_ZQhMhMnpnP77TJDpg@mail.gmail.com>
From: Han Hartgers <han.hartgers@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: FYI: Snowball (new low-cost board similar to beagle/panda)
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
X-List-Received-Date: Sat, 18 Jun 2011 14:31:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

> Next one in the list may be using an iMX6 from Freescale (in the page, this
> one is said to also target industrial applications and not only
> phones/tablets) :
> http://www.freescale.com/**webapp/sps/site/overview.jsp?**
> code=IMX6X_SERIES<http://www.freescale.com/webapp/sps/site/overview.jsp?code=IMX6X_SERIES>
> which will surely have its equivalent of the i.MX53's QSB :
> http://www.freescale.com/**webapp/sps/site/prod_summary.**
> jsp?code=IMX53QSB<http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=IMX53QSB>
>
> What is the general impression of this I.MX53 Quick Starter board?
It looks to be in a similar league as the Beagleboard xM.
It has a more memory, Sata, 2 SD card slots.  But at the down side
complicated expansion connector and less USB ports.

The main advantage of this board would be the hardware video encoder and
decoder and the better(?) software stack for that part. But I don't know if
it is really as good as mentioned on the website.
But a bit of a strange choice to have a good hardware encoder/decoder but no
dvi/hdmi connector (needs a daughter board.)
This (better supported?) hardware encoder/decoder would push this cortex-a8
to the level of (or beyond) the Pandaboard with it's dual core Cortex-a9 on
this video point.

The website http://imxcommunity.org/ does not look very active. (more email
on the beagle and panda mailing lists.)

I hope to hear from someone that owns / played with this board how it really
"works". Is there anyone with some experience with this board?

Greetings,

Han

