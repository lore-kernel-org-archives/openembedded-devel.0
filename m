Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <isburger@gmail.com>) id 1NwKlr-0004lF-J9
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 21:37:12 +0200
Received: by fxm20 with SMTP id 20so9613524fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 12:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=Dv5WN2T3/nxUnsA83ZRrsBUi8sTSgbo/EFrCpndJBX0=;
	b=N0bu5s+xE9NRSa7E341ywpgYhhKpePTnhTWxbDQ6XN87+nIoDN+ydXT9UkQC9y0v9p
	7NurXGBAhGDgUuDeis5yz9zmING9e9eLXP35Ro94V8cIA5b4mP6+NggCdsvAxY0c+D+d
	VfxY7jTMv5v8ZYvd9A/uNpxMRz3aTf34HXPGA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kKrd/r3m7sad+rIyBsEtwpHQfd4RE7tWBGtMkmO5qB7xjm0Le6IZXEH8JQLI0n4UhF
	nmsT2LsHxdCij7kg0yRLtCnRjfJZ1L+/PQaO4H50ci8H+NaivdNDTCXDsmeLeAEY2HPy
	XedncpRwd3RzC2kwouCyqYUuV2IGfeodHZHEs=
MIME-Version: 1.0
Received: by 10.223.108.66 with HTTP; Mon, 29 Mar 2010 12:33:57 -0700 (PDT)
In-Reply-To: <a25fc1971003291229o686565d7if29755e2b4bbe482@mail.gmail.com>
References: <a25fc1971003291229o686565d7if29755e2b4bbe482@mail.gmail.com>
Date: Mon, 29 Mar 2010 21:33:57 +0200
Received: by 10.223.15.133 with SMTP id k5mr2140880faa.39.1269891237483; Mon, 
	29 Mar 2010 12:33:57 -0700 (PDT)
Message-ID: <e2e2e5501003291233q2548ddbaif8d590b2637c1fc6@mail.gmail.com>
From: Izak Burger <isburger@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: isburger@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Porting OE to new hardware
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
X-List-Received-Date: Mon, 29 Mar 2010 19:37:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Bernard,

I found this page during my searches for similar info:

http://wiki.openembedded.net/index.php/Adding_a_new_Machine

Don't know how useful or up to date it is though, I'm still new to
these parts and to OE in general, but I thought I'd post that here in
case it is useful.

regards,
Izak


