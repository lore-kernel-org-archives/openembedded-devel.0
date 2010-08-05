Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oh9V4-0005Ei-Jk
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 01:05:35 +0200
Received: by iwn38 with SMTP id 38so588152iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 16:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pg1+DbSsPwCV1kvWXQqxGe2415/a8LuhF/Csy2L4zw8=;
	b=lF+X2p6OWeEG6p8t87qounAgvezcfjVhOYckgXtmVHvIJMlbUvNRcHEFvc5pzq6CN5
	jXAf40B/RaXkV8WxsrO3n2aC+8D6htM60BG/Gw61xkXWuk9tanicyrck2y3lLaYVbG1S
	kJ6Xq7TGZPwdBkhmVmomlTyq1xZILZL971iqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=T7vyLR/m3YK4Gyt6cHJai0LMu4ogGHQbnLX3A9JNYn9QIFW7CRy6hmN1x+FYTYD1Gi
	Nsrl+xF7duLC12I6FWgI+6c7NlL9Z8zI1fIFPlfiwh2+dr30h/tHBBiJ2re4Q/FYrG6D
	rL0uhuR9v1jqIZ3/9qm+DVfV1L7GBzu/uByZE=
MIME-Version: 1.0
Received: by 10.231.157.143 with SMTP id b15mr12798553ibx.113.1281049517913; 
	Thu, 05 Aug 2010 16:05:17 -0700 (PDT)
Received: by 10.231.145.77 with HTTP; Thu, 5 Aug 2010 16:05:17 -0700 (PDT)
In-Reply-To: <AANLkTim=VSMEHmSaQJJzg1pQbs=VrMhgQx7akNFe-0KK@mail.gmail.com>
References: <i3f3gm$5lu$1@dough.gmane.org>
	<AANLkTim=VSMEHmSaQJJzg1pQbs=VrMhgQx7akNFe-0KK@mail.gmail.com>
Date: Fri, 6 Aug 2010 08:35:17 +0930
Message-ID: <AANLkTi=9Hv1t_u0-re_r5=GYvLnuu4GXz+OHRbpT9tKq@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patchwork, please keep patches up to date
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
X-List-Received-Date: Thu, 05 Aug 2010 23:05:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 6 August 2010 08:03, Graham Gower <graham.gower@gmail.com> wrote:
> On 6 August 2010 05:00, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> I had a look around patchwork and I noticed lots of duplicates and
>> already applied patches are still in the queue, so I have a small reques=
t:
>>
>> Could the people sending patches to this mailinglist update their status
>> in patchwork? And can people applying patches also update the status?
>
> Ok, I created an account and logged in. There is a checkbox next to
> each line. Now what?
>
> Is there supposed to be some way to link your account with the
> accountability for certain patches, thereby giving one the ability to
> delete them? I assume this is an admin/moderator task.
>
> Do I only get accountability for a patch if it is sent to the list
> after an account is created for the same email address? Let me test
> that with a bogus patch...
>
>
> --- a/recipes/foo/bar.bb
> +++ b/recipes/foo/bar.bb
> @@ -10,7 +10,7 @@ frobnobble
> =A0here is some context
> =A0here is some more
>
> -i am a baaaad line
> +i am a less baad line
> =A0more context
> =A0yet more context
>


Feel free to ignore my stupidity. One has to actually click on the
patch to change its state.

-Graham


