Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1C1B665C9C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 04:36:35 +0000 (UTC)
Received: by patj18 with SMTP id j18so72618656pat.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 21:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=geLf8CvtmHDCQqD+XCla8MlEh3KjEDR4eY0ab/0Q8jI=;
	b=abdup9//+X9ZOKSHDJQCJvFeg2k8QlUq/LeuS7jpP1MUryPpZY9s3WMRF4DWW0jinQ
	RqyOwVXajrvHAMiNYIcjDyKJQcOSAa7+rW8fTNMvT0VIIE+HzyLnKXWlOpCbeYz9bnE+
	htD6y3YJM8M3gyD1LKHGGDv0oS09tnsj6oA0ywtBZOJgtgqje5qRlz/ddC9HpBRRJ7Ej
	J2R0uWggfF3zhb4Wr2HtHvhgydfeqgspf4dPDw4oKcu5PnoVN0BoOG026+FOKLwatTdo
	oK0cvsix/A0HHKBJ2JHkpGBHKCVxO6tfyDr4l+0YNj+2noM6k9qVTFWEoNsjh5UDfLhv
	qLhg==
X-Received: by 10.66.144.36 with SMTP id sj4mr85177563pab.32.1427949395882;
	Wed, 01 Apr 2015 21:36:35 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:957f:ec67:f3ef:46c3?
	([2601:c:a700:3ba7:957f:ec67:f3ef:46c3])
	by mx.google.com with ESMTPSA id jx5sm3671406pbc.85.2015.04.01.21.36.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 21:36:34 -0700 (PDT)
Message-ID: <551CC748.6030907@gmail.com>
Date: Wed, 01 Apr 2015 21:36:24 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1427931203.git.akuster808@gmail.com>
	<20150402020428.GM14928@jama>
In-Reply-To: <20150402020428.GM14928@jama>
Cc: otavio@ossystems.com.br
Subject: Re: [PATCH 00/15] Fido add maintainers
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
X-List-Received-Date: Thu, 02 Apr 2015 04:36:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 04/01/2015 07:04 PM, Martin Jansa wrote:
> On Wed, Apr 01, 2015 at 04:43:34PM -0700, Armin Kuster wrote:
>> please consider these maintainers for the meta-openembdded fido branch
>>
>> The following changes since commit df6c7b1279790d27ebfd58fbdfbac89bde5782ec:
>>
>>    python-pyopenssl: Upgrade to 0.14 (2015-03-21 16:42:30 +0100)
>>
>> are available in the git repository at:
>>
>>    https://github.com/akuster/meta-openembedded akuster/fido-next
>>    https://github.com//tree/akuster/fido-next
>
> Would you mind (me) squashing them together so that it's easier to create the
> patch for next release?

yep. no problem.

- armin
>
>> Armin Kuster (15):
>>    meta-efl: update maintainers list
>>    meta-filesystems: update for fido maintainer
>>    meta-gnome: update maintainers list
>>    meta-gpe: update maintainers list
>>    meta-initramfs: update maintainers list
>>    meta-multimedia: update maintainers list
>>    meta-networking: update maintainers list
>>    meta-oe: update maintainers list
>>    meta-perl: update maintainers list
>>    meta-python: update maintainers list
>>    meta-ruby: update maintainers list
>>    meta-systemd: update maintainers list
>>    meta-xfce: update maintainers list
>>    meta-webserver: updated maintainers list
>>    toolchain-layer: update maintainers list
>>
>>   meta-efl/README             | 13 +++++++------
>>   meta-filesystems/README     | 14 +++++++++-----
>>   meta-gnome/README           | 12 +++++++-----
>>   meta-gpe/README             | 13 +++++++------
>>   meta-initramfs/README       | 11 ++++++-----
>>   meta-multimedia/README      | 14 +++++++-------
>>   meta-networking/MAINTAINERS |  8 ++++++--
>>   meta-networking/README      |  6 +++---
>>   meta-oe/README              | 11 ++++++-----
>>   meta-perl/README            | 10 ++++++----
>>   meta-python/README          | 11 +++++++----
>>   meta-ruby/README            | 12 +++++++-----
>>   meta-systemd/README         | 11 +++++++----
>>   meta-webserver/README       | 13 ++++++++++---
>>   meta-xfce/README            | 11 ++++++-----
>>   toolchain-layer/README      |  9 ++++++---
>>   16 files changed, 107 insertions(+), 72 deletions(-)
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

