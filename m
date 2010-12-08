Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PQTKA-00007j-CC
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 00:21:26 +0100
Received: by gxk21 with SMTP id 21so941761gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Dec 2010 15:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=gSPJP3qrXpzRyaxV28X7VjkcB8yc8KBLyW2Q4VqXMWo=;
	b=L3pnlhDvNNCuFeKjlmdqCdC3J0S+Psd6sO4d3tLRdsOOHOUo5Ji0teojERMCwjn6b2
	XRuEf5sSE0CuTmXyIIQ93+FC1JIo1BNrzG0+tgX2M3R55HkPrhwKFSS17TKJJG7cDzlN
	a6CO8uy7moUVwovV663GE8Cs3CSwPGvULyj3M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=IYZjHwKs9DNShAJLe1+3uJO2nqx5ZOhjl9RwYKm5VIq8mfN28HqYjrup7BPbZ8QzOV
	NsxEJk6IKUltklFHKeM98MrkqP1UPNo8TvPTviRXr2a/QsHXfLo8PNNsYhbHD5SjVjOH
	E9TFscIJZg67Bey5DBhGgIjfYAZi70LjbRoqg=
Received: by 10.90.25.9 with SMTP id 9mr12524947agy.48.1291850395831; Wed, 08
	Dec 2010 15:19:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 8 Dec 2010 15:19:35 -0800 (PST)
In-Reply-To: <4CFF7AEA.5010300@balister.org>
References: <AANLkTinb3AL5zchPtvqDfv7mRCi+eVO4_ESqr=AVd0Rw@mail.gmail.com>
	<4CFF61D2.60606@gravedo.de> <20101208110759.GA27687@excalibur.local>
	<4CFF7AEA.5010300@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Dec 2010 15:19:35 -0800
Message-ID: <AANLkTinyRWYTduFgvs3nKwvB4J=67Cj91CRPXai_yKr6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.179
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
X-List-Received-Date: Wed, 08 Dec 2010 23:21:26 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 8, 2010 at 4:32 AM, Philip Balister <philip@balister.org> wrote:
> On 12/08/2010 06:07 AM, Stefan Schmidt wrote:
>>
>> Hello.
>>
>> On Wed, 2010-12-08 at 11:45, Simon Busch wrote:
>>>
>>> On 07.12.2010 19:13, Khem Raj wrote:
>>>>
>>>> The patchwork has been setup newly. The url is live at
>>>> http://patches.openembedded.org
>>>> Please sign up for the new patchwork. The old patchwork data has not
>>>> been moved to this one.
>>>> Its still available on the usual old site. The
>>>> contrib/patchwork/pw-am.sh script has been modified to grok the
>>>> patches
>>>
>>> >from the new url.
>>>>
>>>> Depending on available time I might be able to add the patches that
>>>> went in after the old patchwork stopped
>>>> working. However it has started to catch the patches from now on.
>>>>
>>>> Let us know if there are any issues you encounter
>>>
>>> This includes that everyone has to create a new account for the new
>>> installation, right?
>>
>> Yes.
>
> Hopefully the new registration process reduces the number of spam accounts
> the admins need to deal with.
>
> Philip
>

The folks who signed and can commit to dev branch has been added to pw
maintainer list for details see

http://patches.openembedded.org/project/oe/

If I missed some please let me know.
This means these folks can update status of any patch. I am hopeful
that this will help us to manage
the patch queue more efficiently. Please update the state fields
accordingly so other maintainers
know if someone is already working on committing a patch.

Patch states are self evident I guess, if you need help ask on IRC or
ml. Please make sure to update patchwork
when a patch is acted upon.

Thanks
-Khem


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


