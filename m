Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MYTrg-0004zm-0X
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Aug 2009 01:56:20 +0200
Received: by qw-out-1920.google.com with SMTP id 4so2041898qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2009 16:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=IYPnhfdIqWxNDD6YjdFCNLu6C4AprAbYe0pWkTQaVFc=;
	b=DQg7cPxhDD1pzoWsSQSH2Irk7bkD63oErIjeb3y1F5eIgplOnnbjjlRtPj+4QpqMxg
	1SfSTAtZne2wAjmim7YlpqQNVGefiNQvrKYZJaAJWSjTnE9q43++ltT1pJkGhI+Mix/C
	pIAxjNWqh1fd9PWr2gzJsLnMfXhDZ3disDLpU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Ld5UC9CQHolEIrtl/iDNNhoM+4N9W2PTzTjy/aMUBHPp/NOqDQLdJkG8ATjd6IDPbk
	Co4nRAH8x9HmzEyjLUweTEoYKY6oGTu+EkLR/aB0nYnsjA0KWEAX+v97iNppy3Nce8AM
	2Da/wZX3N5cytDPypbONcsqiqZVYElTShbjoI=
MIME-Version: 1.0
Received: by 10.229.85.21 with SMTP id m21mr2108009qcl.9.1249429244437; Tue, 
	04 Aug 2009 16:40:44 -0700 (PDT)
In-Reply-To: <h58kp7$h6o$1@ger.gmane.org>
References: <20090803205909.GA24609@gmail.com> <h58kp7$h6o$1@ger.gmane.org>
Date: Tue, 4 Aug 2009 16:40:44 -0700
Message-ID: <19c1b8a90908041640r33d06e12gae1e7cf36e99cda1@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: Renaming gcc 4.4.0 to 4.4.1
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
X-List-Received-Date: Tue, 04 Aug 2009 23:56:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, Aug 3, 2009 at 11:34 PM, Koen Kooi<k.kooi@student.utwente.nl> wrote:
> On 03-08-09 22:59, Khem Raj wrote:
>>
>> Hi
>>
>> Now that gcc 4.4.1 is out I would like to add the recipe but if gcc
>> 4.4.0 is not been used then I would prefer to move gcc 4.4.0 to 4.4.1
>> and reduce a few recipes.
>>
>> If no one objects I will go ahead with moving them next week
>
> Don't forget to add the patch from
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=40887 if you do.
>

sure once it get approved.

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


