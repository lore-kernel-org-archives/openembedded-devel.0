Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id B76A66D2E6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Nov 2013 01:32:16 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id at1so4563100iec.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Nov 2013 17:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=w3ty/8gi7dk52Xzqx1p9vpHIxWomU7d0DXE1O6tmrXE=;
	b=h/elNi2SowYnDYXJNuanlI9UozQtSk8CBvI3lTBDPLDBxqqRleVbUEksfFFxtfAW2u
	/XYmY8Od3GgV0XzhgVUwQQUgWU7JkpppkSevQpY9AmSyQe/jmCkprpSMXxz5QqH0jHoY
	N2NRmg0YrJjiKO3Q7QIuUnPSAeEFK4Cf2DEcVToEM0vtwiFeJ7tKK68bF+MBNHBDRvjh
	RsMracN5wJhUVyRLz4pt2OcMopDJUUXSTQA1SYyx1mPdSwKcExNYmEh5adrmG3eMtqsD
	Tw3L89n+6/jmt8qcegxxHt6PN1X2wLOtB2Rzcrm74SUA7NV+4aozniJ7uI2G+V7YV60m
	e4sg==
X-Received: by 10.50.61.179 with SMTP id q19mr4651689igr.33.1383960737904;
	Fri, 08 Nov 2013 17:32:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Fri, 8 Nov 2013 17:31:47 -0800 (PST)
In-Reply-To: <527D862B.5060500@balister.org>
References: <52797DE3.8070203@balister.org> <527A8C4C.3030007@balister.org>
	<90F3F14E-8CB6-4F1B-8C00-215FF84F2EBC@gmail.com>
	<527BE002.30300@balister.org> <527D862B.5060500@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Nov 2013 17:31:47 -0800
Message-ID: <CAMKF1sonEAZmzw5T8HsRRfSA-wxYB+f1k8d3CuhJkUD_Mj=DvA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sat, 09 Nov 2013 01:32:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 8, 2013 at 4:47 PM, Philip Balister <philip@balister.org> wrote:
> On 11/07/2013 10:46 AM, Philip Balister wrote:
>> On 11/07/2013 06:43 AM, Khem Raj wrote:
>>>
>>> On Nov 6, 2013, at 10:37 AM, Philip Balister <philip@balister.org> wrote:
>>>
>>>> On 11/05/2013 03:23 PM, Philip Balister wrote:
>>>>> Based on earlier discussion, we'd like to go ahead and create meta-ssdr
>>>>> based on this branch:
>>>>>
>>>>> https://github.com/balister/meta-oe/commits/meta-sdr
>>>>>
>>>>> Can someone give me a hand getting this setup in git?
>>>>
>>>> Or should I take this silence to suggest I should just host this on github?
>>>
>>> we can host on oe git but I personally like github as well
>>> do you just want to make a clone of whatever you have on github ?
>
> After some more thought, I'll put this layer on github, then I can use
> the wiki there for some docs. When I have this in pace, I'll send the
> rm's for the existing recipes in meta-oe.
>

OK I think its a good choice lot more features for git repository you
get free issue tracker
wiki and so on.

