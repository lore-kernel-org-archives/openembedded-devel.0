Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ticktock35@gmail.com>) id 1LtDEk-0007NB-MD
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Apr 2009 05:53:36 +0200
Received: by rv-out-0708.google.com with SMTP id k29so1599226rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Apr 2009 20:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=K0+GA95+uD9sC8uWvcvtmqlTHhGueNVkeTSw8QQwuHc=;
	b=SwesMlTYAK4EItdv6s/fxFtx+Vj8/YmiHeDT9kwoAqJMRvRfUotYFTAdJdCzWA2UJt
	yYOnsPYUS+f+8rtSBKIkErkUbmcGS600hQ/mj1lvsUMyhBo6T5NhO+y/zA3JZSmvsZ1X
	hJLSsOleazimnf1sZ0JUcRyf9eBZb0zP4QhBs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fI4Zmt2qYaU+YD+KkfGNTKYAf3Uk3gqdbNZRv4FVt8HQJEd1Cc24A7EWCn9yFoUG89
	K193yhHFHoAzQhrkr7E4hyMvlIWb7CNY646B8bYsVFTEY2QDduijYjvBRarRs1txV71x
	onncoAIrzO7wOTDzEUnc94d1F5VxJKbuVNVAs=
MIME-Version: 1.0
Received: by 10.141.12.15 with SMTP id p15mr2563724rvi.170.1239594602228; Sun, 
	12 Apr 2009 20:50:02 -0700 (PDT)
In-Reply-To: <grtddg$83m$2@ger.gmane.org>
References: <565965130904120524l46b9e4e7x4e8762ad9cbb1f6d@mail.gmail.com>
	<565965130904120819v5fde7a0fq8bf08a6fc6db08d5@mail.gmail.com>
	<grtddg$83m$2@ger.gmane.org>
Date: Mon, 13 Apr 2009 11:50:02 +0800
Message-ID: <565965130904122050y1ae4c29bje7a68297629367ef@mail.gmail.com>
From: Tick <ticktock35@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.198.244
X-SA-Exim-Mail-From: ticktock35@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bb file of madbutterfly
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
X-List-Received-Date: Mon, 13 Apr 2009 03:53:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Koen,
  Thanks a lot.
Cheers,
Tick

On Mon, Apr 13, 2009 at 2:54 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 12-04-09 17:19, Tick wrote:
>>
>> +++ b/recipes/madbufferfly/madbutterfly_git.bb
>
>> +PE = "0"
>> +PR = "r0.3"
>
> Remove those and add PV.
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


