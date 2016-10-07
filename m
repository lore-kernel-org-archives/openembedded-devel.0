Return-Path: <igor.socec@pelagicore.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id C52DC7197C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 15:50:36 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id i130so4595429wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 08:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=78lpm223g0q0vRq3XV6f7/japlF64C7NnCiHGJ3LhYA=;
	b=GbssMYzyaBNWfAzmK7FZ/5DF7huc0iaSlPSEfU2lYn36mxyJL0cN+E1BSoVDZ4AZ/j
	VUafaSvUHHtu38xy+U0xKwc+BtaIOOBFmSbEIxl+aWXzV4t0v1P5uGUpq49xLR/gg2oo
	dI1mC1cPW2C4JxHCcrtaxwVdaeeZ3MGx9+8n0VMp0vfuIVDrOQSqqDi8OP6a45SfctuG
	ei0WDWSqKppYdQP00nfQ6+oSBJv+p7j/pYWJVReYKVQ1kp5JgVHW9KXaQqD7rqg7gtk3
	oBA+dbIOADgfj14tOL6KB1EgVgObIlFo+mc/q04aEckq9fAawVDEBPbTnF4gT6Jmt2C6
	IBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=78lpm223g0q0vRq3XV6f7/japlF64C7NnCiHGJ3LhYA=;
	b=QHjgy5LzljwI7Bj8Xwd17BhqoLUxOMhU1Lc5uXWJVUi31Kk1lywCyBDVj4q3XNuNa/
	2WO8k9FjtHFeL0RJy7ixsYxCyVyb7W69sOfHhkdaCX78WN0jtT0eDaXO1U/3mbThA5uY
	VXotcc9dZ+Lzh59vXO1ysTHvbLJ5KeMoPvrEHrUCkaGyFxEBAY0+QIzYM/OcXrbmbVrj
	GAFlrl0FAX1GCFqjtbSs7bptYKRAb3r5eo04NPAd8r0Y/MbHba2YJKpC/Z0tvhIZ1y77
	0gJCeFVrnx0LbSm3oqCHAHdwdyEObDsDDbuzzbPgnqRMd5jgWKeTZNm40gk7FQq8VeCh
	XLsA==
X-Gm-Message-State: AA6/9RknDxwnSdPLLx7H+OIYTB+KCu4x4aY0NaUmU/eKwAFw8J46aglTxJoibHhwYT7SL5P5kUDrf9Lhoc3y7+Yd
X-Received: by 10.194.2.83 with SMTP id 19mr7651620wjs.71.1475855437021; Fri,
	07 Oct 2016 08:50:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.170.138 with HTTP; Fri, 7 Oct 2016 08:50:36 -0700 (PDT)
In-Reply-To: <7F3E06C7-3B86-4BA4-B157-F06436A518C9@gmail.com>
References: <CAMKF1soNE54yHLS5tm25yZa68d=vitr7ETHjEWbqK10_-etxFw@mail.gmail.com>
	<20161007085121.16502-2-igor.socec@pelagicore.com>
	<7F3E06C7-3B86-4BA4-B157-F06436A518C9@gmail.com>
From: Igor Socec <igor.socec@pelagicore.com>
Date: Fri, 7 Oct 2016 17:50:36 +0200
Message-ID: <CAAqTWWTLjydwr4-yzsrutTOVOSCYziWzx2P43svsq0S27LFPZA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] jansson: update to 2.9
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
X-List-Received-Date: Fri, 07 Oct 2016 15:50:37 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 7, 2016 at 5:15 PM, Khem Raj <raj.khem@gmail.com> wrote:
> what changed in license?
>

The copyright date changed from 2012 to 2016, see below:

2.4: https://github.com/akheron/jansson/blob/3279aacdeed2aac96741c02e2ddecbb5ae087ff8/LICENSE

2.9: https://github.com/akheron/jansson/blob/master/LICENSE

Cheers,
-- 
Igor Socec
Software Engineer

PELAGICORE | Experience Change
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
Mobile: +46 (0)76 8666477
E-Mail: igor.socec@pelagicore.com

Registered Office Gothenburg Sweden
Registration No. 556780-4199

