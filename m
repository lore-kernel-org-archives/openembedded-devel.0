Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KODIn-0008JF-5C
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jul 2008 17:09:21 +0200
Received: by an-out-0708.google.com with SMTP id b38so8031ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2008 08:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=Cicr5WBfhn1+ECMhMTwZc8RnExXWaYCnDhd7JJFoqKM=;
	b=A7vEea3/Exkpk2L7VzBl6vDgWqkZ5Z40smlU7PpOAOgyodJgecIAg1OCcBQLhZ7PRk
	bBeliaKxUsRNWjBs0yXzFX5X7BGzVlJmNaNvJ2++wNyihtOEYT3ypZyluMw/V0kEScLw
	7xOjtF6pPGO1cc1JCtTHtnFUmLHD0O/mWsPzI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=DEes/MYz3atcGiXYlEjRdWwaXY5JIoo3+tldNay08UiTbX+kzluUqNpJez/jbl5MUT
	oQIDob03q9qFtI5xvpNgc4mG6kMMphyoG1TalwI6xp4+ZXnHEk4rATWjTTVoC2+zYLa6
	d140R+M9w8wXyo4O+Z0kwUHr12cLksz3P1m4g=
Received: by 10.100.91.17 with SMTP id o17mr12986480anb.85.1217430458224;
	Wed, 30 Jul 2008 08:07:38 -0700 (PDT)
Received: by 10.100.166.17 with HTTP; Wed, 30 Jul 2008 08:07:38 -0700 (PDT)
Message-ID: <c384c5ea0807300807n43a86feax712a09a6a52d43ca@mail.gmail.com>
Date: Wed, 30 Jul 2008 17:07:38 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d2b9ea600807221407i2a429eacyd698ed42e55739af@mail.gmail.com>
MIME-Version: 1.0
References: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
	<c384c5ea0807220145n5a91d46eye0f00f15b95d01ee@mail.gmail.com>
	<d2b9ea600807221407i2a429eacyd698ed42e55739af@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 Jul 2008 15:09:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Esben,

On Tue, Jul 22, 2008 at 11:07 PM, Esben Haabendal
<esbenhaabendal@gmail.com> wrote:
> On Tue, Jul 22, 2008 at 10:45 AM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>> On Tue, Jul 22, 2008 at 10:11 AM, Esben Haabendal
>> <esbenhaabendal@gmail.com> wrote:
>>>
>>> Of-course, unless continous manual labor is to be required, we need to
>>> write a script or something like that to maintain the mirror repository.
>>>
>> I have written a "where is that package at" ("witpa") tool to help me
>> find old archives.
>>
> Hi Leon,
>
> Do you try to verify the validity of the new location of the
> package/archive?  Like comparing with a stored md5 from the file from
> the original/previous location?
>
Yes, I do.

Let me get that thing online.

I'll post to this list soon.
-- 
Leon


