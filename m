Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7D295600EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 21:57:02 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 194so13147465pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 13:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=bKxXkD10BmtLDXOk/d8yFF8sTCbez1JYmFgefjQTCGo=;
	b=uYUWSeLP8VNlc/O7CRNYtleVMKSg0MtqrnNH5Aw2Gj8wwOjn5hLpNXUoMRa2RwOX3L
	EpEgy+U/EQR2CPymLgO/Am20660+QEbmyWm8RJfyURdQ3Uc0WH//CuSM7qsLydch+hIB
	EYHpu1zmRrvbyXqXHj7BCnOyjJK4WbbTPdhztwl3hWQjWRpvpRLmchWq20rjyFGjWlK3
	M5zpWBpQ2sQCUt6YGQoaLoLlRN1w28S6KBlMvtntO5ohwGE+PQFJJXXyjI8LzSM04oMr
	isjGYBqE6ojNfCqoJuYNHjEQ6LI0bB5QijxSkZLbjCrK7wkjfNSwsWay/jVazjtkoVyP
	6vqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=bKxXkD10BmtLDXOk/d8yFF8sTCbez1JYmFgefjQTCGo=;
	b=M8d7VkEdk6oidWDLPq9c9+t0nYRrI2SX5Mb+aoeVEmUCnFX62H2fZ6ut6dsyBQ6Y/t
	5sZRNOmpKdz57oa2InYq89Nk7K0VFNadCMFlzJHDaN3WX4M/qJwd/+y11ohzm4GQA3ts
	qBjAckVqRf3jkb8lzNuvnkaaMetj2ahSZPPESufe2lVpddSoamS+J0x3aIkwzCRx8j8W
	0QKrZ4T/Ftsl9f3B0fXzAOka0pjQbo/JSEqUNfIgyZiKimOU8a7ADDaDY35sklnLocBK
	rNhm8B0c8IyE4eRJyTSg1odKTOuXV78Wr1d6427Hv7AuPXLtST5KClAo4YaOxnvI83ff
	4aEA==
X-Gm-Message-State: AIkVDXJaCdVG1+8zK4Ne9IBKE97TqqRKKlkSjr+6LQsuqrexTt6xhUcLhYj8ZMdtcS7ihQ==
X-Received: by 10.99.177.6 with SMTP id r6mr22765132pgf.61.1486504622936;
	Tue, 07 Feb 2017 13:57:02 -0800 (PST)
Received: from [10.43.100.166] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	j28sm14032811pfj.2.2017.02.07.13.57.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Feb 2017 13:57:02 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1486399174-28949-1-git-send-email-akuster808@gmail.com>
	<caa1a269-b4e4-9909-967f-c637146fc4ba@gmail.com>
	<1486453274.14889.135.camel@intel.com> <20170207102518.GA3276@jama>
	<1486465148.14889.140.camel@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <198657c0-9cc4-ebad-7ce3-fece22b73c18@gmail.com>
Date: Tue, 7 Feb 2017 13:57:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486465148.14889.140.camel@intel.com>
Subject: Re: Patchwork-Status via email
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
X-List-Received-Date: Tue, 07 Feb 2017 21:57:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 02/07/2017 02:59 AM, Patrick Ohly wrote:
> On Tue, 2017-02-07 at 11:25 +0100, Martin Jansa wrote:
>> On Tue, Feb 07, 2017 at 08:41:14AM +0100, Patrick Ohly wrote:
>>> On Mon, 2017-02-06 at 09:10 -0800, akuster808 wrote:
>>>> please drop. this is fixed via a change in master-next.
>>>>
>>>> http://cgit.openembedded.org/meta-openembedded/commit/?h=master-next&id=2e83e33c592543045a7761907d8cd62937e1e60d
>>> Let's see whether the magic keyword works :-)
>>>
>>> [Patchwork-Status: Superseded]
>>>
>>> https://patchwork.openembedded.org/patch/136794/
>>>
>>> -- 
>>> Best Regards, Patrick Ohly
>>>
>>> The content of this message is my personal opinion only and although
>>> I am an employee of Intel, the statements I make here in no way
>>> represent Intel's position on the issue, nor am I authorized to speak
>>> on behalf of Intel on this matter.
>> If it was supposed to update status on Patchwork, then it didn't work
>> it's still in "New" state.
> Jose, in your "parsemail: Set patch state from email metadata" patch you
> said that it "allows project maintainers to change a patch status
> directly from an email message".
>
> Can you clarify who the "project maintainers" are who can use this email
> interface?

The list of maintainers (if its the same list) can be found on

https://patchwork.openembedded.org/project/oe/

BTW, is there any doc on the keywords?

- armin
> What about this use case here: the original author wants to retract a
> patch. Can he do that via email and/or the web interface?
>
> I wasn't the original author and probably also no project maintainer, so
> I guess that's why my email had no effect. Can we enable some kind of
> error response for such cases?
>


