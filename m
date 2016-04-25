Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5967760123
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 14:38:41 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id zy2so18315267pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 07:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Tt01EkNgKYghzJLd3QgAXyFJzQ2qU3pYvm3w4jt9JKk=;
	b=w13Yvi0/w1E42+PiHONc4kzMiMDWXlBiiFgyxo4FA/qk43fbGS6/olvgbgG6oLH9Jv
	C5GBxfrx9KG3QcjS3S+VTR4AELtoKBbpCJKofVL45Ss/cp9x/eQHJePrT3q+a0ibd7ZD
	/BHrlJ0kk68ntEbU68Qd86YqiWwxP+ssB416FdMMGtIKIrhDB+4+e1vd88G4xviPJwSX
	S8M5WSyNA1SBHgDcQqNeYo6RVtQ+zINHmrFcPEs3lBUlaUrZEtEfSym3vnLkWSzarKlO
	uTteRFvMK/bvyWPFlVIUCZ4Y/+/91bPvsy5LGOwF5kSDvZNWDrnB+uM0bpsrpZ88fBD2
	d2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Tt01EkNgKYghzJLd3QgAXyFJzQ2qU3pYvm3w4jt9JKk=;
	b=laNRqPCjxQcEQMJ54cyEIc2i4/s9NA8Y+Wh31HFl/a/hTO9BtNxtkuE97yy8B7JOW0
	/K+XzAqj1Ln0ss/SzzP0IlE/QWwpmWz/R8ZG+f3Wth8qyxYKSdHkS38C5EAXNLqqtb67
	khRz09In+SP2cOFXHYqU4lRODynujyneM5y06lh2MxI+fbolC0UkZJy/GptBryeSvNX+
	qP9nBzDEgkumLx9pZDF/+CSZS8KlGiLInwVvgoSsDosumDkvRAfqW6uAhJ4OWtuIAhmR
	TT/elCWXdAHJyGdPcGTXJrrjwyrQunDHPRehs5H9dGYZ38fkGIg1wSUCSFWWYvpovF+r
	XXbw==
X-Gm-Message-State: AOPr4FVVPhMSFjif3mqYy4jiKknlDh8gRHdagG48DT8n5uScn7zH4B1XZO1UkeaBhNa/DQ==
X-Received: by 10.66.1.99 with SMTP id 3mr48122348pal.26.1461595122537;
	Mon, 25 Apr 2016 07:38:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:606d:9ea8:d7b2:ab08?
	([2601:202:4000:1239:606d:9ea8:d7b2:ab08])
	by smtp.googlemail.com with ESMTPSA id
	b19sm20377005pfj.41.2016.04.25.07.38.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2016 07:38:41 -0700 (PDT)
To: Joe MacDonald <Joe_MacDonald@mentor.com>,
	George McCollister <george.mccollister@gmail.com>
References: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
	<CAFSKS=OrhdjemW+1t1uMpGUbcnP0s5JX59Z4mvv_hqPpwBXG_w@mail.gmail.com>
	<20160425140147.GB5188@mentor.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <571E2BEC.7030905@gmail.com>
Date: Mon, 25 Apr 2016 07:38:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160425140147.GB5188@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Update Samba
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
X-List-Received-Date: Mon, 25 Apr 2016 14:38:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Joe,


On 04/25/2016 07:01 AM, Joe MacDonald wrote:
> [Re: [oe] Update Samba] On 16.04.22 (Fri 11:30) George McCollister wrote:
> 
>> I'm looking forward to seeing these changes in krogoth as what is in
>> there now is unusable from a security standpoint. I cherry picked the
>> patches to krogoth and my builds suceeded but haven't gotten around to
>> doing any operational testing yet.
> 
> Agreed.
> 
> Armin:  I've already done one merge directly to krogoth to resolve a
> build breakage,

I just finished a a build myself and am seeing this warnings. Are these
covered by your changes? I can send patches if not.

WARNING: samba-4.4.2-r0 do_package_qa: QA Issue: samba rdepends on
libaio, but it isn't a build dependency, missing libaio in DEPENDS or
PACKAGECONFIG? [build-deps]
WARNING: samba-4.4.2-r0 do_package_qa: QA Issue: samba rdepends on
lttng-ust, but it isn't a build dependency, missing lttng-ust in DEPENDS
or PACKAGECONFIG? [build-deps]

 but since you're maintaining the branch I didn't want to
> do any additional ones (even though we started talking about samba
> specifically in the krogoth context) without an explicit go-ahead from
> you.
> 
> Do you want me to send you a patch set, a pull request or do you want me
> to merge the samba changes directly?

Go ahead and merged directly.

- Armin

> -J.
> 
>>
>> -George
>>
>> On Mon, Apr 18, 2016 at 4:00 PM, Joe MacDonald <joe_macdonald@mentor.com> wrote:
>>> I'm still doing some testing on this and I haven't built for all the
>>> architectures yet, but it passed at least the most basic smoke-test.  Given the
>>> number of outstanding CVEs against our current version of Samba (thanks Armin!
>>> :-)) I think it's best fo rus to update this rather than trying to do any
>>> back-ports, but that also introduces a not-inconsiderable level of risk for
>>> Samba users.  So please, if you're one of them, kick the tires on this as soon
>>> as you can (or ping me back letting me know what your thoughts are on this, at
>>> least).
>>>
>>> Thanks all.
>>>
>>> --
>>> -Joe MacDonald.
>>> :wq
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

