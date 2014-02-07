Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8B0E36E8CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2014 20:01:18 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id i17so6784802qcy.39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Feb 2014 12:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=7yk1qtOxJ2Ki0g6uBx6YrZ3a7KXDyCUKBLadZxkPurc=;
	b=cN/esCwLnQiweMyClWqk/m2pO1CxgTP9rU7Af5Tuhi0ZJMMl9SKyBSK+2DODq1kb9M
	4WAL5XMwI85yVvWtYlKLPvDhVH6tRh8iFMd9CGExPPO67vJ7zvimuwgCNQ2AHwxe/i71
	j3ICthMr7kZKc6VaqXTmCyciEAU8zzisIs2Du/EvVtLbhbxsh19WdjHGsDCByxRHBo6N
	ITJJM9MnBZ8vJGUFJGL3bVTtUyjhY1w/qzCLXGzv/tENAe6O4g3VHg+0IhQtLuMUis7F
	sNJbY7VZUYxYpJezkfdvL+dL135CemIeYXmHM4oN53DA/WBtdfXGBT1BnE1X4+BPNQbW
	lmow==
X-Gm-Message-State: ALoCoQmcotWRFUl0YoFmqU7CrX3OBdY28nDB0nboxPNuyW39ZVPrb8DKxPBnihUMJnKde0yBWv8s
X-Received: by 10.140.42.180 with SMTP id c49mr24175391qga.24.1391803278907;
	Fri, 07 Feb 2014 12:01:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Fri, 7 Feb 2014 12:00:58 -0800 (PST)
In-Reply-To: <CAJTo0LbcJjzSdUj20JbH=5ym9zhuMQUCG5j4zW3Y5j=Ucf4HyA@mail.gmail.com>
References: <CAFeBWL5iManz=rkRY+FZ4aK-6+KdwZRBhQnso6HiLP32yFF7Gw@mail.gmail.com>
	<CAJTo0LbcJjzSdUj20JbH=5ym9zhuMQUCG5j4zW3Y5j=Ucf4HyA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Feb 2014 20:00:58 +0000
Message-ID: <CAJTo0LaE7XMraZZqSHZj73Jf2o-HV7VoeLyQ136w6H_c_GEAhA@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: dbus-daemon-proxy repository has disappeared
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
X-List-Received-Date: Fri, 07 Feb 2014 20:01:18 -0000
Content-Type: text/plain; charset=UTF-8

Just contacted Collabora.  They were having a spring clean, the repo
will hopefully re-appear shortly.

Ross

On 7 February 2014 19:51, Burton, Ross <ross.burton@intel.com> wrote:
> On 7 February 2014 18:59, Adam Lee <adam.yh.lee@gmail.com> wrote:
>> I am tracking refs/heads/dora and this morning I got a fetch failure on
>> dbus-daemon-proxy (git://
>> git.collabora.co.uk/git/user/alban/dbus-daemon-proxy). No available
>> mirrors, so I am build blocked.
>
> Have you tried emailing Alban at Collabora?
>
> Ross

