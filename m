Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KLP6Q-0003b7-0l
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jul 2008 23:08:58 +0200
Received: by rv-out-0708.google.com with SMTP id f25so2156609rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2008 14:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=wO+MroMSg2xScXVFZxQwXBeOlOvvWN9R2iHoLlSN4Kk=;
	b=s4x59/rl2+zm8Ig8jX81GASxredPnJRH1ojpGWqWdYIo8A70/bQCJZk7KwiGcBf3WU
	MywWxjZysv9IUsj3/IykEkV72ULNPtbdRxVFx4m6rQT4Z+9sQkadrRgC0nCEwFixLE5w
	X206l9OW4/+6vEpicZU15x3U59CoE8j5xdUcM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=eby2CB47pVxmXOFXmWUMR/r/C0eHYqK+EJxpAlBXTiXmyofYhsM0mdXRxxsNokk2UH
	/NDw0SZBeBraMmxh18xHX7aYGhryOSUEmsbnOvE/sy5A2O9M+ooxGrp4G8xe07BSYPup
	LTOGzgGoTNbQgqb0HwVTsOQIoJ0V37zhYHR9g=
Received: by 10.140.164.1 with SMTP id m1mr159158rve.69.1216760869186;
	Tue, 22 Jul 2008 14:07:49 -0700 (PDT)
Received: by 10.141.116.18 with HTTP; Tue, 22 Jul 2008 14:07:49 -0700 (PDT)
Message-ID: <d2b9ea600807221407i2a429eacyd698ed42e55739af@mail.gmail.com>
Date: Tue, 22 Jul 2008 23:07:49 +0200
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0807220145n5a91d46eye0f00f15b95d01ee@mail.gmail.com>
MIME-Version: 1.0
References: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
	<c384c5ea0807220145n5a91d46eye0f00f15b95d01ee@mail.gmail.com>
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
X-List-Received-Date: Tue, 22 Jul 2008 21:08:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jul 22, 2008 at 10:45 AM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> On Tue, Jul 22, 2008 at 10:11 AM, Esben Haabendal
> <esbenhaabendal@gmail.com> wrote:
>>
>> Of-course, unless continous manual labor is to be required, we need to
>> write a script or something like that to maintain the mirror repository.
>>
> I have written a "where is that package at" ("witpa") tool to help me
> find old archives.
>
> I will submit it to OE.

Hi Leon,

Do you try to verify the validity of the new location of the
package/archive?  Like comparing with a stored md5 from the file from
the original/previous location?

/Esben


