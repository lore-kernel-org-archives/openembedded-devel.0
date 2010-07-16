Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <simonsonc@gmail.com>) id 1OZmyn-0006Un-UB
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 17:37:53 +0200
Received: by vws3 with SMTP id 3so2739471vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 08:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9F2IFRbR65fzYLIG/K9d/KWgsj196HihQinLL0Zq76I=;
	b=VbuSDgEL5urPB4s4nQBgyOuiJWS9qNGbj52cVLZIFbC5Qu03jdQpEBnhXRZeQ2v769
	z9r66/iLYmJyq9CpERUVDIYLCRY0GYqBBQPB7eL679kKCBHejQsTKeJpQQFCiXNh26tO
	h+6gXqHP5xj75rM6f14sUJIuxl6JtqQN01hCA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aXUvK7aDpYmjNvIGlaw2I5wzNguyBsjNOqupZQsI+ecy3Gmi4XYGEcMARiQ14tpJK6
	iUBfsRFc8uS6ygrodj5d0Z6ocm7o/wCR9RkU3fLZyg7nHySnvevQNkFRw7g5kJLhvtOC
	+1+8EQjFxqouFQ1oVu1Ir0vzj+duLWjgctNlU=
MIME-Version: 1.0
Received: by 10.220.158.9 with SMTP id d9mr650438vcx.105.1279294645264; Fri, 
	16 Jul 2010 08:37:25 -0700 (PDT)
Received: by 10.220.94.141 with HTTP; Fri, 16 Jul 2010 08:37:25 -0700 (PDT)
In-Reply-To: <AANLkTilZ_BhgN8ZnWU5bwkACvtDysBOqoaMeB0nJjmHh@mail.gmail.com>
References: <1279290319.10837.1747.camel@rex>
	<AANLkTilZ_BhgN8ZnWU5bwkACvtDysBOqoaMeB0nJjmHh@mail.gmail.com>
Date: Fri, 16 Jul 2010 10:37:25 -0500
Message-ID: <AANLkTilEVfQgK6ImmdoaFM9jwiSNZIYGI4haHkd5i3kS@mail.gmail.com>
From: Carl Simonson <simonsonc@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: simonsonc@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Fri, 16 Jul 2010 15:37:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I like it too.

So does this mean that PR bumps happen in the bbappend file? Obviously
you need to have the recipe rebuilt if a change is made.

Carl Simonson
simonsonc@gmail.com



On Fri, Jul 16, 2010 at 9:35 AM, George C. Huntington, III
<george.huntingtoniii@gmail.com> wrote:
> I love this idea. =C2=A0seeing this would go a long way towards getting m=
y
> employers on board with using openembedded and even getting to contribute=
.
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


