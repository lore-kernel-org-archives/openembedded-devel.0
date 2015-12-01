Return-Path: <asselsm@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 02D5265C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 03:01:08 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so155235520wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 19:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:date:message-id:subject:from:to
	:content-type; bh=n2vQdA3Ma9ri+qzjFwRAGRL78OuxbDp74XtTQGW7Grk=;
	b=fbb3RoxkqIQPoSN3rACgBPFB4wEdXmtunDaMcCEwh3qj4YcPTASFF6uK6uJTJT0U8O
	vy5Ai/kgR3ad+Owzrpznce4ZqwbemiJfcQNBGPrJyw0BbwQTloT7hj6rNrcOp5v4yZ80
	N2lLUkDQLSIjxWXemYYUD2RvFxc32h5KJdaT9hlpY0qAhrhFwrI15PQVoGegSAko2T8z
	i7nFqykGky5puQpJNN1FrTXdcsic59gdKnT4+taCtSOWyvD1uQguoCsNXDUqNQ1UtR+W
	7k9RSoKKhFnR0DhigX4hkfg5YQy47n/IE9bhDlq1EPEEp2NK+tL6w/opJQuvU//pNPQg
	CxNg==
MIME-Version: 1.0
X-Received: by 10.28.175.144 with SMTP id y138mr32109188wme.47.1448938869078; 
	Mon, 30 Nov 2015 19:01:09 -0800 (PST)
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.194.59.176 with HTTP; Mon, 30 Nov 2015 19:01:09 -0800 (PST)
Date: Mon, 30 Nov 2015 22:01:09 -0500
X-Google-Sender-Auth: p-6wV1PSx1Wj-J6jid-OBAzzZsQ
Message-ID: <CAPuovEJ8VKxjqWoXyUxw0VKLZy3E+uP4OTGjXMo6u7dKD9hQqw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python-cryptography, python-cryptography-vectors: uprev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Dec 2015 03:01:09 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 28, 2015 at 9:35 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Wed, Nov 25, 2015 at 3:11 AM, Anders Darander <anders@chargestorm.se> wrote:
>> * Tim Orling <ticotimo@gmail.com> [151124 19:00]:
>>
>>> We have never carried a license in meta-python, rather we use the
>>> common-licenses from oe-core (
>>> http://git.openembedded.org/openembedded-core/tree/meta/files/common-licenses
>>> ).
>>
>> Does the Unicode license exist under another name in oe-core? Otherwise,
>> I'd assume that Mark did the right thing to add it here.
>
> I will look around to see that it is not duplication. I will also try
> to assess the number of projects out there that might eventually be
> added to oe that would warrant us putting this in 'common-licenses'
> off the bat.

I have looked around and still feel this is the best place for the
license file. At any rate let me know if I should change this commit
and I will gladly make needed adjustments.

Thanks,
Mark

>
> Mark
>
>>
>> Cheers,
>> Anders
>>
>>> Regards,
>>
>>> --Tim
>>
>>> On Mon, Nov 23, 2015 at 9:13 AM, Mark Asselstine <
>>> mark.asselstine@windriver.com> wrote:
>>
>> --
>> Anders Darander, Senior System Architect
>> ChargeStorm AB / eStorm AB
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

