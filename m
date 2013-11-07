Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3FB6D2DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 14:43:16 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id ma3so687526pbc.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 06:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=kQpB2yo2uXsVeCX7QDvIL4ns3/K12F5a6vpQskJ3KcE=;
	b=Cxq/IQ1Z477QxovnLuHuzJdeHgQH3/Je3z7/nX7gMUuu2wKKc5cBJ6x418VCFWmUP1
	qoVAP7nUP5SwDyjlqs2A/I1GhM12XAvZ2YR+DZn89XtSWMaeqF2ipJUqZDXqnx7qFOH9
	0J41UsQKS51r5RByO0zoX11XQ4cStYg4/A+e9pp9fCorpzeR9FHAjeyyAmbJrJNVrhwO
	tfWI2Yao2SFqugPFbdC3oV2hL1R5rtUwyyypxPPKOGn3lfVd0tjvP6OOC/7ZENIQ6nGI
	XUxGpGgPgfyAxa2QMhgc323Cu28/3dGh69HVk8kLUzQmXQROmiowwya+xP0+CMvD/Cr2
	oHPQ==
X-Received: by 10.66.155.102 with SMTP id vv6mr10091564pab.89.1383835397682;
	Thu, 07 Nov 2013 06:43:17 -0800 (PST)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	fk4sm6847817pab.23.2013.11.07.06.43.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Nov 2013 06:43:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1816\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <527A8C4C.3030007@balister.org>
Date: Thu, 7 Nov 2013 06:43:18 -0800
Message-Id: <90F3F14E-8CB6-4F1B-8C00-215FF84F2EBC@gmail.com>
References: <52797DE3.8070203@balister.org> <527A8C4C.3030007@balister.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1816)
Subject: Re: Create meta-sdr
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
X-List-Received-Date: Thu, 07 Nov 2013 14:43:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Nov 6, 2013, at 10:37 AM, Philip Balister <philip@balister.org> wrote:

> On 11/05/2013 03:23 PM, Philip Balister wrote:
>> Based on earlier discussion, we'd like to go ahead and create meta-ssdr
>> based on this branch:
>> 
>> https://github.com/balister/meta-oe/commits/meta-sdr
>> 
>> Can someone give me a hand getting this setup in git?
> 
> Or should I take this silence to suggest I should just host this on github?

we can host on oe git but I personally like github as well
do you just want to make a clone of whatever you have on github ?

> 
> Philip
> 
>> 
>> Thanks,
>> 
>> Philip
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> 
>> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


