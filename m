Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1OYwNU-00086t-8j
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 09:27:36 +0200
Received: by fxm12 with SMTP id 12so3068773fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 00:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=esUP2Mt198Bwk+IS9RFdRpQ8vEsZnzaQUg4kOnNulp0=;
	b=U1yd8S4xGVIAOgqg+CoRGwvo9n3RwmIN1N0U9L64XdcGQsF3cYMyJyXeqqdTIU63f+
	XQyZL44gz4txmYxc7J6kpV4mGvIugfKfXMxas15tsnInDZz4vfssbhquP2pOi6di4kw7
	EY5ecniNwrTg1Hq2Gie/DuDvwfMZU8722+Pok=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=og6XVC66qveX8kbmugDvcnxeI1/wXKOrOQDr/9FjoZeYNs4lBGdpLEt2YoPfQJWfTn
	dCFd1yB3r+H4ionGciMACjt5T58cboTPPyE+EiRZ/hdXxNe9Z7TDjcZR1Z7PfegyhTfS
	2T8tMEyYyKCPWiQx3lcGnCA2KpLwvOJkp5Hj4=
MIME-Version: 1.0
Received: by 10.239.190.78 with SMTP id w14mr281472hbh.197.1279092453179; Wed, 
	14 Jul 2010 00:27:33 -0700 (PDT)
Received: by 10.239.181.207 with HTTP; Wed, 14 Jul 2010 00:27:32 -0700 (PDT)
In-Reply-To: <AANLkTimXB5CusyFxI_DF8g51O2wQed1i-RljaGY2OCOy@mail.gmail.com>
References: <1278577398.15825.1.camel@lenovo.internal.reciva.com>
	<1278778757-31330-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1278850318.2345.1909.camel@mill.internal.reciva.com>
	<AANLkTimXB5CusyFxI_DF8g51O2wQed1i-RljaGY2OCOy@mail.gmail.com>
Date: Wed, 14 Jul 2010 09:27:32 +0200
Message-ID: <AANLkTildISo587mMgQUPyNcgHNOShJODCIu0HccsvCpN@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: introduce COMPATIBLE_TARGET_SYS
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
X-List-Received-Date: Wed, 14 Jul 2010 07:27:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 12, 2010 at 8:24 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> BTW: there are other ways to reduce parsing time, but people do not
> like it if I mention them :-)

I for one, would like if you cared to mention them, please :-)

/Esben


