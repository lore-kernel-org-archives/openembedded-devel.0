Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9717773D16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 22:19:09 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so28610072igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 15:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=/okHJNshCA9QZqJMkn53KdQn+VzLZlkY8M62zz9gt9k=;
	b=K7df3AhiVfDnFRQBFihQL/HWWlRsnOsvsbMQWjpnDb5D/dQ9ZC8X+/FTiJ4nf1hUWR
	m9cwDnHjGi53B7vTnY+WtSMVyz0nTW9S4cSjeP26Q9qo11PO1GbktgQt9utgbzdeXjFU
	hqaBmO8Sk2L5ovjDlsMKFH6hnUX0X+rRQISSbQDaIZZspQBDMXRGZY1u/Xur14X4T3KD
	TbylBcj5IQ65C6Fnph7DPbYtwsfbfNPkwvWhuT7v7WmMbEb/iC1XZ1SKTaCu/ewo/Tys
	n6MREQbGbyTCYyQ/LUlJoCF4E2a/Hg8EH8VJb46w/A5vv86LfV/7MzaKuMNsQEIuGoza
	xQsQ==
X-Received: by 10.42.152.67 with SMTP id h3mr5602912icw.56.1431469150522;
	Tue, 12 May 2015 15:19:10 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by mx.google.com with ESMTPSA id
	x4sm12825341iod.26.2015.05.12.15.19.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 15:19:09 -0700 (PDT)
Message-ID: <55527C5A.4010900@gmail.com>
Date: Tue, 12 May 2015 18:19:06 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>	<20150511092704.GH2400@jama>	<10765250.9tBgYfV1HJ@peggleto-mobl.ger.corp.intel.com>
	<20150512144510.GC2714@jama>
In-Reply-To: <20150512144510.GC2714@jama>
Subject: Re: [meta-oe][PATCH 01/20] smstools: fix PN -> BPN for multilib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 22:19:09 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 05/12/15 10:45, Martin Jansa wrote:
> On Tue, May 12, 2015 at 01:43:19PM +0100, Paul Eggleton wrote:
>> On Monday 11 May 2015 11:27:04 Martin Jansa wrote:
>>> On Fri, May 08, 2015 at 03:42:16PM +0800, Yi Zhao wrote:
>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> Changes 03, 18, 20 didn't make it to patchwork, because they were marked
>>> as Spam by gmail
>> Hang on, I'm confused. Why should the patches being marked as spam in gmail 
>> have any bearing on whether they should show up in patchwork? Surely gmail 
>> shouldn't be involved in the sending part, only subsequently when the mail is 
>> sent from the mailing list to you (since you use gmail)?
> Isn't patchwork reading some gmail account over imap?
>
> The list of patches not appearing in patchwork is exactly matching with
> patches marked as spam in my inbox, so I believe that the same is
> happening in patchwork's gmail account.

Does anyone know if it helps when I notice them in "Spam" and mark them
as "Not Spam"?

