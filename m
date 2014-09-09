Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id B3467702D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 12:38:29 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 79so2907362ykr.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Sep 2014 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=eHLEeINrszeRn597c4/bpc2sxPl9QQrFffo63im5tV8=;
	b=k8+oUUkEslwGVcsDNTBzRPH2Oh8H/GG0kfWvEkfEfWAltWkpx7Lrb/g4BZdMy/vuYq
	13QGCYCUoEWJVOlpbDbx8JtpXAFZWmuCJaeDO9jWjreHdTQ0QETdsDJhOdAqFNdEPQ3n
	Fb6YLpT+cJxHZxd+a5KA2N6Qnj4v+Xg5rEHiE9Kfu2KVeNzEeMFx8gUX1d9o08gVoNEJ
	lu7pKIP3AsUwmsKMYdcNFHNLmPaMhqW7/Svc+RLsU6xiOtVDPUP9rjd34k5dj7Bmogyt
	S5MqQgFoSB/82HCCLD2TlBAJ+hru5nwYgBFpnYrA1PLbnApPots6RQZV06TrmOUBs8Xq
	vNMQ==
MIME-Version: 1.0
X-Received: by 10.236.96.167 with SMTP id r27mr51713030yhf.42.1410266310217;
	Tue, 09 Sep 2014 05:38:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Tue, 9 Sep 2014 05:38:29 -0700 (PDT)
In-Reply-To: <CALRGHr98gwgsSQQ9tnLBan-XybFqXN=VoMKYueh5YWhOVXFWXQ@mail.gmail.com>
References: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
	<CAP9ODKqZyLwdSGVSResWqOsxTLfPMXhGbh9a1mZL16RTG8nPsQ@mail.gmail.com>
	<CALRGHr9ts28vt-JN2v4SPKjd7-btmWrqVd7G=_cfcv4bGD_z1g@mail.gmail.com>
	<CALRGHr_u5LULhoxx0NLYK6Uux4uZ5Kr7+ikOY-TKqMvDfUfYmg@mail.gmail.com>
	<CAP9ODKp=xaS+WoQe-zKTpcKiqmdk4mHteoZ8a9BqO1w96hcbxg@mail.gmail.com>
	<CALRGHr_OiFeW60BsKxe0XdrBbkcXAE+usv3-=pHnhXCzONK_vg@mail.gmail.com>
	<CAP9ODKoBFp7Pskwch4nLq4mkJOB-uFh1m2w7zz46LZ=CUp5JAg@mail.gmail.com>
	<CALRGHr9iRe3j9j0ce2RnOz7TP+1UzaPqtE5vsooBze_A0fAuyA@mail.gmail.com>
	<CALRGHr98gwgsSQQ9tnLBan-XybFqXN=VoMKYueh5YWhOVXFWXQ@mail.gmail.com>
Date: Tue, 9 Sep 2014 09:38:29 -0300
X-Google-Sender-Auth: hOmgiPfFgtG-JlBYVzSQmaKDDEE
Message-ID: <CAP9ODKqbwXrieO8yUJYu6+vBK6qerCCZsamkbz6RO5vS0Wq_oA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Error while bitbake meta-toolchain-qt5
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
X-List-Received-Date: Tue, 09 Sep 2014 12:38:29 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 9, 2014 at 6:12 AM, Switesh Fulpagare
<switesh.fulpagare@mindastoneridge.com> wrote:
> Correction in last mail,
>
> But now only one error is encountering as  qtwayland-native_git.bb, do_fetch

I pushed the fix.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

