Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PS32G-0004XT-Cz
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 08:41:29 +0100
Received: by ywi6 with SMTP id 6so3202876ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Dec 2010 23:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=bWy5/DA0z3cuhNsV2P2q/ssrWEJaxiNl0C0NDEPDU5s=;
	b=ThNJfbpViQ+uujbdKAXxdg7biQEsKAlWGLQJnx0pUuwifeLHaxHD0y6M3kFucmL52d
	Md+9cGtnCPFXgGy393BlmxP9GFsMvMjyTR0ytqlIu5E5WuUc9x19RRoPjsDmX/MrvBGi
	aHH4p/H1S0eYCFkQH509fKyg7hwFqwTxEauaE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=da7V/pqZ15zskmRDaF3vn4pt7iAJ3i8R280E8SDGXFWvCYRZQqrRG4kdk5q5NyYt7r
	av9H1eZ3dgrHQ27l7kS0t/Gud8DbLnERsAADffkHA2zdBjLguTVgz7mEW6hEEJlkbyHr
	JNvBtpwjJNIHwKJmKLqmHIngt95yBebQxqjiM=
Received: by 10.90.98.11 with SMTP id v11mr4577534agb.58.1292225988307; Sun,
	12 Dec 2010 23:39:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sun, 12 Dec 2010 23:39:28 -0800 (PST)
In-Reply-To: <AANLkTinyRWYTduFgvs3nKwvB4J=67Cj91CRPXai_yKr6@mail.gmail.com>
References: <AANLkTinb3AL5zchPtvqDfv7mRCi+eVO4_ESqr=AVd0Rw@mail.gmail.com>
	<4CFF61D2.60606@gravedo.de> <20101208110759.GA27687@excalibur.local>
	<4CFF7AEA.5010300@balister.org>
	<AANLkTinyRWYTduFgvs3nKwvB4J=67Cj91CRPXai_yKr6@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Dec 2010 23:39:28 -0800
Message-ID: <AANLkTimpy+QBbV9Kx09P=q946EL-vPL-534RzbKB7iUC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [ANNOUNCE] The new patchwork is here
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
X-List-Received-Date: Mon, 13 Dec 2010 07:41:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 8, 2010 at 3:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Dec 8, 2010 at 4:32 AM, Philip Balister <philip@balister.org> wrote:
>> On 12/08/2010 06:07 AM, Stefan Schmidt wrote:
>>>
>>> Hello.
>>>
>>> On Wed, 2010-12-08 at 11:45, Simon Busch wrote:
>>>>
>>>> On 07.12.2010 19:13, Khem Raj wrote:
>>>>>
>>>>> The patchwork has been setup newly. The url is live at
>>>>> http://patches.openembedded.org
>>>>> Please sign up for the new patchwork. The old patchwork data has not
>>>>> been moved to this one.
>>>>> Its still available on the usual old site. The
>>>>> contrib/patchwork/pw-am.sh script has been modified to grok the
>>>>> patches
>>>>
>>>> >from the new url.
>>>>>
>>>>> Depending on available time I might be able to add the patches that
>>>>> went in after the old patchwork stopped
>>>>> working. However it has started to catch the patches from now on.
>>>>>
>>>>> Let us know if there are any issues you encounter
>>>>

Please resend your patches to the mailing list that were not captured
in patchwork after the old patchwork stopped functioning
and new patchwork was not in service yet. This will help a lot in
getting them applied and reviewed.

Thank you for help

-Khem


