Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1P8lXA-00049n-Ls
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 05:09:41 +0200
Received: by wwi17 with SMTP id 17so1734315wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 20:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=nvpv9UcxejJv/ggIWgOLqG0yJL8HC99PH/YDYUWimbU=;
	b=ZRnmGdmsN4l3HtVdmHSYvf9W6PEiKU3HBTF9qcOHrpQet4P+PsstzgfxrIKNUEwAds
	U8vBDHjkIUDoXy8UAHAZKSY5NvJSs08079AiduQq4f2bNhHeJUEvqp/lpcdDdNruvQuH
	RYeYpsxjQqYW1xgkTfx08CCY/3L9gcNkj/RiA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=AMJmcUQGsOYMT4R5FXX+PZTlCr2Bmc7yQV1V/vHL3IoBWA1pYWKCelR3IKIDq1sYll
	amLXI1hc8ZAQuJ0ORbQuHTi33UUKKTy3IlZnfZaCrfW6F0+ZDnnwj10im986G+ur/voQ
	V2HHyYFy513gzqJ+3vfyywjTsReMnVtN/0GmA=
MIME-Version: 1.0
Received: by 10.216.181.84 with SMTP id k62mr308991wem.76.1287630534410; Wed,
	20 Oct 2010 20:08:54 -0700 (PDT)
Received: by 10.216.23.13 with HTTP; Wed, 20 Oct 2010 20:08:54 -0700 (PDT)
In-Reply-To: <AANLkTi=BRC8V5VRWuBKac750eoS79eeBtaiyDOYGwzgo@mail.gmail.com>
References: <AANLkTi=BRC8V5VRWuBKac750eoS79eeBtaiyDOYGwzgo@mail.gmail.com>
Date: Wed, 20 Oct 2010 20:08:54 -0700
Message-ID: <AANLkTinjTE+9Ppy--CKhgZtfTrvZR65WuExevm1KhNQf@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-gumstix-2.6.15 & gumstix_2.6.5-gnalm1: removed outdated recipes
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
X-List-Received-Date: Thu, 21 Oct 2010 03:09:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 19, 2010 at 12:11 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Could not easily reply to the message because it was so long (gmail
> took ages) but:
>
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Acked-by: Steve Sakoman <steve@sakoman.com>

Steve


> Ash, do you have commit access, or does someone needs to push this for you?
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


