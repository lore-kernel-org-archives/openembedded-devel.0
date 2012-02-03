Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rt7TB-0000OZ-1V
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Feb 2012 01:57:41 +0100
Received: by pbbb4 with SMTP id b4so2222243pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2012 16:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=fAdp64CLkQgDpsxALRQdFh0EYjWtlVdneiWDSGDQtfo=;
	b=uYgbp+8VEMEL0lnt59uy8Z7QROL10/YtdjjqQuSvK+DKffjRBrw54g9eboY2PG6AHL
	3yxAj8Zf71TBEHOlpcCWR2nUpfw9Q211W2G8MFiIc/HFkqZIUrMZXu/yCDnz/JRgd8Vd
	CLDjcSYvoO9SW5OKQ+/NCTvrqybzwVU+uTPEo=
MIME-Version: 1.0
Received: by 10.68.227.198 with SMTP id sc6mr12208359pbc.131.1328230183244;
	Thu, 02 Feb 2012 16:49:43 -0800 (PST)
Received: by 10.143.147.17 with HTTP; Thu, 2 Feb 2012 16:49:43 -0800 (PST)
In-Reply-To: <4F2AC67F.3040002@linux.intel.com>
References: <4F29DD37.6000509@emagii.com>
	<4F2AC67F.3040002@linux.intel.com>
Date: Fri, 3 Feb 2012 01:49:43 +0100
Message-ID: <CAAQYJAvndSJ4HOr5PzZ4mx830-R8EJ3fPaCbePpwAwmS8qkYOA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFJlY29tbWVuZGVkIMOFbmdzdHLDtm0vb2UtY29yZSBpbWFnZSB0byBzdGFydCAsIGZvciBhIGdyYXBoaWMgYXBwbGljYXRpb24gPw==?=
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
X-List-Received-Date: Fri, 03 Feb 2012 00:57:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 2, 2012 at 6:23 PM, Joshua Lock <josh@linux.intel.com> wrote:
>
>
> On 01/02/12 16:47, Ulf Samuelsson wrote:
>>
>> With openembedded classic, I have mostly been using derivatives of
>> x11-gpe-image for demos.
>>
>> What is close to this image in functionaliy with Angstrom/openembedded
>> core.
>>
>> Tried booting "core-image-sato", but that did not even have a shell...
>
>
> Define shell? core-image-sato has a terminal emulator and the ash shell f=
rom
> busybox.
>
> Cheers,
> Joshua
> --

...and even happens to run (a bit slowly atm) on old Zaurus SL-5600 32MB RA=
M !

Andrea


> Joshua Lock
> =A0 =A0 =A0 =A0Yocto Project "Johannes factotum"
> =A0 =A0 =A0 =A0Intel Open Source Technology Centre
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


