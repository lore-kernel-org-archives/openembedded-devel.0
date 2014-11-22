Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3A498721CC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Nov 2014 19:38:08 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id 29so3563543yhl.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Nov 2014 11:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=xPDJ8ZGmrjJUrFaDuBZHeeXL3V2I/G9qWdNu5Amvsh0=;
	b=bwDFobfh1NT0MhbzPqaEzBqNdUn9qho0nQz8xEralKsGQ3Rto8R2SAg05i/xmWg+hA
	v+MgHqknmFdbLmrmwtlycokqzxeP1L1em1FRcT+0TfGx6TUpQXNBINZIUuMW3t3ifuog
	EwNuaILjGsqU4sPyM+1gfn8KUWQ+f17monEDeiskArmwkiga66OvG6bvAKFPwleL8eT7
	E5ds7aI7OdkRWYgvksi7o5PPiN37eVxVvSWJFZIByra/+sU9kr3u7IKm/PblkZ4Rz8sQ
	UF2R3rJtd58YZ1EogXuxc+xTy7kT3ejeYExAjVpnX+D2a7ashykX82zSQ8HAWwPprpmm
	ngaw==
MIME-Version: 1.0
X-Received: by 10.170.130.202 with SMTP id w193mr10975962ykb.22.1416685088952; 
	Sat, 22 Nov 2014 11:38:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Sat, 22 Nov 2014 11:38:08 -0800 (PST)
In-Reply-To: <CANyK_8cO0k3Em27PPR_-OfexA2=jZ5WL9MeQPcawSfvEE6TQeg@mail.gmail.com>
References: <5470073C.5090706@gmail.com>
	<CANyK_8cO0k3Em27PPR_-OfexA2=jZ5WL9MeQPcawSfvEE6TQeg@mail.gmail.com>
Date: Sat, 22 Nov 2014 17:38:08 -0200
X-Google-Sender-Auth: UP1hG0mChYtpWG9oeh9YmChnFf8
Message-ID: <CAP9ODKoKxK0hn2gTBRXcXTz=2akrmtbAwcjxpoU-igNgo=Lz-A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Michael Halstead <michael@yoctoproject.org>
Subject: Re: meta-openembedded-contrib
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
X-List-Received-Date: Sat, 22 Nov 2014 19:38:10 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 22, 2014 at 9:52 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 22 November 2014 at 03:47, akuster808 <akuster808@gmail.com> wrote:
>> Is meta-openembedded-contrib still active? if so, how can one get permission
>> to create and submit changes via a contrib branch?

Any specific reason to not use github or bitbucket for it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

