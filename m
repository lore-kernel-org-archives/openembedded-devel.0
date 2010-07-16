Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1OZm0T-0004BU-0l
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 16:35:21 +0200
Received: by wye20 with SMTP id 20so1997975wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 07:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=wN3eNemOu+1aa/dNAIMoW4AaG5yabsg61oGbuaIQKZQ=;
	b=XRxumxzQNwyeZcHi5/XvzFBkByGDBCO8LJhNWQjBqPBnmoyeTYhtxy8Ci/OjfCAyvb
	9dYkVc7Cz8YunrS5bkd8JAELdtv1TWwZEVSV3HppZAEQA6Ss+QEwIQsyUPZv0Y47iRwc
	bbOOekIf7quuBtFhDyFGxY0GgzFMWGpd6YQOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=u59/WUyAtMgFAlFWFlwkirQOveeTNslSRrMGplZ6cze5hQ3YrHZQyLnTN+C1OkX2Ge
	W0i1PPGjZDpPOBzcqoinUDFPbiFEPTjl6GBlgTzBf2P5lxi702vzMy6CZvcp5IRr3hOK
	ybeNXvpu7tx/5JcJvpUVNjRvFt0cgjoeEJnt0=
MIME-Version: 1.0
Received: by 10.227.138.129 with SMTP id a1mr993724wbu.114.1279290911366; Fri, 
	16 Jul 2010 07:35:11 -0700 (PDT)
Received: by 10.216.156.133 with HTTP; Fri, 16 Jul 2010 07:35:11 -0700 (PDT)
In-Reply-To: <1279290319.10837.1747.camel@rex>
References: <1279290319.10837.1747.camel@rex>
Date: Fri, 16 Jul 2010 10:35:11 -0400
Message-ID: <AANLkTilZ_BhgN8ZnWU5bwkACvtDysBOqoaMeB0nJjmHh@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: george.huntingtoniii@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: A new bitbake extension: .bbappend files
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
X-List-Received-Date: Fri, 16 Jul 2010 14:35:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

I love this idea.  seeing this would go a long way towards getting my
employers on board with using openembedded and even getting to contribute.

