Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vandana.vuthoo@gmail.com>) id 1Nmihf-0003wn-Rj
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 08:09:14 +0100
Received: by iwn10 with SMTP id 10so1059200iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 23:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=J9Sbk02IraQw8pROcE8K1+QcObCB4zsQNpwFgsh9pF4=;
	b=Rap4qOar3bttuf8AInl85/AN1/qk4WyNBNqjgonS3RGN53tcWAfoaRXTIU41z+DaRF
	/S6ERaJfYyY/KomKLCbOEFR4Cp8Rrs6z6e5NdZPbHlcryImQylHao6gr0/vflHm1XkbW
	z5Y91cLLJr4u1T0HWgJ1p5q0ejxgCZFiHry3I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KcBv1sFMSgchLl+9Q0Ul5w3Buo0jSHuGnMbVD/DPsXI3jvrEpBhFBlFHiIv2UU/a9X
	GGW2NB8qo92+SCWyc2KiJxIWRnDHgzKCIXaIK/g0iqp8iuenqYCvr2WcvIofV4h9sang
	YktiSbDBUjK2hiIy1MAk7Q2QNd0uBf8qukmtY=
MIME-Version: 1.0
Received: by 10.231.150.2 with SMTP id w2mr269583ibv.90.1267599976072; Tue, 02 
	Mar 2010 23:06:16 -0800 (PST)
In-Reply-To: <19c1b8a91003022245w4efed14cs61d162040ea36149@mail.gmail.com>
References: <2b288bf1003022053g2dbca134s20b172e94911060e@mail.gmail.com>
	<19c1b8a91003022245w4efed14cs61d162040ea36149@mail.gmail.com>
Date: Wed, 3 Mar 2010 12:36:16 +0530
Message-ID: <2b288bf1003022306r17bb8db6xa4c7e585170b153f@mail.gmail.com>
From: Vandana Vuthoo <vandana.vuthoo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: vandana.vuthoo@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: locale support in OE
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
X-List-Received-Date: Wed, 03 Mar 2010 07:09:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

I used IMAGE_LINGUAS="en-us", there was a typo in writing the mail


On 3/3/10, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Mar 2, 2010 at 8:53 PM, Vandana Vuthoo <vandana.vuthoo@gmail.com>
> wrote:
>> Hi,
>> I need to know how to add diff locale supports in OE, I tried
>> IMAGE_LINGAUS but it is not working for me.
>
> if you used same as above then there is a typo it should be something like
> IMAGE_LINGUAS = "en-us"
>
>
>> Regards,
>> Vandana
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


