Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5A53760123
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 14:43:30 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id y69so47622716pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 07:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Tt01EkNgKYghzJLd3QgAXyFJzQ2qU3pYvm3w4jt9JKk=;
	b=MZPvJtIKvh4i7pyJEv6O+klCWmb0OLaLSdyMRbh5a8/l53jift1Pio7+lEHhHCjdTv
	UH3fEqI1HuwIpR58t4fSd75wvYR3vk8ltCL3VUwsKkoFa56vmT7Ne8RbCVtYpPszvn+G
	UjXVOHcZx5kmRtuL1Wnu9FzwMe5CPSxnOfuJMiCiecuuN2NPqvOM9CYJYDas3Oq9AYj4
	+AJLyVosBukqxMuqDXU7PzxkhPPMoB4WXPoH+d0zZ38wtizeqo6cc0I2l/Jr7Fn2lbTl
	iN5tSJfuDbJFLy5f5SdO0ytOdVO75Mx+AHGEh4rwWdWLjKFI8tfE7jVi+0WIZ1QGXwCy
	JOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Tt01EkNgKYghzJLd3QgAXyFJzQ2qU3pYvm3w4jt9JKk=;
	b=ZLuqp+PfGFEUe0oxjjaL7hevBB9AMvBfTJhxyUgrvOmT15zXfs6F45Pn7FwXSA0yP6
	aum6H0hjPHwGRAH6TyE2BrvL4tzJn6C+CR0f+Cmk5y11b50m8BEeuNl7mLzhe447wvgg
	ApA28fp47tGYMUINodkkAE5eQmNdRIfrGadWuBzJ6dpR6BWZ2BT0NL4gbLdrm1EP/fVd
	xeM1FkXGMk6rs8hx6p3x6Q4fUXN5BvYD31vjcpRNHyEyBIIz7exuG8plBmO+tqYvaKNn
	ylJRet0LMq2c1gidwqkMLdnAnBMwYXdZLpxrifq6JJudlD1CpbxGA4ltHl+S0Q4Sm46c
	g0Gg==
X-Gm-Message-State: AOPr4FXQSQF/bPLJrLgYr58CcWAOEQtd6egtu6EYOKLNcR1VUcaX+HUiNsUHnINryiYybQ==
X-Received: by 10.98.16.198 with SMTP id 67mr49238732pfq.21.1461595411762;
	Mon, 25 Apr 2016 07:43:31 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:606d:9ea8:d7b2:ab08?
	([2601:202:4000:1239:606d:9ea8:d7b2:ab08])
	by smtp.googlemail.com with ESMTPSA id
	uw2sm30644557pac.10.2016.04.25.07.43.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2016 07:43:30 -0700 (PDT)
To: Joe MacDonald <Joe_MacDonald@mentor.com>,
	George McCollister <george.mccollister@gmail.com>
References: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
	<CAFSKS=OrhdjemW+1t1uMpGUbcnP0s5JX59Z4mvv_hqPpwBXG_w@mail.gmail.com>
	<20160425140147.GB5188@mentor.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <571E2D0D.1030209@gmail.com>
Date: Mon, 25 Apr 2016 07:43:25 -0700
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
X-List-Received-Date: Mon, 25 Apr 2016 14:43:31 -0000
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

