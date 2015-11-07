Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA7275E2D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Nov 2015 06:06:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA766ZRB006237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Nov 2015 22:06:35 -0800 (PST)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 6 Nov 2015 22:06:34 -0800
Message-ID: <563D94E8.5020703@windriver.com>
Date: Sat, 7 Nov 2015 14:06:32 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1446541344-186769-1-git-send-email-wenzong.fan@windriver.com>
	<CAMKF1so9srmNQoPa3FdXx0QFQmc20dRe=jMOfDUsYa1ddSsUQg@mail.gmail.com>
In-Reply-To: <CAMKF1so9srmNQoPa3FdXx0QFQmc20dRe=jMOfDUsYa1ddSsUQg@mail.gmail.com>
Subject: Re: [PATCH][meta-python] python-pygpgme: add python-pygpgme 0.3
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
X-List-Received-Date: Sat, 07 Nov 2015 06:06:36 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2015 12:15 AM, Khem Raj wrote:
> On Tue, Nov 3, 2015 at 1:02 AM,  <wenzong.fan@windriver.com> wrote:
>> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6517bdc8f2416f27ab725d4702f7aac3"
>
> a single line licence ? what does it say, arent there other places
> where it states it more clearly.
>

Yes. The line 8 of PKG-INFO says: "License: LGPL".

There is not full text statement of LGPL license, I found pyrtm_0.2.bb, 
python-zopeinterface_4.1.1.bb also use the same ways.

Thanks
Wenzong


