Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KODf7-0005Tv-HE
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jul 2008 17:32:25 +0200
Received: by an-out-0708.google.com with SMTP id b38so9717ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2008 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=FgpSAOPEWGxwPjcvuJLiGcdMaqLfRrG+6uXYQ6dvQws=;
	b=dmEf5bmfv3fj5Q0U/HW8VyIgfS9OqivkM0rO/cqElxKK4ka+t2MEjx8nSQx4E0Xa1K
	BdHezNsnPy51okfWHpIrWACOVCumA3XVJMTBmJ+ESpmFLdjGEHkPrUuG7xoGBD7cSRHW
	VnR7fTWiFtk9TzEse7wRFSk4J+/+q6acXkXCg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=ml9Sz2eWpCKEXXfJSHYrGNA2o5iZJICqnBTT5byzHTHTa95iYUhlQMTi1mmhfZAO+M
	Wq7ikj+j6OlsxYf+P9kJy6qOkdoFoF5+2YFU5wIq2XtNHqykkwL3KfVrtGX22Lbfl9rZ
	v0rupLfY60TjwKOswajzYRarajRN3PJOdcJeA=
Received: by 10.100.128.20 with SMTP id a20mr12945263and.153.1217431842737;
	Wed, 30 Jul 2008 08:30:42 -0700 (PDT)
Received: by 10.100.166.17 with HTTP; Wed, 30 Jul 2008 08:30:42 -0700 (PDT)
Message-ID: <c384c5ea0807300830m5ba547b0k6956dca66b3713c8@mail.gmail.com>
Date: Wed, 30 Jul 2008 17:30:42 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0807300807n43a86feax712a09a6a52d43ca@mail.gmail.com>
MIME-Version: 1.0
References: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
	<c384c5ea0807220145n5a91d46eye0f00f15b95d01ee@mail.gmail.com>
	<d2b9ea600807221407i2a429eacyd698ed42e55739af@mail.gmail.com>
	<c384c5ea0807300807n43a86feax712a09a6a52d43ca@mail.gmail.com>
Subject: Re: Stable source repository
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 30 Jul 2008 15:32:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Wed, Jul 30, 2008 at 5:07 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> On Tue, Jul 22, 2008 at 11:07 PM, Esben Haabendal
> <esbenhaabendal@gmail.com> wrote:
>> On Tue, Jul 22, 2008 at 10:45 AM, Leon Woestenberg
>> <leon.woestenberg@gmail.com> wrote:
>>> On Tue, Jul 22, 2008 at 10:11 AM, Esben Haabendal
>>> <esbenhaabendal@gmail.com> wrote:
>>>>
>>>> Of-course, unless continous manual labor is to be required, we need to
>>>> write a script or something like that to maintain the mirror repository.
>>>>
>>> I have written a "where is that package at" ("witpa") tool to help me
>>> find old archives.
>>>
>> Hi Leon,
>>
>> Do you try to verify the validity of the new location of the
>> package/archive?  Like comparing with a stored md5 from the file from
>> the original/previous location?
>>
> Yes, I do.
>
> Let me get that thing online.
>
> I'll post to this list soon.
> --

Done. See the new thread on OE-devel.

Regards,
-- 
Leon


